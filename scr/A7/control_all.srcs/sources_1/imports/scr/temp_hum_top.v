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
module temp_hum_top(
	input clk,
	input rst,
	input data_rx,
	output [39:0] data_t,    //温度     ASCII码
	output [39:0] data_h     //湿度     ASCII码
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
	
	
	temp_hum_data_process temp_hum_data_process(
	.clk(clk),
	.rst(rst),
	.data_in(data_1),
	.rx_done(en),
	.data_t(data_t),
	.data_h(data_h)
    );
	
	
	
	//seg_show seg_show(
	//.clk(clk),
	//.rst(rst),
	//.data_in_1(data_t[39:32]),
	//.data_in_2(data_t[31:24]),
	//.data_in_3(),
	//.data_in_4(data_t[15:8]),
	//.data_in_5(data_t[7:0]),
	//.data_in_6(),
	//
	//.seg_select(seg_select),
	//.seg_data_out(seg_data_out)
    //);
	

	

endmodule
