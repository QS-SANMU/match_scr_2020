`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:36:37 10/12/2020 
// Design Name: 
// Module Name:    top_camera_angle 
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
module top_camera_angle(
	//system signals
	input				clk,
	input				rst_n,
	//camera signals
	input				seen,//是否检测到
	input 				data_z_vld,
	input 				data_x_vld,
	input 		[7:0]	angle_z_camera_tmp,
	input 		[7:0]	angle_x_camera_tmp,
	//camera engine摄像头底下舵机此刻的角度
	input		[9:0]	angle_camera,	


	//analysis_angle
	output		[8:0]	angle_z,
	output		[8:0]	angle_x
    );

camera_angle_analysis camera_angle_analysis_1(
	//system angle
	.clk			(clk),
	.rst_n			(rst_n),
	//camera 
	.seen			(seen),//是否检测到
	.data_x_vld 					(data_x_vld),
	.angle_x_camera_tmp 			(angle_x_camera_tmp),
	.data_z_vld 					(data_z_vld),	
	.angle_z_camera_tmp 			(angle_z_camera_tmp),
	//angle_camera steering engine摄像头底下舵机此刻的角度
	.angle_camera	(angle_camera),
	//analysis_angle
	.angle_z		(angle_z),
	.angle_x		(angle_x)
    );
endmodule
