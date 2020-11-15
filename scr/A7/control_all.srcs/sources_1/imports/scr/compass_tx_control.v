`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:49 10/31/2020 
// Design Name: 
// Module Name:    tx_control 
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
module compass_tx_control(
	input clk,
	input rst,
	output data_out
    );
	
	reg [25:0] cnt;
	reg en;
	wire en_tx;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		cnt <= 26'd0;
	else if(cnt == 26'd5_000_000 - 1'b1)
		cnt <= 26'd0;
	else
		cnt <= cnt + 1'b1;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		en <= 1'b0;
	else if(cnt == 26'd5_000_000 - 1'b1)
		en <= 1'b1;
	else
		en <= 1'b0;
		
	assign en_tx = en;
	
	compass_TX compass_TX(
    .clk(clk),
    .rst(rst),
    .tx_data(8'h31),
    .tx_en(en_tx),
    .data_out(data_out)
    );


endmodule
