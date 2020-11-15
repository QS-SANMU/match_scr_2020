`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:22 08/05/2020 
// Design Name: 
// Module Name:    bps_rx 
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
module bps_rx(
    input clk,
    input rst,
    input rx_en,                     //接收使能

    output reg rx_sel_data,          //数据采集使能
    output reg [3:0] rx_num          //采集数据个数
    );

    parameter bps_cnt_end = 'd5207;
    parameter bps_cnt_mid = 'd2603;

    reg flag;

    always@(posedge clk or negedge rst)
    if(!rst)    
        flag <= 0;
    else if(rx_num == 4'd10)
        flag <= 0;
    else if(rx_en)
        flag <= 1;
    else
        flag <= flag;

    reg [12:0] cnt;

    always@(posedge clk or negedge rst)
    if(!rst)
        cnt <= 0;
    else if(flag && (cnt == bps_cnt_end))
        cnt <= 0;
    else
        cnt <= cnt + 1'b1;

    always@(posedge clk or negedge rst)
    if(!rst)
        rx_sel_data <= 0;
    else if(flag && (cnt == bps_cnt_mid))
        rx_sel_data <= 1;
    else
        rx_sel_data <= 0;


    always@(posedge clk or negedge rst)
    if(!rst)
        rx_num <= 0;
    else if(rx_num == 'd10)
        rx_num <= 0;
    else if(flag && rx_sel_data)
        rx_num <= rx_num + 1'b1;
    else
        rx_num <= rx_num;

endmodule
