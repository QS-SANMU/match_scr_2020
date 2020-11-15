`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:52 08/05/2020 
// Design Name: 
// Module Name:    UART 
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
module UART(
	//system signal
    input				clk,
    input				rst,
	//rx_in
    input				data_in,
	//tx_in
    input		[7:0] 	data_tx,
	input				tx_en,
	//tx_out
    output 				data_out,
	//rx_out
	output 		[7:0] 	data_rx,
	output				rx_vld//uart接收到,拉高一个周期
    );

    wire tx_en_ins;

    UART_RX UART_RX(
    .clk(clk),
    .rst(rst),
    .data_rx(data_in),

    .rx_data(data_rx),
    .tx_en(rx_vld)
    );
	
    UART_TX UART_TX(
    .clk(clk),
    .rst(rst),
    .tx_data(data_tx),
    .tx_en(tx_en),

    .data_out(data_out)
    );


endmodule
