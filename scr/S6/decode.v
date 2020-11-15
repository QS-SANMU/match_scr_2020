`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:43:23 05/29/2020 
// Design Name: 
// Module Name:    decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decode(
    clk,
	rst_n,
	po_data,
	rx_down,
	wfifo_wr_en,
	wfifo_wr_data
    );

input clk;
input rst_n;
input [7:0]po_data;
input rx_down;
output reg wfifo_wr_en;
output reg[15:0]wfifo_wr_data;

reg [1:0]number;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    number <= 0;
	else if(rx_down && number == 1)
	    number <= 0;
	else if(rx_down)
        number <= number + 1'b1;


always @(*)
    if(!rst_n)
	    wfifo_wr_data <= 0;
    else if(rx_down && number == 1)
        wfifo_wr_data <= {wfifo_wr_data[15:8],po_data};
    else if(rx_down)
        wfifo_wr_data <= {po_data,wfifo_wr_data[7:0]};	
	else 
        wfifo_wr_data <= 0;      

always @(*)
    if(!rst_n)
	    wfifo_wr_en <= 0;
    else if(rx_down && number == 1)
        wfifo_wr_en <= 1;
    else 
	    wfifo_wr_en <= 0;




endmodule
