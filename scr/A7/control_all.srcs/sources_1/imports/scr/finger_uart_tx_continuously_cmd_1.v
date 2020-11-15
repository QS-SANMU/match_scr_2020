`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:43 10/23/2020 
// Design Name: 
// Module Name:    uart_tx_continuously_cmd_1 
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
module finger_uart_tx_continuously_cmd_1(
	input clk,
	input rst,
	input tx_start,
	output tx_data
    );
	
	wire [7:0] data;
	wire en;
	wire tx_done;

	
	
	finger_TX finger_TX(
    .clk(clk),
    .rst(rst),
    .tx_data(data),
    .tx_en(en),
	.tx_done(tx_done),
    .data_out(tx_data)
    );
	
	
	finger_tx_contr_cmd_1 finger_tx_contr_cmd_1(
	.clk(clk),
	.rst(rst),
	.tx_start(tx_start),
	.tx_done(tx_done),
	.tx_en(en),
	.data_out(data)
    );

endmodule
