`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:50 10/22/2020 
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
module top_finger(
	input clk,
	input rst,
	input data_in,	
	//finger out to finger
	output data_out,
	//finger to fpga to usart
	output check_ok,
	output check_no
	);
	
	wire cmd_1 ;
	wire cmd_2 ;
	wire cmd_3 ;
	wire rx_cmd_1_yes;
	wire rx_cmd_2_yes;
	wire rx_cmd_3_yes;
	wire rx_cmd_1_no;
	wire rx_cmd_2_no;
	wire rx_cmd_3_no;
	
	wire [3:0] state;
	
	wire rx_done;
	wire [7:0] data;
	
	

	
	

	
	finger_cmd_sel finger_cmd_sel(
	.clk(clk),
	.rst(rst),
	.cmd_1(cmd_1),
	.cmd_2(cmd_2),
	.cmd_3(cmd_3),
	.data_out(data_out)
    );
	
	finger_cmd_center finger_cmd_center(
	.clk(clk),
	.rst(rst),
	.rx_cmd_1_yes(rx_cmd_1_yes),
	.rx_cmd_2_yes(rx_cmd_2_yes),
	.rx_cmd_3_yes(rx_cmd_3_yes),
	.rx_cmd_1_no(rx_cmd_1_no),
	.rx_cmd_2_no(rx_cmd_2_no),
	.rx_cmd_3_no(rx_cmd_3_no),
	.cmd_1(cmd_1),
	.cmd_2(cmd_2),
	.cmd_3(cmd_3),
	.check_ok(check_ok),
	.check_no(check_no),
	.state(state)
    );
	
	finger_data_rx finger_data_rx(
	.clk(clk),
	.rst(rst),
	.rx_done(rx_done),
	.data_in(data),
	.state(state),
	.rx_cmd_1_yes(rx_cmd_1_yes),
	.rx_cmd_2_yes(rx_cmd_2_yes),
	.rx_cmd_3_yes(rx_cmd_3_yes),
	.rx_cmd_1_no(rx_cmd_1_no),
	.rx_cmd_2_no(rx_cmd_2_no),
	.rx_cmd_3_no(rx_cmd_3_no)
    );
	
	finger_UART_RX finger_UART_RX(
	.clk(clk),
	.rst(rst),
	.data_rx(data_in),
	.tx_en(rx_done),
	.rx_data(data)
    );
	
	
	


endmodule
