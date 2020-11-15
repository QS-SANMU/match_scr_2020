`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:44 10/20/2020 
// Design Name: 
// Module Name:    top_angle_analysils 
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
//所有舵机的角度控制
module top_angle_analysils(
//system signal
	input				clk,
	input				rst_n,
//
	input				mpu_data_in,
//
	input 				keys_up_in,
	input 				keys_down_in,
	input 				keys_left_in,
	input 				keys_right_in,
	input				fire_data_in,

	output up_out,
	output down_out,
	output left_out,
	output right_out,
	output midle_out,




//
	input		[5:0]	state,
	input		[2:0]	angle_ulr,
//
	output				pwm_z,
	output				pwm_x,
	output				pwm_camera,
	
	output		[8:0]	angle_x_use_t,
	output		[8:0]	angle_z_use_t,
	output		[8:0]	angle_z_camera,
	output		[8:0]	angle_x_camera,
//
	input				stop_camera,
	input 				data_z_vld,
	input 				data_x_vld,
	input	 	[7:0]	angle_z_camera_tmp,
	input	 	[7:0]	angle_x_camera_tmp
    );
wire	[8:0]	angle_z_mpu;
wire	[8:0]	angle_x_mpu;
wire	[8:0]	angle_z_keys;
wire	[8:0]	angle_x_keys;
wire	[8:0]	angle_camera;
reg	[8:0]	angle_x_use;
reg	[8:0]	angle_z_use;
//------------------------------------------------------------------------PWM波---------------------------------------------------------------------------
assign angle_x_use_t = ((angle_x_use >= 9'd30) && (angle_x_use <= 9'd80)) ? angle_x_use : angle_x_use_t;
assign angle_z_use_t = ((angle_z_use >= 9'd45) && (angle_z_use <= 9'd315)) ? angle_z_use : angle_z_use_t;
angle_pwm angle_pwm(
	//system	signals
	.clk				(clk),
	.rst_n				(rst_n),
	//--pwm
	.pwm_x				(pwm_x),
	.pwm_z				(pwm_z),
	//angle_choose
	.angle_x			(angle_x_use),
	.angle_z			(angle_z_use)
    );
camera_engine camera_engine(
	//system signals
	.clk				(clk),
	.rst_n				(rst_n),
	//目前还不知道各状态时自动瞄准功能的工作方式，输入的模块待定
	.stop				(stop_camera),
	//ouput
	.angle				(angle_camera),
	//camera_pwm
	.pwm				(pwm_camera)
    );
//------------------------------------------------------------------------PWM波---------------------------------------------------------------------------

//------------------------------------------------------------------------角度分析---------------------------------------------------------------------------
top_camera_angle top_camera_angle(
	//system signals
	.clk				(clk),
	.rst_n				(rst_n),
	//camera signals
	.seen				(stop_camera),//是否检测到
	.data_x_vld 		(data_x_vld),
	.angle_x_camera_tmp (angle_x_camera_tmp),
	.data_z_vld 		(data_z_vld),	
	.angle_z_camera_tmp (angle_z_camera_tmp),
	//camera engine摄像头底下舵机此刻的角度
	.angle_camera		(angle_camera),	

	//analysis_angle
	.angle_z			(angle_z_camera),
	.angle_x			(angle_x_camera)
    );
top_mpu_angle top_mpu_angle(
	//system	signals
	.clk				(clk),
	.rst_n				(rst_n),
	//top_mpu
	.data_in			(mpu_data_in),
	//
	.state				(state),
	//angle_analysis
	.angle_ulr			(angle_ulr),
	//--mg995_drive
	.angle_z			(angle_z_mpu),
	.angle_x			(angle_x_mpu)
    );
top_keys_angle top_keys_angle(
//system_signals
	.clk				(clk),
	.rst_n				(rst_n),
//keys in
	.up_in				(keys_up_in),
	.down_in			(keys_down_in),
	.left_in			(keys_left_in),
	.right_in			(keys_right_in),
	.midle_in			(fire_data_in),


	.up_out				(up_out		),
	.down_out			(down_out	),
	.left_out			(left_out	),
	.right_out			(right_out	),
	.midle_out			(midle_out	),
//
	.state				(state),

//
	.angle_z			(angle_z_keys),
	.angle_x			(angle_x_keys)
    );
always@(*)begin
	case(state)
		6'b000_100:begin



			angle_x_use = angle_x_camera;
			angle_z_use = angle_z_camera;




		end
		6'b001_000:begin




			angle_x_use  = angle_x_mpu;
			angle_z_use  = angle_z_mpu;





		end
		6'b010_000:begin		





			angle_x_use  = angle_x_keys;
			angle_z_use  = angle_z_keys;





		end
		default:begin






			angle_x_use = 9'd50;
			angle_z_use = 9'd180;






			
		end
	endcase
end

//------------------------------------------------------------------------角度分析---------------------------------------------------------------------------
endmodule
