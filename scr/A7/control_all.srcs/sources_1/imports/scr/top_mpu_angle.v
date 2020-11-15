`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:51 10/05/2020 
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
module top_mpu_angle(
	//system	signals
	input				clk,
	input				rst_n,
	//top_mpu
	input				data_in,
	//
	input		[5:0]	state,
	//angle_analysis
	input		[2:0]	angle_ulr,
	//--mg995_drive
	output		[8:0]	angle_z,
	output		[8:0]	angle_x

    );
	
wire	[9:0]	data_x;
wire	[9:0]	data_z;
wire			data_vld;//数据有效

mpu_angle_analysis mpu_angle_analysis1(
    //user signals
    .clk			(clk),
    .rst_n			(rst_n),
    //mpu signals
    .dev_z			(data_z),//deviation_z,z的偏移,波特率9600
    .dev_x			(data_x),//
    .dev_vld		(data_vld),
	//
	.state			(state),
    //user  signals,来自串口屏的信号
	.angle_ulr		(angle_ulr),//up_left_right,持续一个时钟然后恢复常态
	
	.angle_z		(angle_z),
	.angle_x		(angle_x)
    );
top_mpu top_mpu1(
	.clk			(clk),
	.rst			(rst_n),
	.data_in		(data_in),
	.data_done		(data_vld),
	.X				(data_x),
	.Z				(data_z)
	);
endmodule
