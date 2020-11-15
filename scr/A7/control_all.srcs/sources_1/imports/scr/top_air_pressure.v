`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:36 10/25/2020 
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
module top_air_pressure(
	input clk,
	input rst,
	input data_in,
	output [55:0] data_p,
	output [39:0] data_h
    );
	
	wire rx_done;
	wire [7:0] data;
	
	air_pressure_UART_RX air_pressure_UART_RX(
	.clk(clk),
	.rst(rst),
	.data_rx(data_in),
	.tx_en(rx_done),
	.rx_data(data)
    );
	
	air_pressure_data_process_airpresure_seahigh air_pressure_data_process_airpresure_seahigh(
	.clk(clk),
	.rst(rst),
	.rx_done(rx_done),
	.data_in(data),
	.data_p(data_p),      //airpressure 
	.data_h(data_h)       //high
    );
	
	


endmodule
