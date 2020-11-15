`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:18 10/27/2020 
// Design Name: 
// Module Name:    usart_page_change 
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
module usart_page_change(
//------------------------------------------语音输入没写完++++++++++++++++++++------------------------*****************************
//voice_data没对应
input               clk,
input               rst_n,
//指纹
input               check_ok,
input               check_no,
//状态
input       [5:0]   state,
//输出给usart
output  reg [7:0]   page_data,
output  reg         data_en,
//语音输入
input       [7:0]   voice_data,
input               voice_vld,
//指示工作状态
output              data_en_flag//页面切换，持续busy
    );

localparam	IDEL = 6'b000_001;//密码验证状态 
localparam	S3 =   6'b000_010;//功能选择页面
localparam	S4 =   6'b000_100;//自动

localparam	S5 =   6'b001_000;//手动
localparam	S6 =   6'b010_000;//摇杆瞄准
localparam	S7 =   6'b100_000;//环境信息

reg	[20:0]	cnt_9600;
localparam	NUM_9600 = 21'd60000;
wire		send_time;
reg flag_ok;
reg flag_no;
reg [25:0] cnt_busy;
localparam NUM_busy = 32'd25_000_000;
reg flag_busy;
reg [5:0]  num_message;
reg [7:0]  page_num;
reg flag_voice;

//------------------------------------------------------------------------------工作计数------------------------------------------------------------------
//检测到指纹模块或者语音模块输入的信息有效时，拉高电平
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        flag_busy <= 1'b0;
    end
    else if(cnt_busy >= NUM_busy)begin
        flag_busy <= 1'b0;
    end
    else if((check_no || check_ok) && state == IDEL)begin
        flag_busy <= 1'b1;
    end
    else if(voice_vld && state != IDEL)begin
        case (voice_data)
            8'h62:flag_busy <= 1'b1;
            8'h61:flag_busy <= 1'b1;
            8'h63:flag_busy <= 1'b1;
            8'h64:flag_busy <= 1'b1;
            8'h65:flag_busy <= 1'b1;
            8'h66:flag_busy <= 1'b1;
            default: flag_busy <= flag_busy;
        endcase
    end
    else begin
        flag_busy <= flag_busy;
    end
end
//计数部分
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        cnt_busy <= 26'b0;
    end
    else if(!flag_busy)begin
        cnt_busy <= 1'b0;
    end
    else if(cnt_busy >= NUM_busy)begin
        cnt_busy <= 26'b0;
    end
    else begin
        cnt_busy <= cnt_busy + 1'b1;
    end
end
assign data_en_flag = cnt_busy > 26'b0;//工作指示信号

//-----------------------------------------------------------------------------------信息发送模块----------------------------------------------------------
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        cnt_9600 <= 21'b0;
    else if(((flag_no || flag_ok) == 1'b0) && flag_voice == 0)begin
        cnt_9600 <= 21'b0;
    end
    else if(num_message >= 6'd18)begin
        cnt_9600 <= 21'b0;
    end
    else if(cnt_9600 >= NUM_9600)
        cnt_9600 <= 21'b0;
    else
        cnt_9600 <= cnt_9600 + 1'b1;
end
assign send_time = cnt_9600 >= 13'd100 && cnt_9600 <= 13'd200;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        num_message <= 6'd0;
    end
    else if(num_message >= 6'd18)begin
        if(cnt_busy >= NUM_busy)begin
            num_message <= 6'd0;
        end 
        else begin
            num_message <= num_message;
        end
    end
    else if(cnt_9600 == NUM_9600)begin
        num_message <= num_message + 1'b1;
    end
    else begin
        num_message <= num_message;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        data_en <= 1'b0;
    end
    else if(send_time)begin
        data_en <= 1'b1;
    end
    else begin
        data_en <= 1'b0;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        page_data <= 8'b0;
    end
    else if(send_time)begin
        case (num_message)
            6'd0: page_data <= 8'b1111_1111;
            6'd1: page_data <= 8'b1111_0000;
            6'd2: page_data <= 8'b1111_1111;//p
            6'd3: page_data <= 8'b1111_1111;//a
            6'd4: page_data <= 8'b1111_1111;
            6'd5: page_data <= 8'b0111_0000;//p
            6'd6: page_data <= 8'b0110_0001;//a
            6'd7: page_data <= 8'b0110_0111;//g
            6'd8: page_data <= 8'b0110_0101;//e
            6'd9: page_data <= 8'b0010_0000;//space
            6'd10:page_data <= 8'b0111_0000;//p
            6'd11:page_data <= 8'b0110_0001;//a
            6'd12:page_data <= 8'b0110_0111;//g
            6'd13:page_data <= 8'b0110_0101;//e
            6'd14:page_data <= page_num;
            6'd15:page_data <= 8'b1111_1111;
            6'd16:page_data <= 8'b1111_1111;
            6'd17:page_data <= 8'b1111_1111;
            default:page_data <= 8'b0;
        endcase
    end
end

//-----------------------------------------------------------------------------指纹信息保持--------------------------------------------------------------------
//检测到对错，持续拉高电平，保持num_busy时间
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        flag_ok <= 1'b0;
    else if(cnt_busy >= NUM_busy)
        flag_ok <= 1'b0;
    else if(check_ok)
        flag_ok <= 1'b1;
    else
        flag_ok <= flag_ok;
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
        flag_no <= 1'b0;
    else if(cnt_busy >= NUM_busy)
        flag_no <= 1'b0;
    else if(check_no)
        flag_no <= 1'b1;
    else
        flag_no <= flag_no;
end

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        flag_voice <= 1'b0;
    end
    else if(cnt_busy >= NUM_busy)begin
        flag_voice <= 1'b0;
    end
    else if(voice_vld && state != IDEL)begin
        case (voice_data)
            8'h62:flag_voice <= 1'b1;//自动
            8'h61:flag_voice <= 1'b1;//手动
            8'h63:flag_voice <= 1'b1;//摇杆
            8'h64:flag_voice <= 1'b1;//环境
            8'h65:flag_voice <= 1'b1;//返回菜单
            8'h66:flag_voice <= 1'b1;//退出系统
            default: flag_voice <= 1'b0;
        endcase
    end
    else begin
        flag_voice <= flag_voice;
    end
end
//-----------------------------------------------------------------------跳转页面判断--------------------------------------------------------------------
//对指纹模块信息分析，语音模块音输入信息分析，然后发送指令跳转
//密码输入的页面切换直接在串口屏进行
always@(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        page_num <= 8'b0011_0000;
    end
    else if(state == IDEL)begin//密码输入状态
        if(flag_ok)begin
            page_num <= 8'b0011_0011;//功能选择
        end
        else if(flag_no)begin
            page_num <= 8'b0011_0001;//失败
        end
        else begin
            page_num <= 8'b0011_0000;//识别页面
        end
    end
    else if( voice_vld && state != IDEL)begin
        case (voice_data)
            8'h61:page_num <= 8'b0011_0100;//自动
            8'h62:page_num <= 8'b0011_0101;//手动
            8'h63:page_num <= 8'b0011_0110;//摇杆
            8'h64:page_num <= 8'b0011_0111;//环境
            8'h65:page_num <= 8'b0011_0011;//返回菜单
            8'h66:page_num <= 8'b0011_0000;//退出系统
            default: page_num <= page_num;
        endcase
    end
end

endmodule
