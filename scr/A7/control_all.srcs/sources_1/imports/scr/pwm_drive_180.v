`timescale  1ns/1ns

module  pwm_drive_180(
    //szsrem signals
    input               clk,//50mhz
    input               rst_n,
    //user signals
    input		[8:0]	angle,
	
	output				rdy,
    output              pwm
);

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



localparam	CNT_ANGLE_1 = 10'd555;
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