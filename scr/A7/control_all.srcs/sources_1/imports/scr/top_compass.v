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
module top_compass(
	input clk,
	input rst,
	input data_rx,
	output data_tx,
	output [39:0] data_zhinan    //方位     ASCII码
   );
	
	wire en;
	wire [7:0] data_1;


	compass_tx_control compass_tx_control(
	.clk(clk),
	.rst(rst),
	. data_out(data_tx)
    );
	
	
	compass_UART_RX compass_UART_RX(
	.clk(clk),
	.rst(rst),
	.data_rx(data_rx),
	.tx_en(en),
	.rx_data(data_1)
    );
	
	
	compass_data_process compass_data_process(
	.clk(clk),
	.rst(rst),
	.data_in(data_1),
	.rx_done(en),
	.data_zhinan(data_zhinan)
    );
	
	
	
	
	
	

	

endmodule
