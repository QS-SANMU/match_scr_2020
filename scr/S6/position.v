`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:12 10/02/2020 
// Design Name: 
// Module Name:    position 
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
module position(

//system signals
	input					sclk			, 
	input					s_rst_n			,
	//图像数据输入
	input					vsync_i			,
	input					hsync_i			,
	input					data_en_i		,
	input					bound_data_i	,
//	input           [9:0]  row_cnt,
//	input           [10:0]  col_cnt,
	//坐标数据
	output	wire	[10:0]	x_coor			,
	output	wire  	[9:0]	y_coor			,
	output	wire			coor_valid_flag	
//	output  reg 	[15:0]		valid_num_cnt,
//	output reg		[31:0]		x_coor_all		,
//    output reg      [31:0]        y_coor_all        
	
);
//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/

reg 						data_en_i_pos	;
reg 						data_en_i_r1	;

reg 						vsync_i_pos		;
reg 						vsync_i_neg		;
reg 						vsync_i_r1		;

reg 			[15:0]		valid_num_cnt	;

reg 						valid_flag		;

reg				[31:0]		x_coor_all		;
reg				[31:0]		y_coor_all		;
reg 			[9:0]		row_cnt			;
reg 			[10:0]		col_cnt			;

// reg 			[9:0]		y_coor_up		;
// reg 			[9:0]		y_coor_down		;
// reg 						y_flag			;

reg 			[9:0]		row_cnt_0			;
reg 			[9:0]		row_cnt_1			;
reg 			[9:0]		row_cnt_2			;
reg 			[9:0]		row_cnt_3			;
reg 			[10:0]		col_cnt_0			;
reg 			[10:0]		col_cnt_1			;
reg 			[10:0]		col_cnt_2			;
reg 			[10:0]		col_cnt_3			;

//=============================================================================
//****************************     Main Code    *******************************
//=============================================================================


parameter     RANGE     =     4000;

//always @(posedge sclk or negedge s_rst_n)
//begin
//	if(!s_rst_n)begin
//		row_cnt_3 <= 10'b0;
//		row_cnt_2 <= 10'b0;
//		row_cnt_1 <= 10'b0;
//		row_cnt_0 <= 10'b0;
//		col_cnt_3 <= 11'b0;
//		col_cnt_2 <= 11'b0;
//		col_cnt_1 <= 11'b0;
//		col_cnt_0 <= 11'b0;
//	end	
//	else begin
//		row_cnt_3 <= row_cnt_2;
//		row_cnt_2 <= row_cnt_1;
//		row_cnt_1 <= row_cnt_0;
//		row_cnt_0 <= row_cnt;
//		col_cnt_3 <= col_cnt_2;
//		col_cnt_2 <= col_cnt_1;
//		col_cnt_1 <= col_cnt_0;
//		col_cnt_0 <= col_cnt;
//	end
//end
//

//TFT_DE行有效上升沿
always @ (posedge sclk) begin	
	data_en_i_r1 <= data_en_i;
end

always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		data_en_i_pos <= 1'b0;
	else if (~data_en_i_r1 && data_en_i)
	    data_en_i_pos <= 1'b1;    
	else	
        data_en_i_pos <= 1'b0;
end


//场有效上升沿
always @ (posedge sclk) begin	
	vsync_i_r1 <= vsync_i;
end

always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		vsync_i_pos <= 1'b0;
	else if (~vsync_i_r1 && vsync_i)
	    vsync_i_pos <= 1'b1;    
	else	
        vsync_i_pos <= 1'b0;
end

//场有效下降沿
always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		vsync_i_neg <= 1'b0;
	else if (vsync_i_r1 && ~vsync_i)
	    vsync_i_neg <= 1'b1;    
	else	
        vsync_i_neg <= 1'b0;
end

reg vsync_i_neg_r;
always @ (posedge sclk ) 
    vsync_i_neg_r <= vsync_i_neg;

//行计数 每当输出有效信号渡过行同步时触发上升沿，表示一次场信号得来临
always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		row_cnt <= 10'd0;
	else if (vsync_i_neg == 1'b1)        	
		row_cnt <= 10'd0; 	
	else if (data_en_i_pos == 1'b1 )
		row_cnt <= row_cnt + 1'b1;   
end

//列计数 输出有效信号得高电平对应时钟长度决定了该行数目
 always @ (posedge sclk or negedge s_rst_n) begin
 	if(s_rst_n == 1'b0)
 		col_cnt <= 11'd0;
 	else if (data_en_i == 1'b1 )
 		col_cnt <= col_cnt + 1'b1;
 	else	
         col_cnt <= 11'd0;
 end

//目标数据计数  场同步触发下降沿表征下一帧图片来临
always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		valid_num_cnt <= 16'd0;
	else if (vsync_i_neg == 1'b1)
		valid_num_cnt <= 16'd0;   
	else if (data_en_i == 1'b1 && bound_data_i == 1'b1 )
		valid_num_cnt <= valid_num_cnt + 1'b1;   
end


//目标有效标志  对少数得物体设计阈值忽略，超过阈值则发送有效信号
always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		valid_flag <= 1'b0;
	else if (vsync_i_neg == 1'b1)
		valid_flag <= 1'b0;	        
	else if (valid_num_cnt >= RANGE)
		valid_flag <= 1'b1;      
end

//x坐标求和
always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		x_coor_all <= 32'd0;
	else if (data_en_i == 1'b1 && bound_data_i == 1'b1)
	    x_coor_all <=  x_coor_all +  col_cnt;  
	else if (vsync_i_neg == 1'b1)
	    x_coor_all <= 32'd0;    	   
end


//y坐标求和
always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
		y_coor_all <= 32'd0;
	else if (data_en_i == 1'b1 && bound_data_i == 1'b1 )
	    y_coor_all <=  y_coor_all +  row_cnt;  
	else if (vsync_i_neg == 1'b1)
	    y_coor_all <= 32'd0;    	   
end

reg [10:0] x_coor_nocir; 
reg [9:0] y_coor_nocir; 

//assign x_coor_nocir =  ((vsync_i == 1'b1 ))? x_coor_all/valid_num_cnt : 10'd0;
//assign y_coor =  ((vsync_i == 1'b1 ))? y_coor_all/valid_num_cnt : 10'd0;

always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
	   x_coor_nocir <= 11'd0;
	else if((vsync_i == 1'b1 && valid_flag))
	    x_coor_nocir <=  x_coor_all/valid_num_cnt;
	else 
	   x_coor_nocir <= x_coor_nocir;
	 end

assign x_coor = x_coor_nocir ;

assign coor_valid_flag = (vsync_i) ? valid_flag : coor_valid_flag;

always @ (posedge sclk or negedge s_rst_n) begin
	if(s_rst_n == 1'b0)
	   y_coor_nocir <= 10'd0;
	else if((vsync_i == 1'b1 && valid_flag))
	    y_coor_nocir <=  y_coor_all/valid_num_cnt;
	else 
	   y_coor_nocir <= y_coor_nocir;
	 end
 assign y_coor = y_coor_nocir ;


/*   
   input           clk,
    input           rst_n,
    input           per_frame_vsync,
    input           per_frame_href,
    input           per_frame_clken,
    input           per_img_Bit,
    output          post_frame_vsync,
    output          post_frame_href,
    output          post_frame_clken,
    output  reg [11:0]  x_min,
    output  reg [11:0]  x_max,
    output  reg [11:0]  y_min,
    output  reg [11:0]  y_max,
    output     [15:0]      post_img
    );

//parameter   ROW_CNT = 16;   //just test
//parameter   COL_CNT = 4;    //just test
parameter   ROW_CNT = 1024;
parameter   COL_CNT = 720;

reg     [11:0]  cnt_x;
reg     [11:0]  cnt_y;
wire    row_flag;


wire flag ;//开始本帧数据
assign flag = (cnt_x == 1 && cnt_y == 1)? 1'b1:1'b0;

//-------------------------------------------------------
//cnt_x lag 1clk
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        cnt_x <= 0;
    end
    else if(per_frame_clken && cnt_x == ROW_CNT - 1)
        cnt_x <= 0;
    else if(per_frame_clken)begin
        cnt_x <= cnt_x + 1'b1;
    end
    else 
        cnt_x <= cnt_x;
end
assign  row_flag = (per_frame_clken && cnt_x == ROW_CNT - 1'b1)? 1'b1:1'b0;
//cnt_y
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        cnt_y <= 0;
    end
    else if(row_flag  &&  cnt_y == COL_CNT - 1'b1)
        cnt_y <= 0;
    else if(row_flag)begin
        cnt_y <= cnt_y + 1'b1;
    end
    else 
        cnt_y <= cnt_y;
end

//-------------------------------------------------------
//x_min lag 2clk
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_min <= ROW_CNT;
    end
    else if(flag)
        x_min <= ROW_CNT;
    else if(per_frame_clken && per_img_Bit == 1 && x_min > cnt_x)
        x_min <= cnt_x;
    else 
        x_min <= x_min;
end
//x_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_max <= 0;
    end
    else if(flag)
        x_max <= 0;
    else if(per_frame_clken && per_img_Bit == 1 && x_max < cnt_x)
        x_max <= cnt_x;
    else 
        x_max <= x_max;
end
//y_min
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_min <= COL_CNT;
    end
    else if(flag)
        y_min <= COL_CNT;
    else if(per_frame_clken && per_img_Bit == 1 && y_min > cnt_y)
        y_min <= cnt_y;
    else 
        y_min <= y_min;
end
//y_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_max <= 0;
    end
    else if(flag)
        y_max <= 0;
    else if(per_frame_clken && per_img_Bit == 1 && y_max < cnt_y)
        y_max <= cnt_y;
    else 
        y_max <= y_max;
end

//-------------------------------------------------------
//lag 3clk

reg [15:0]  post_img_r;



//---------------------------------------------
//pre_frame_clken, pre_frame_href, pre_frame_vsync,lag 3clk

reg 	[3:0] 	per_frame_clken_r;
reg 	[3:0] 	per_frame_href_r;
reg 	[3:0] 	per_frame_vsync_r;
reg     [3:0]   per_img_r;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)begin
		per_frame_clken_r <= 4'b0;
		per_frame_href_r <=  4'b0;
		per_frame_vsync_r <= 4'b0;
        per_img_r <= 0;
	end	
	else begin
		per_frame_clken_r <= {per_frame_clken_r [2:0], per_frame_clken};
		per_frame_href_r  <= {per_frame_href_r  [2:0],per_frame_href};
		per_frame_vsync_r <= {per_frame_vsync_r [2:0],per_frame_vsync};
        per_img_r <= {per_img_r[2:0],per_img_Bit};
	end
end

assign post_frame_clken = per_frame_clken;
assign post_frame_href  = per_frame_href;
assign post_frame_vsync = per_frame_vsync_r;


    input clk,
	input rst_n,
	input per_img_Y,
	input data_req,
	input vga_hsync,
	input vga_vsync,
	input [10:0] cnt_x,
	input [9:0] cnt_y,
	output  [10:0] x_max,
	output  [10:0] x_min,
	output  [9:0] y_max,
	output  [9:0] y_min
    );

parameter   ROW_CNT = 1024;
parameter   COL_CNT = 720;

reg vga_vsync_0;
always@(posedge clk or negedge rst_n) begin
    if(!rst_n) vga_vsync_0 <= 0;
	else vga_vsync_0 <= vga_vsync;
end

wire nege_vga_vsync;
assign nege_vga_vsync = ~vga_vsync && vga_vsync_0;

wire flag ;//开始本帧数据
assign flag = (cnt_x == 1 && cnt_y == 1)? 1'b1:1'b0;

wire en_end ;//结束本帧数据
assign en_end = (cnt_x == 'd1024 && cnt_y == 'd720)? 1'b1:1'b0;

reg [10:0] x_max_0;
reg [10:0] x_min_0;
reg [9:0]  y_max_0;
reg [9:0]  y_min_0;

//-------------------------------------------------------
//x_min lag 2clk
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_min_0 <= ROW_CNT;
    end
    else if(flag)
        x_min_0 <= ROW_CNT;
    else if(per_img_Y== 1'b1 && x_min_0 > cnt_x)
        x_min_0 <= cnt_x;
    else
        x_min_0 <= x_min_0;
end
//x_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        x_max_0 <= 0;
    end
    else if(flag)
        x_max_0 <= 0;
    else if(per_img_Y== 1'b1 && x_max_0 < cnt_x)
        x_max_0 <= cnt_x;
    else
        x_max_0 <= x_max_0;
end
//y_min
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_min_0 <= COL_CNT;
    end
    else if(flag)
        y_min_0 <= COL_CNT;
    else if(per_img_Y== 1'b1 && y_min_0 > cnt_y)
        y_min_0 <= cnt_y;
    else
        y_min_0 <= y_min_0;
end
//y_max
always @(posedge clk or negedge rst_n)begin
    if(rst_n == 1'b0)begin
        y_max_0 <= 0;
    end
    else if(flag)
        y_max_0 <= 0;
    else if(per_img_Y== 1'b1 && y_max_0 < cnt_y)
        y_max_0 <= cnt_y;
    else
        y_max_0 <= y_max_0;
end

assign x_min = nege_vga_vsync? x_min_0 : 0;
assign x_max = nege_vga_vsync? x_max_0 : 0;
assign y_min = nege_vga_vsync? y_min_0 : 0;
assign y_max = nege_vga_vsync? y_max_0 : 0;

//assign x_min =  x_min_0 ;
//assign x_max =  x_max_0 ;
//assign y_min =  y_min_0 ;
//assign y_max =  y_max_0 ;

*/
endmodule
