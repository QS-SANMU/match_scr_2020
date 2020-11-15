`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:03 10/12/2020 
// Design Name: 
// Module Name:    camera_engine 
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
//270°舵机
module camera_engine(
	//system signals
	input				clk,
	input				rst_n,
	//目前还不知道各状态时自动瞄准功能的工作方式，输入的模块待定
	input				stop,
	//ouput
	output	reg	[8:0]	angle,
	//camera_pwm
	output              pwm
    );
//----------------------------------------------------------------angle控制转动速率
localparam	END_CNT_ANGLE_8S = 9'd180;//9'd270;//控制转动速度  20ms一度，
reg 		turn;//转动方向
reg			rdy_t;
wire		rdy_flag;//rdy上升沿检测，20ms会有1个时钟周期
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		rdy_t <= 0;
	else
		rdy_t <= rdy;
end
assign rdy_flag = !rdy_t && rdy;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		turn <= 1'b0;
	else if(angle >= END_CNT_ANGLE_8S)
		turn <= 1'b1;
	else if(angle <= 9'd90)
		turn <= 1'b0;
end
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		angle <= 9'd95;
	else if(stop)
		angle <= angle;
	else if(rdy_flag)begin
		if(!turn && angle <= END_CNT_ANGLE_8S)
			angle <= angle + 1'b1;
		else if(turn && angle >= 9'd90)
			angle <= angle - 1'b1;
		else
			angle <= angle;
	end
end

localparam  DELAY_20MS = 20'd1_000_000 - 1'd1;
reg	[19:0]	cnt_20ms;
//---------------------------------------------------------------20ms
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cnt_20ms <= 0;
	end
	else if(cnt_20ms == DELAY_20MS)begin
		cnt_20ms <= 0;
	end
	else begin
		cnt_20ms <= cnt_20ms + 1'b1;
	end
end
assign rdy = (cnt_20ms == DELAY_20MS || cnt_20ms == 0) ? 1 : 0;//每20ms接收一次



localparam	CNT_ANGLE_1 = 10'd370;//2ms270°
localparam	CNT_MS_HALF = 15'd25000;//0.5ms计数器
reg	[9:0]	cnt_angle_1;//到达1°所需时间
reg	[19:0]	cnt_angle;//20ms周期计数
reg [14:0]	cnt_angle_start;
wire		start_angle;
//------------------------------------------------------------cnt_0.5ms,0.5ms后开始加角度
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		cnt_angle_start <= 0;
	else if(rdy)
		cnt_angle_start <= 0;
	else if(cnt_angle_start == CNT_MS_HALF)
		cnt_angle_start <= cnt_angle_start;
	else
		cnt_angle_start <= cnt_angle_start + 1'b1;
end
assign	start_angle = (cnt_angle_start == CNT_MS_HALF) ? 1 : 0;
//------------------------------------------------------------cnt_angle_1
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		cnt_angle_1 <= 0;
	end
	else if(!start_angle)begin
		cnt_angle_1 <= 0;
	end
	else if(cnt_angle_1 >= CNT_ANGLE_1)begin
		cnt_angle_1 <= 0;
	end
	else begin
		cnt_angle_1 <= cnt_angle_1 + 1'b1;
	end
end
//-----------------------------------------------------------cnt_angle;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)
		cnt_angle <= 0;
	else if(rdy)
		cnt_angle <= 0;
	else if(cnt_angle_1 == CNT_ANGLE_1)
		cnt_angle <= cnt_angle + 1'b1;
end


//---------------------------------------------------------------angle_x,z
assign pwm = (cnt_angle >= angle && start_angle) ? 1'b0 : 1'b1;

endmodule
