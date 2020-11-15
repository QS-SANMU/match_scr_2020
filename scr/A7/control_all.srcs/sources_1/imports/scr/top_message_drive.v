`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:14 10/17/2020 
// Design Name: 
// Module Name:    top 
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
module top_message_drive(
	input clk,
	input rst,
	output data_tx
    );
	
	
	wire en;
	
	message_drive_counter message_drive_counter(
	.clk(clk),
	.rst(rst),
	.flag(en)
    );
	
	message_drive_message_tx message_drive_message_tx(
    .clk(clk),
	.rst_n(rst),
	.key_flag(en),
	.line_tx(data_tx)
    );


endmodule
