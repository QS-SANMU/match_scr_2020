`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:27 09/22/2020 
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
module top_mpu(
	input clk,
	input rst,
	input data_in,
	output data_done,
	output [9:0] X,
	output [9:0] Y,
	output [9:0] Z
	);
	
	wire rx_en;
	wire [7:0] data;
	
	assign data_done = rx_en;

	mpu_UART_RX mpu_UART_RX(
	.clk(clk),
	.rst(rst),
	.data_rx(data_in),
	.tx_en(rx_en),
	.rx_data(data)
    );
	
	
	mpu_data_process mpu_data_process(
	.clk(clk),
	.rst(rst),
	.rx_done(rx_en),
	.data_in(data),
	.X(X),
	.Y(Y),
	.Z(Z)
    );
	
endmodule
