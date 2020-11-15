`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:57:17 07/07/2020 
// Design Name: 
// Module Name:    ov5640_data 
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
module ov5640_data(
    rst_n,
	//ov5640
	ov5640_pclk,
	ov5640_href,
	ov5640_vsync,
	ov5640_data,
	//
	//img_width,
	//img_height
	m_data,
	m_wr_en
    );
input rst_n;
input ov5640_pclk;
input ov5640_href;
input ov5640_vsync;
input [7:0]ov5640_data;

output reg[15:0]m_data;
output reg m_wr_en;
//output reg [15:0]img_width;
//output reg [15:0]img_height;

wire ov5640_vsync_pos;
reg  ov5640_vsync_r1;

reg byte_flag;     //0:first byte,1:second byte
reg [3:0]frame_cnt;


always @(posedge ov5640_pclk or negedge rst_n)
    if(!rst_n)
	    m_data <= 0;
	else if (byte_flag)
	    m_data <= {m_data[15:8],ov5640_data};
	else 
	    m_data <= {ov5640_data,m_data[7:0]};

always @(posedge ov5640_pclk or negedge rst_n)
    if(!rst_n)
        m_wr_en <= 0;
    else if(frame_vaild && byte_flag)
	    m_wr_en <= 1;
	else 
	    m_wr_en <= 0;


always @(posedge ov5640_pclk or negedge rst_n)
    if(!rst_n)
        byte_flag <= 0;
    else if(ov5640_href)	
       	byte_flag <= ~byte_flag;
	else 
	    byte_flag <= 0;
		
always @(posedge ov5640_pclk or negedge rst_n)
    if(!rst_n)
	    frame_cnt <= 0;
	else if(ov5640_vsync_pos && (!frame_vaild))
	    frame_cnt <= frame_cnt + 1'b1;
  
always @(posedge ov5640_pclk)
    ov5640_vsync_r1 <= ov5640_vsync;


assign frame_vaild  = (frame_cnt >= 'd10)?1'b1:1'b0;
assign ov5640_vsync_pos = ov5640_vsync & (~ov5640_vsync_r1);


endmodule
