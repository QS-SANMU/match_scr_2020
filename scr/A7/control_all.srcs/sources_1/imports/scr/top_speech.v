`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:29:20 10/23/2020 
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
module top_speech(
	input clk,
	input rst,
	input cmd_1,                  //自动模式
	input cmd_2,                  //辅助模式
	input cmd_3,                  //摇杆模式
	input cmd_4,                  //环境信息
	input cmd_5,                  //指纹正确
	input cmd_6,                  //指纹错误
	input cmd_7,                  //发现目标
	input cmd_8,                  //目标消失 
	input cmd_9,                  //一氧化碳警告
	input cmd_10,                 //火焰警告
	input cmd_11,                 //以获取最高权限
	output data_out
    );
	
	

	
	speech_cmd_sel speech_cmd_sel(
	.clk(clk),
	.rst(rst),
	.cmd_1(cmd_1),
	.cmd_2(cmd_2),
	.cmd_3(cmd_3),
	.cmd_4(cmd_4),
	.cmd_5(cmd_5),
	.cmd_6(cmd_6),
	.cmd_7(cmd_7),
	.cmd_8(cmd_8),
	.cmd_9(cmd_9),
	.cmd_10(cmd_10),
	.cmd_11(cmd_11),
	.data_out(data_out)
    );
	


endmodule
