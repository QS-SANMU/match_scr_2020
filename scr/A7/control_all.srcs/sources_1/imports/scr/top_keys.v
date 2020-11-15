`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:05 10/18/2020 
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
module top_keys(
	input clk,
	input rst,
	input up_in,
	input down_in,
	input left_in,
	input right_in,
	input midle_in,
	output up_out,
	output down_out,
	output left_out,
	output right_out,
	output midle_out
    );
	
	wire up,down,left,right,midle;

	
	key_debounce key_debounce_1(
    .clk(clk),
    .rst(rst),
    .key_in(up_in),
    .key_flag_n(),
    .key_flag_p(),
    .key_state_out(up)
    );
	
	
	key_debounce key_debounce_2(
    .clk(clk),
    .rst(rst),
    .key_in(down_in),
    .key_flag_n(),
    .key_flag_p(),
    .key_state_out(down)
    );
	
	
	key_debounce key_debounce_3(
    .clk(clk),
    .rst(rst),
    .key_in(left_in),
    .key_flag_n(),
    .key_flag_p(),
    .key_state_out(left)
    );
	
	key_debounce key_debounce_4(
    .clk(clk),
    .rst(rst),
    .key_in(right_in),
    .key_flag_n(),
    .key_flag_p(),
    .key_state_out(right)
    );

	key_debounce key_debounce_5(
    .clk(clk),
    .rst(rst),
    .key_in(midle_in),
    .key_flag_n(),
    .key_flag_p(),
    .key_state_out(midle)
    );	


	assign up_out = up;
	assign down_out = down;
	assign left_out = left;
	assign right_out = right;
	assign midle_out = midle;

endmodule
