`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:29 05/31/2020 
// Design Name: 
// Module Name:    power_ctrl 
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
module power_ctrl(
    clk,
	rst_n,
	ov5640_pwdn,
	ov5640_rst_n,
	power_done
    );

input clk;
input rst_n;
output ov5640_pwdn;
output ov5640_rst_n;
output power_done;
	
localparam delay_6ms = 300_000;
localparam delay_2ms = 100_000;
localparam delay_21ms = 105_0000;

reg [18:0]cnt_6ms;
reg [16:0]cnt_2ms;
reg [20:0]cnt_21ms;

always @(posedge clk or negedge rst_n)	
    if(!rst_n)
	    cnt_6ms <= 0;
	else if(cnt_6ms == delay_6ms)
	    cnt_6ms <= cnt_6ms;
	else if(ov5640_pwdn)
	    cnt_6ms <= cnt_6ms + 1'b1;

assign ov5640_pwdn = (cnt_6ms >= delay_6ms)?1'b0:1'b1;


always @(posedge clk or negedge rst_n)	
    if(!rst_n)
	    cnt_2ms <= 0;
	else if(cnt_2ms == delay_6ms)
	    cnt_2ms <= cnt_2ms;
	else if(!ov5640_pwdn && !ov5640_rst_n)
	    cnt_2ms <= cnt_2ms + 1'b1;

assign ov5640_rst_n = (cnt_2ms >= delay_2ms)?1'b1:1'b0;

always @(posedge clk or negedge rst_n)	
    if(!rst_n)
	    cnt_21ms <= 0;
	else if(cnt_21ms == delay_21ms)
	    cnt_21ms <= cnt_21ms;
	else if(!ov5640_pwdn && ov5640_rst_n)
	    cnt_21ms <= cnt_21ms + 1'b1;

assign power_done = (cnt_21ms >= delay_21ms)?1'b1:1'b0;
endmodule
