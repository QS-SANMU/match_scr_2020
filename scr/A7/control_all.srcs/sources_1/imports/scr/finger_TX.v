`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:04 08/05/2020 
// Design Name: 
// Module Name:    TX 
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
module finger_TX(
    input clk,
    input rst,
    input [7:0] tx_data,
    input tx_en,
	output tx_done,
    output data_out
    );

    wire tx_sel_data_ins;
    wire [3:0] tx_num_ins;

    finger_bps_tx finger_bps_tx(
    .clk(clk),
    .rst(rst),
    .tx_en(tx_en),

    .tx_sel_data(tx_sel_data_ins),
    .tx_num(tx_num_ins)
    );

    finger_uart_tx finger_uart_tx(
    .clk(clk),
    .rst(rst),
    .tx_num(tx_num_ins),
    .tx_sel_data(tx_sel_data_ins),
    .data_in(tx_data),
	.tx_done(tx_done),
    .data_tx(data_out)
    );


endmodule
