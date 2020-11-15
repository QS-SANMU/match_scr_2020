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
module angle_pwm(
	//system	signals
	input				clk,
	input				rst_n,
	//--pwm
	output				pwm_x,
	output				pwm_z,
	//angle_choose
	input   [8:0]	angle_x,
	input   [8:0]	angle_z
    );
	
wire	[9:0]	data_x;
wire	[9:0]	data_z;
wire			data_vld;

wire			rdy_z;
wire			rdy_x;

wire	[8:0]	angle_z_t;
wire	[8:0]	angle_x_t;
assign angle_x_t = (rdy_x) ? (((angle_x >= 9'd30) && (angle_x <= 9'd80)) ? angle_x : angle_x_t) : angle_x_t;
assign angle_z_t = (rdy_z) ? (((angle_z >= 9'd45) && (angle_z <= 9'd315)) ? angle_z : angle_z_t) : angle_z_t;

pwm_drive_360  pwm_drive_360_z(
    //sysrem signals
    .clk			(clk),//50mhz
    .rst_n			(rst_n),
    //user signals
//    .angle_x		(180),
    .angle			(angle_z_t),
	
	.rdy			(rdy_z),
//    .pwm_x			(pwm_x),
    .pwm			(pwm_z)
);
pwm_drive_180  pwm_drive_180_x(
    //sysrem signals
    .clk			(clk),//50mhz
    .rst_n			(rst_n),
    //user signals
    .angle			(angle_x_t),
	
	.rdy			(rdy_x),
    .pwm			(pwm_x)
);
endmodule
