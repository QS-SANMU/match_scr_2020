`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:08 10/14/2020 
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
module light_top(
	input clk,
	input rst,
	input data_rx,
	output [23:0] data_l_out
	//output [5:0] seg_select,
	//output [7:0] seg_data_out
   );
	
	wire en;
	wire [7:0] data_1;


	
	UART_RX UART_RX(
	.clk(clk),
	.rst(rst),
	.data_rx(data_rx),
	.tx_en(en),
	.rx_data(data_1)
    );
	
	
	

	
	
	light_data_process light_data_process(
	.clk(clk),
	.rst(rst),
	.data_in(data_1),
	.rx_done(en),
	.data_l_o(data_l_out)
    );
	
endmodule
