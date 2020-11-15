`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:34 11/08/2020 
// Design Name: 
// Module Name:    clk_0_5 
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
module clk_0_5(
	input clk,
	input rst_n,
	output reg flag
    );
	
	reg [25:0] cnt ;
	
	always@(posedge clk or negedge rst_n)
	if(!rst_n)
		cnt <= 26'd0;
	else if(cnt == 26'd300_000 - 1'b1)
		cnt <= 26'd0;
	else
		cnt <= cnt + 1'b1;


	always@(posedge clk or negedge rst_n)
	if(!rst_n)
		flag <= 1'b0;
	else if(cnt == 26'd300_000 - 1'b1)
		flag <= 1'b1;
	else
		flag <= 1'b0;
		


endmodule
