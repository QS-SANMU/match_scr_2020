`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:06 10/23/2020 
// Design Name: 
// Module Name:    cmd_sel 
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
module finger_cmd_sel(
	input clk,
	input rst,
	input cmd_1,
	input cmd_2,
	input cmd_3,
	output reg data_out
    );
	
	
	reg [2:0] flag;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		flag <= 3'd0;
	else if(cmd_1)
		flag <= 3'b100;
    else if(cmd_2)
		flag <= 3'b010;
    else if(cmd_3)
		flag <= 3'b001;
    else 
		flag <= flag;
    
					
	always@(posedge clk or negedge rst)
	if(!rst)	
		data_out <= 1'b1;
	else	
		case(flag)
			3'b100 : data_out <= cmd_1_o;
			3'b010 : data_out <= cmd_2_o;
			3'b001 : data_out <= cmd_3_o;
			default : data_out <= 1'b1;
		endcase
	



	finger_uart_tx_continuously_cmd_1 finger_uart_tx_continuously_cmd_1(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_1),
	.tx_data(cmd_1_o)
    );
	
	finger_uart_tx_continuously_cmd_2 finger_uart_tx_continuously_cmd_2(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_2),
	.tx_data(cmd_2_o)
    );
	
	
	finger_uart_tx_continuously_cmd_3 finger_uart_tx_continuously_cmd_3(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_3),
	.tx_data(cmd_3_o)
    );

endmodule
