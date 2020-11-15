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
module red_lazer_temp_top(
	input clk,
	input rst,
	input data_rx,
	output [15:0] data_o_o,  //体表温度高八位为十位，低八位为个位
	output [15:0] data_a_o   //环境温度高八位为十位，低八位为个位
    //output [5:0] seg_select,
    //output [7:0] seg_data_out
   );
	
	wire en;
	wire [7:0] data_1;
	wire [7:0] data_o;
	wire [7:0] data_a;
	
	wire [11:0] dd_1,dd_2;
	

	
	UART_RX UART_RX(
	.clk(clk),
	.rst(rst),
	.data_rx(data_rx),
	.tx_en(en),
	.rx_data(data_1)
    );
	
	
	red_lazer_temp_data_process red_lazer_temp_data_process(
	.clk(clk),
	.rst(rst),
	.data_in(data_1),
	.rx_done(en),
	.data_o_out(data_o),
	.data_a_out(data_a)
    );
	
	red_lazer_temp_BIN_BCD red_lazer_temp_BIN_BCD_1(
	.bin(data_o),
	.bcd(dd_1)
    );
	
	red_lazer_temp_BIN_BCD red_lazer_temp_BIN_BCD_2(
	.bin(data_a),
	.bcd(dd_2)
    );
	
	//seg_show seg_show(
	//.clk(clk),
	//.rst(rst),
	//.data_in_1({4'b0000,dd_1[7:4]}),
	//.data_in_2({4'b0000,dd_1[3:0]}),
	//.data_in_3(),
	//.data_in_4({4'b0000,dd_2[7:4]}),
	//.data_in_5({4'b0000,dd_2[3:0]}),
	//.data_in_6(),
	//
	//.seg_select(seg_select),
	//.seg_data_out(seg_data_out)
    //);
	

	assign data_o_o = {4'b0000,dd_1[7:4],4'b0000,dd_1[3:0]};
	assign data_a_o = {4'b0000,dd_2[7:4],4'b0000,dd_2[3:0]};

endmodule
