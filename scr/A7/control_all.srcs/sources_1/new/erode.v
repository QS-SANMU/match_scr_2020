`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/24 18:29:31
// Design Name: 
// Module Name: erode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module erode(
    input				clk,  				
	input				rst_n,				

	//Image data prepred to be processd
	input				per_frame_vsync,	
	input				per_frame_href,		
	input				per_frame_clken,	
	input				per_img_Bit,		
	
	//Image data has been processd
	output				post_frame_vsync,	
	output				post_frame_href,	
	output				post_frame_clken,	
	output				post_img_Bit		
);

//----------------------------------------------------
//Generate 1Bit 3X3 Matrix for Video Image Processor.
//Image data has been processd
wire			matrix_frame_vsync;	
wire			matrix_frame_href;	
wire			matrix_frame_clken;		
wire			matrix_p11, matrix_p12, matrix_p13;	
wire			matrix_p21, matrix_p22, matrix_p23;
wire			matrix_p31, matrix_p32, matrix_p33;

matrix_3x3 matrix_3x3 (
    .clk(clk), 
    .rst_n(rst_n), 
	
    .per_frame_vsync(per_frame_vsync), 
    .per_frame_href(per_frame_href), 
    .per_frame_clken(per_frame_clken), 
    .per_img_Bit(per_img_Bit), 
	
    .matrix_frame_vsync(matrix_frame_vsync), 
    .matrix_frame_href(matrix_frame_href), 
    .matrix_frame_clken(matrix_frame_clken), 
	
    .matrix_p11(matrix_p11), 
    .matrix_p12(matrix_p12), 
    .matrix_p13(matrix_p13), 
	
    .matrix_p21(matrix_p21), 
    .matrix_p22(matrix_p22), 
    .matrix_p23(matrix_p23), 
	
    .matrix_p31(matrix_p31), 
    .matrix_p32(matrix_p32), 
    .matrix_p33(matrix_p33)
    );

//Step1
reg	post_img_Bit1,	post_img_Bit2,	post_img_Bit3;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		post_img_Bit1 <= 1'b0;
		post_img_Bit2 <= 1'b0;
		post_img_Bit3 <= 1'b0;
		end
	else
		begin
		post_img_Bit1 <= matrix_p11 & matrix_p12 & matrix_p13;
		post_img_Bit2 <= matrix_p21 & matrix_p22 & matrix_p23;
		post_img_Bit3 <= matrix_p31 & matrix_p32 & matrix_p33;
		end
end

/*
reg [9:0]cnt;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt <= 0;
	else if(cnt == 'd1023) cnt <= 0;
	else cnt <= cnt + 1'b1;
end

reg post_img_Bit2_0;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) post_img_Bit2_0 <= post_img_Bit2;
    else if(cnt == 'd1023) post_img_Bit2_0 <= post_img_Bit2;
    else post_img_Bit2_0 <= post_img_Bit2_0;	
end

reg [10:0]cnt_0;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) cnt_0 <= 0;
	else if(cnt_0 == 'd2047) cnt_0 <= 0;
	else cnt_0 <= cnt_0 + 1'b1;
end

reg post_img_Bit3_0;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) post_img_Bit3_0 <= post_img_Bit1;
    else if(cnt_0 == 'd2047) post_img_Bit3_0 <= post_img_Bit1;
    else post_img_Bit3_0 <= post_img_Bit3_0;	
end
*/

//Step 2
reg	post_img_Bit4;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		post_img_Bit4 <= 1'b0;
	else
		post_img_Bit4 <= post_img_Bit1 & post_img_Bit2 & post_img_Bit3;
end

//------------------------------------------
//lag 2 clocks signal sync  
reg	[1:0]	per_frame_vsync_r;
reg	[1:0]	per_frame_href_r;	
reg	[1:0]	per_frame_clken_r;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		per_frame_vsync_r <= 0;
		per_frame_href_r <= 0;
		per_frame_clken_r <= 0;
		end
	else
		begin
		per_frame_vsync_r 	<= 	{per_frame_vsync_r[0], 	matrix_frame_vsync};
		per_frame_href_r 	<= 	{per_frame_href_r[0], 	matrix_frame_href};
		per_frame_clken_r 	<= 	{per_frame_clken_r[0], 	matrix_frame_clken};
		end
end
assign	post_frame_vsync 	= 	per_frame_vsync_r[1];
assign	post_frame_href 	= 	per_frame_href_r[1];
assign	post_frame_clken 	= 	per_frame_clken_r[1];
assign	post_img_Bit		=	post_frame_href ? post_img_Bit4 : 1'b0;

endmodule
