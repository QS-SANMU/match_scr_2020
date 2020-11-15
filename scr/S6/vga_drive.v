`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:08 05/06/2020 
// Design Name: 
// Module Name:    vga_drive 
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
module  vga_drive(
        // system signals
        input                   sclk                    ,       
        input                   s_rst_n                 ,       
		
		input [10:0] x_coor                               ,
		input [9:0] y_coor                               ,
		input [10:0] x_max                              ,
	    input [10:0] x_min                              ,
	    input [9:0] y_max                               ,
	    input [9:0] y_min                               ,
		
        // VGA
        output  wire            vga_hsync               ,       
        output  wire            vga_vsync               ,       
        output  reg     [15:0]   vga_rgb                 ,
		output  reg     [10:0]                  vga_x   ,       
        output  reg     [9:0]                  vga_y   ,
        // User Interfaces
        output  wire            data_req                ,
        input           [15:0]  img_data
);

parameter        RED          =       16'b11111_000000_00000;


//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
/*800*600
localparam      H_TOTAL_TIME    =       1056                    ;
localparam      H_ADDR_TIME     =       800                     ;
localparam      H_SYNC_TIME     =       128                     ;
localparam      H_BACK_PORCH    =       88                      ;
localparam      V_TOTAL_TIME    =       628                     ;
localparam      V_ADDR_TIME     =       600                     ;
localparam      V_SYNC_TIME     =       4                       ;
localparam      V_BACK_PORCH    =       23                      ;*/


//1024*768 @60hz   65mhz
localparam      H_TOTAL_TIME    =       1344                    ;
localparam      H_ADDR_TIME     =       1024                    ;
localparam      H_SYNC_TIME     =       136                     ;
localparam      H_BACK_PORCH    =       160                     ;
localparam      H_FRONT_PORCH   =       24                      ;

localparam      V_TOTAL_TIME    =       806                     ;
localparam      V_ADDR_TIME     =       768                     ;
localparam      V_SYNC_TIME     =       6                       ;
localparam      V_BACK_PORCH    =       29                      ;
localparam      V_FRONT_PORCH   =       3                       ;
                         ;       
reg                             vga_en                          ;
//=============================================================================
//**************    Main Code   **************
//=============================================================================

reg [10:0] cnt_h;
reg [9:0] cnt_v;

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                cnt_h   <=      'd0;
        else if(cnt_h >= H_TOTAL_TIME)
                cnt_h   <=      'd0;
        else
                cnt_h   <=      cnt_h + 1'b1;
end

always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                cnt_v   <=      'd0;
        else if(cnt_v >= V_TOTAL_TIME && cnt_h >= H_TOTAL_TIME)
                cnt_v   <=      'd0;
        else if(cnt_h >= H_TOTAL_TIME)
                cnt_v   <=      cnt_v + 1'b1;
end


always@(posedge sclk or negedge s_rst_n) begin
	    if(!s_rst_n)
		    vga_x [10:0] <= 0;
		else if(cnt_h > H_SYNC_TIME + H_BACK_PORCH + H_ADDR_TIME) vga_x [10:0] <= 0;
		else if(cnt_h < H_SYNC_TIME + H_BACK_PORCH) vga_x [10:0] <= 0;
		else vga_x <= cnt_h - 'd296;
	end
	
	always@(posedge sclk or negedge s_rst_n) begin
	    if(!s_rst_n)
		    vga_y [9:0] <= 0;
		else if(cnt_v > V_SYNC_TIME + V_BACK_PORCH + V_ADDR_TIME + 'd24) vga_y [9:0] <= 0;
		else if(cnt_v < V_SYNC_TIME + V_BACK_PORCH - 'd24) vga_y [9:0] <= 0;
		else vga_y <= cnt_v - 'd35;
	end


/* always  @(posedge sclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                vga_rgb <=      'd0;
        else if(cnt_v >= (V_SYNC_TIME + V_BACK_PORCH) && cnt_v < (V_SYNC_TIME + V_BACK_PORCH + V_ADDR_TIME)) begin
                if(cnt_h >= (H_SYNC_TIME + H_BACK_PORCH - 1) && cnt_h < (H_SYNC_TIME + H_BACK_PORCH - 1 + 200))
                        vga_rgb <=      16'h0fff;
                else if(cnt_h >= (H_SYNC_TIME + H_BACK_PORCH - 1 + 200) && cnt_h < (H_SYNC_TIME + H_BACK_PORCH - 1 + 400))
                        vga_rgb <=      16'hf0ff;
                else if(cnt_h >= (H_SYNC_TIME + H_BACK_PORCH - 1 + 400) && cnt_h < (H_SYNC_TIME + H_BACK_PORCH - 1 + 600))
                        vga_rgb <=      16'hff0f;
                else if(cnt_h >= (H_SYNC_TIME + H_BACK_PORCH - 1 + 600) && cnt_h < (H_SYNC_TIME + H_BACK_PORCH - 1 + H_ADDR_TIME))
                        vga_rgb <=      16'hfff0;
                else
                        vga_rgb <=      16'h0000;
        end
        else
                vga_rgb <=      16'h000;
end */

wire en1;

assign en1 = (x_coor >= 0 && x_coor < 640 && y_coor >= 0 && y_coor < 480) ? 1 : 0;

wire [10:0] x_coor_0;
wire [9:0] y_coor_0;

assign x_coor_0 = en1 ? x_coor : 0;
assign y_coor_0 = en1 ? x_coor : 0;
   
always@(*)begin
    if(vga_y== y_min && vga_x>= x_min && vga_x<= x_max)
        vga_rgb<= RED;
    else if(vga_y== y_max && vga_x>= x_min && vga_x<= x_max)
        vga_rgb<= RED;
    else if(vga_x== x_min && vga_y>= y_min && vga_y<= y_max)
        vga_rgb<= RED;
    else if(vga_x== x_max && vga_y>= y_min && vga_y<= y_max)
        vga_rgb<= RED;
	else if (vga_x == x_coor )
	    vga_rgb <= RED; 
	else if (vga_y == y_coor)
	    vga_rgb <= RED;
    else if(vga_en)
        vga_rgb<=img_data;
    else
		vga_rgb<= 0;
    end
   
always  @(posedge sclk) begin
        vga_en  <=      data_req; 
end

assign  data_req        =       (cnt_h >= (H_SYNC_TIME + H_BACK_PORCH -2) && 
                                 cnt_h < (H_SYNC_TIME + H_BACK_PORCH  -2+ H_ADDR_TIME) && 
                                 cnt_v >= (V_SYNC_TIME + V_BACK_PORCH + 24) && 
                                 cnt_v < (V_SYNC_TIME + V_BACK_PORCH + V_ADDR_TIME - 24)) ? 1'b1 : 1'b0;
								 
assign  display_en      =       (cnt_h >= (H_SYNC_TIME + H_BACK_PORCH) && 
                                 cnt_h < (H_SYNC_TIME + H_BACK_PORCH + H_ADDR_TIME - 384) && 
                                 cnt_v >= (V_SYNC_TIME + V_BACK_PORCH + 24) && 
                                 cnt_v < (V_SYNC_TIME + V_BACK_PORCH + V_ADDR_TIME - 24 - 240)) ? 1'b1 : 1'b0;
//assign  vga_rgb         =       (vga_en) ? img_data : 16'h0;
assign  vga_hsync       =       (cnt_h < H_SYNC_TIME) ? 1'b1 : 1'b0;
assign  vga_vsync       =       (cnt_v < V_SYNC_TIME) ? 1'b1 : 1'b0;

endmodule
