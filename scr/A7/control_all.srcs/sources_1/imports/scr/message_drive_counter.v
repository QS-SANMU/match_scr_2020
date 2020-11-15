`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:08 10/17/2020 
// Design Name: 
// Module Name:    counter 
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
module message_drive_counter(
	input clk,
	input rst,
	output flag
    );
	
	localparam cnt_end = 29'd500_000_000 - 1'b1;
	
	reg [28:0] cnt;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		cnt <= 29'd0;
	else if(cnt == cnt_end)
		cnt <= 29'd0;
	else
		cnt <= cnt + 1'b1;


	reg clk_10s;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		clk_10s <= 1'b0;
	else if(cnt == cnt_end)
		clk_10s <= 1'b1;
	else
		clk_10s <= 1'b0;
	
	
	
	assign flag = clk_10s;


endmodule
