`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:25 10/07/2020 
// Design Name: 
// Module Name:    uart_analysis 
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
//对fpga从usart接受的数据进行分析，选择系统此时的工作方式
module state_analysis(
	//-----------------------------------------------system signals
	input				clk,
	input				rst_n,
	input				rx_vld,
	input		[7:0]	rx_data,
	
	output		[5:0]	state
    );
	
	localparam	IDEL = 8'b000_001;//密码验证状态 
	localparam	S3 =   8'b000_010;//功能选择页面
	localparam	S4 =   8'b000_100;//自动
	localparam	S5 =   8'b001_000;//手动
	localparam	S6 =   8'b010_000;//摇杆瞄准
	localparam	S7 =   8'b100_000;//环境信息

	reg	[5:0]		state_c;
	reg	[5:0]		state_n;

	always@(posedge clk or negedge rst_n)begin
		if(!rst_n)
			state_c <= IDEL;
		else
			state_c <= state_n;
	end
	
	always@(*)begin
		if(rx_vld)begin
			case (rx_data)
				8'b0011_0000: state_n = IDEL;
				8'b0011_0011: state_n = S3;
				8'b0011_0100: state_n = S4;
				8'b0011_0101: state_n = S5;
				8'b0011_0110: state_n = S6;
				8'b0011_0111: state_n = S7;
				default: state_n = state_c;
			endcase
		end else begin
			state_n = state_c;
		end
	end
	assign state = state_n;
endmodule
