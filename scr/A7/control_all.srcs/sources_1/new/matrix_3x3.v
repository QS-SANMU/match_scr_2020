`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/24 17:18:41
// Design Name: 
// Module Name: matrix_3x3
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
module matrix_3x3(
    input				clk,  				
	input				rst_n,				


	input				per_frame_vsync,	
	input				per_frame_href,		
	input				per_frame_clken,
	input				per_img_Bit,		


	output				matrix_frame_vsync,	
	output				matrix_frame_href,	
	output				matrix_frame_clken,	
	output	reg			matrix_p11, matrix_p12, matrix_p13,	
	output	reg			matrix_p21, matrix_p22, matrix_p23,
	output	reg			matrix_p31, matrix_p32, matrix_p33
);

	
wire	row1_data;	//frame data of the 1th row
wire	row2_data;	//frame data of the 2th row
reg		row3_data;	//frame data of the 3th row
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		row3_data <= 0;
	else 
		begin
		if(per_frame_clken)
			row3_data <= per_img_Bit;
		else
			row3_data <= row3_data;
		end	
end

//---------------------------------------
//module of shift ram for raw data

wire	shift_clk_en = per_frame_clken;

c_shift_ram_0 c_shift_ram_0 (
  .D(row3_data),      // input wire [0 : 0] D
  .CLK(clk),  // input wire CLK
  .CE(shift_clk_en),    // input wire CE
  .Q(row2_data)      // output wire [0 : 0] Q
);

c_shift_ram_0 c_shift_ram_1 (
  .D(row2_data),      // input wire [0 : 0] D
  .CLK(clk),  // input wire CLK
  .CE(shift_clk_en),    // input wire CE
  .Q(row1_data)      // output wire [0 : 0] Q
);



//------------------------------------------
//lag 2 clocks signal sync  
reg	[2:0]	per_frame_vsync_r;
reg	[2:0]	per_frame_href_r;	
reg	[2:0]	per_frame_clken_r;
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
		per_frame_vsync_r 	<= 	{per_frame_vsync_r[1:0], 	per_frame_vsync};
		per_frame_href_r 	<= 	 {per_frame_href_r[1:0], 	per_frame_href};
		per_frame_clken_r 	<= 	{per_frame_clken_r[1:0], 	per_frame_clken};
		end
end
//Give up the 1th and 2th row edge data caculate for simple process
//Give up the 1th and 2th point of 1 line for simple process
wire	read_frame_href		=	 per_frame_href_r[1];	//RAM read href sync signal
wire	read_frame_clken	=	per_frame_clken_r[1];	//RAM read enable

assign	matrix_frame_vsync 	= 	per_frame_vsync_r[2];
assign	matrix_frame_href 	= 	 per_frame_href_r[2];
assign	matrix_frame_clken 	= 	per_frame_clken_r[2];


always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
		{matrix_p11, matrix_p12, matrix_p13} <= 3'b0;
		{matrix_p21, matrix_p22, matrix_p23} <= 3'b0;
		{matrix_p31, matrix_p32, matrix_p33} <= 3'b0;
		end
	else if(read_frame_href)
		begin
		if(read_frame_clken)	//Shift_RAM data read clock enable
			begin
			{matrix_p11, matrix_p12, matrix_p13} <= {matrix_p12, matrix_p13, row1_data};	//1th shift input
			{matrix_p21, matrix_p22, matrix_p23} <= {matrix_p22, matrix_p23, row2_data};	//2th shift input
			{matrix_p31, matrix_p32, matrix_p33} <= {matrix_p32, matrix_p33, row3_data};	//3th shift input
			end
		else
			begin
			{matrix_p11, matrix_p12, matrix_p13} <= {matrix_p11, matrix_p12, matrix_p13};
			{matrix_p21, matrix_p22, matrix_p23} <= {matrix_p21, matrix_p22, matrix_p23};
			{matrix_p31, matrix_p32, matrix_p33} <= {matrix_p31, matrix_p32, matrix_p33};
			end	
		end
	else
		begin
		{matrix_p11, matrix_p12, matrix_p13} <= 3'b0;
		{matrix_p21, matrix_p22, matrix_p23} <= 3'b0;
		{matrix_p31, matrix_p32, matrix_p33} <= 3'b0;
		end
end


endmodule
