`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:49 10/22/2020 
// Design Name: 
// Module Name:    top_keys_angle 
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
module top_keys_angle(
//system_signals
	input				clk,
	input				rst_n,
//keys in
	input				up_in,
	input				down_in,
	input				left_in,
	input				right_in,
	input				midle_in,
//
	input		[5:0]	state,
	
//
	output		[8:0]	angle_z,
	output		[8:0]	angle_x,
	output	up_out   ,
	output	down_out ,
	output	left_out ,
	output	right_out,
	output	midle_out
    );

top_keys top_keys(
	.clk				(clk),
	.rst				(rst_n),
	.up_in				(up_in	 ),
	.down_in 			(down_in ),
	.left_in 			(left_in ),
	.right_in			(right_in),
	//input midle_in,
	.midle_in			(midle_in),
	.midle_out			(midle_out),
	.up_out  			(up_out   ),
	.down_out			(down_out ),
	.left_out			(left_out ),
	.right_out			(right_out)
	//output midle_out
    );
	
keys_angle_analysis keys_angle_analysis(
//system_signals
	.clk				(clk),
	.rst_n				(rst_n),
//top_keys摇杆顶层模块
	.up    				(up_out   ),
	.dowm  				(down_out ),
	.left  				(left_out ),
	.right 				(right_out),
//
	.state				(state),
//
//
//
	.angle_z			(angle_z),
	.angle_x			(angle_x)
    );
endmodule
