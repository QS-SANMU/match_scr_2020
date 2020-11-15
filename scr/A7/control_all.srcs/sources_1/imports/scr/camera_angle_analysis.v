`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:37 10/09/2020 
// Design Name: 
// Module Name:    camera_analysis 
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
module camera_angle_analysis(
	//system angle
	input				clk,
	input				rst_n,
	//camera 
	input				seen,//是否检测到
	input 				data_z_vld,
	input 				data_x_vld,
	input 	[7:0]		angle_z_camera_tmp,
	input 	[7:0]		angle_x_camera_tmp,
	//angle_camera steering engine摄像头底下舵机此刻的角度
	input		[9:0]	angle_camera,
	//
	output	reg	[8:0]	angle_z,
	output	reg	[8:0]	angle_x
    );
	//camera viewing angle,摄像头可视角度


	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			angle_x <= 9'b0;
		end
		else if(seen && data_x_vld)begin
			angle_x <= 9'd50 - 9'd25 + angle_x_camera_tmp;
		end
		else begin
			angle_x <= angle_x;
		end
	end

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)begin
			angle_z <= 9'b0;
		end
		else if(seen && data_z_vld)begin
			angle_z <= 9'd45 +  (9'd270 - angle_camera) - 9'd28 + angle_z_camera_tmp + 9'd10;
		end
		else begin
			angle_z <= angle_z;
		end
	end
endmodule
