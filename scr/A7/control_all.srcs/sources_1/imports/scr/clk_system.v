`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/06 21:15:28
// Design Name: 
// Module Name: clk_system
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_system(
	input clk,
	input rst_n,
	output reg clk_s
    );

	

	
	always@(posedge clk or negedge rst_n)
	if(!rst_n)
		clk_s <= 1'b0;
	else
		clk_s <= ~clk_s;
	
	
	
	
endmodule
