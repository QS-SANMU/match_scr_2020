`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:11:16 07/06/2020 
// Design Name: 
// Module Name:    ov5640_top 
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
module ov5640_top(
    clk_sys50m,
	clk_sys24m,
    rst_n,
	//
    ov5640_pwdn,
	ov5640_rst_n,
	ov5640_xclk,
	ov5640_iic_scl,
	ov5640_iic_sda,
	//
	estart,
	ewdata,
	riic_data,
	
	

	ov5640_pclk,
	ov5640_href,
	ov5640_vsync,
	ov5640_data,
	m_data,
	m_wr_en
    );

    input clk_sys50m;
	input clk_sys24m;
	input rst_n;
	//
	output ov5640_pwdn;
	output ov5640_rst_n;
	output ov5640_xclk;
	output ov5640_iic_scl;
	inout ov5640_iic_sda;
	//
	input estart;
	input [31:0]ewdata;
	output [7:0]riic_data;
	
    
	input ov5640_pclk;
	input ov5640_href;
	input ov5640_vsync;
	input [7:0]ov5640_data;
	//
	output [15:0]m_data;
	output m_wr_en;
	
wire power_done;	
wire busy;	
	
assign 	ov5640_xclk = clk_sys24m;



power_ctrl   power_ctrl_inst(
    .clk(clk_sys50m),
	.rst_n(rst_n),
	.ov5640_pwdn(ov5640_pwdn),
	.ov5640_rst_n(ov5640_rst_n),
	.power_done(power_done)
    );
	
	
/*	
ov5640_iic   ov5640_iic_inst(
    .clk(clk_sys50m),
	.rst_n(rst_n & power_done),
	.start(estart),
	.wdata(ewdata),
	.iic_scl(ov5640_iic_scl),
	.iic_sda(ov5640_iic_sda),
	.iic_data(riic_data),
	.busy(busy)
    );*/
	
	
	
ov5640_data    ov5640_data_inst(
    .rst_n(rst_n),
	//ov5640
	.ov5640_pclk(ov5640_pclk),
	.ov5640_href(ov5640_href),
	.ov5640_vsync(ov5640_vsync),
	.ov5640_data(ov5640_data),
	//
	.m_data(m_data),
	.m_wr_en(m_wr_en)
    );	

	
ov5640_cfg    ov5640_cfg_inst(
    .clk(clk_sys50m),
	.rst_n(rst_n  & power_done),
	//
	.iic_scl(ov5640_iic_scl),
	.iic_sda(ov5640_iic_sda),
	//
	.estart(estart),
	.ewdata(ewdata),
	.riic_data(riic_data)
    );
	
	
	
endmodule
