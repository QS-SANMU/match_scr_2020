`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:25 10/21/2020 
// Design Name: 
// Module Name:    keys_angle_analysis 
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
module keys_angle_analysis(
//system_signals
	input				clk,
	input				rst_n,
//top_keys摇杆顶层模块
	input				up,
	input				dowm,
	input				left,
	input				right,
//
	input		[5:0]	state,
//
//
//
	output	reg	[8:0]		angle_z,
	output	reg	[8:0]		angle_x
    );
	localparam	NUM_SPEED = 24'd2_000_000;
	reg	[23:0]	cnt_speed;//暂定1s转10°
	wire		speed_flag;
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			cnt_speed <= 24'b0;
		else if((left||dowm||right||up )== 0)//按下后开始计数
			cnt_speed <= 24'b0;
		else if(cnt_speed == NUM_SPEED)
			cnt_speed <= 24'b0;
		else
			cnt_speed <= cnt_speed + 1'b1;
	end
	assign speed_flag = cnt_speed == NUM_SPEED;

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			angle_z <= 9'd180;
		end
		else if(state != 6'b010_000)
			angle_z <= 9'd180;
		else if(speed_flag)begin
			if(right && angle_z > 9'd1)
				angle_z <= angle_z - 1'b1;
			else if(left && angle_z < 9'd359)
				angle_z <= angle_z + 1'b1;
			else
				angle_z <= angle_z;
		end
	end
	
	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			angle_x <= 9'd50;
		end
		else if(state != 6'b010_000)begin
			angle_x <= 9'd50;
		end
		else if(speed_flag)begin
			if(dowm && angle_x > 9'd30 )
				angle_x <= angle_x - 1'b1;
			else if(up && angle_x < 9'd90)
				angle_x <= angle_x + 1'b1;
			else
				angle_x <= angle_x;
		end
	end
endmodule
