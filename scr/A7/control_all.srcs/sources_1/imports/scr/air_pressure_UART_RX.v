`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:31:03 09/22/2020 
// Design Name: 
// Module Name:    UART_RX 
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
module air_pressure_UART_RX(
	input clk,
	input rst,
	input data_rx,
	output tx_en,
	output [7:0] rx_data
    );

	wire rx_en;
	wire rx_sel_data;
	wire [3:0] rx_num;

	air_pressure_bps_rx air_pressure_bps_rx(
	.clk(clk),
	.rst(rst),
	.rx_en(rx_en),
	
	.rx_sel_data(rx_sel_data),   //波特率的计数的中心点（采集数据的使能信号）
	.rx_num(rx_num)   //一帧数据0~9
    );
	
	air_pressure_rx air_pressure_rx(
	.clk(clk),
	.rst(rst),
	.data_rx(data_rx),
	.rx_num(rx_num),
	.rx_sel_data(rx_sel_data),
	
	.rx_en(rx_en),
	.tx_en(tx_en),
	.rx_data(rx_data)
    );

endmodule
