`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:22 05/06/2020 
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
module top(
    clk,
	rst_n,
	//VGA
	coor_valid_flag,
	//sdram
	sdram_clk,
	sdram_cke,
	sdram_cs_n,
	sdram_cas_n,
	sdram_ras_n,
	sdram_we_n,
	sdram_bank,
	sdram_addr,
	sdram_dqm,
	sdram_dq,
	//ov5640
    ov5640_pwdn,
    ov5640_rst_n,
    ov5640_xclk,
    ov5640_iic_scl,
    ov5640_iic_sda,
	//
	ov5640_pclk,
	ov5640_href,
	ov5640_vsync,
	ov5640_data,
	
	data_z,
	data_x,
    key_in,
    vga_in_z,  
    hs_in_z,
    vs_in_z,
    vga_hs_out,
    vga_vs_out, 
    rgb_out  
    );
output  vga_hs_out  ;
output  vga_vs_out  ;
output  [15:0]rgb_out ;

input   hs_in_z;
input   vs_in_z;
input [15:0]  vga_in_z;

input key_in;
input clk;
input rst_n;
//VGA
wire vga_hs;
wire vga_vs;
wire [15:0]rgb;

output coor_valid_flag;
//sdram
output  sdram_clk;
output	sdram_cke;
output	sdram_cs_n;
output	sdram_cas_n;
output	sdram_ras_n;
output	sdram_we_n;
output	[1:0]sdram_bank;
output	[12:0]sdram_addr;
output	[1:0]sdram_dqm;
inout	[15:0]sdram_dq ;
//ov5640
output wire ov5640_pwdn;
output wire ov5640_rst_n;
output wire ov5640_xclk;
output wire ov5640_iic_scl;
inout ov5640_iic_sda;
//
input 	ov5640_pclk;
input	ov5640_href;
input	ov5640_vsync;
input	[7:0]ov5640_data;


output data_x;
output data_z;

wire clk_sys65m;
wire clk_sys100m;
wire clk_sys50m;
wire clk_sys24m;

wire [15:0]vga_rgb;
wire data_req;
wire [15:0]img_data;
wire LOCKED;


wire [7:0]po_data;
wire rx_down;
wire rfifo_rd_ready;
wire wfifo_wr_en;
wire [15:0]wfifo_wr_data;
wire init_done;
//ov5640
wire estart;
wire [31:0]ewdata;
wire [7:0]riic_data;
wire [15:0]m_data;
wire m_wr_en;

wire [7:0] img_Y_r1;

wire [15:0] y;
wire [10:0] x_max;
wire [10:0] x_min;
wire [9:0] y_max;
wire [9:0] y_min;
wire [10:0] vga_x;
wire [9:0] vga_y;
wire [10:0] x_coor;
wire [9:0] y_coor;


wire post1_frame_vsync;	
wire post1_frame_href;	
wire post1_frame_clken;	
wire post1_img_Y;		

wire post2_frame_vsync;	
wire post2_frame_href;	
wire post2_frame_clken;	
wire post2_img_Y;	

wire post3_frame_vsync;	
wire post3_frame_href;	
wire post3_frame_clken;
wire post3_img_Y;

wire post4_frame_vsync;	
wire post4_frame_href;	
wire post4_frame_clken;

	
//wire [15:0]img_width;
//wire [15:0]img_height;
assign rgb = vga_rgb;

wire [7:0] angle_z ;
wire [7:0] angle_x ;

assign angle_z = (56 * x_coor) / 'd1024;
assign angle_x = (40 * y_coor) / 'd720;


wire flag;
clk_0_5 clk_0_5(
	.clk(clk_sys50m),
	.rst_n(rst_n),
	.flag(flag)
    );


TX TX_1(
    .clk(clk_sys50m),
    .rst(rst_n),
    .tx_data(angle_z),
    .tx_en(flag),
	
    . data_out(data_z)
    );
	
	TX TX_2(
    .clk(clk_sys50m),
    .rst(rst_n),
    .tx_data(angle_x),
    .tx_en(flag),
	
    .data_out(data_x)
    );





clk_wiz_v3_6 instance_name
   (// Clock in ports
    .CLK_IN1(clk),      // IN
    // Clock out ports
    .CLK_OUT1(clk_sys100m),     // OUT
	.CLK_OUT2(clk_sys50m),     // OUT
    .CLK_OUT3(clk_sys24m),     // OUT
    // Status and control signals
    .RESET(!rst_n),// IN
    .LOCKED(LOCKED));
	

 clk_wiz_ip  clk_wiz_ip_inst
   (// Clock in ports
    .CLK_IN1(clk_sys50m),      // IN
    // Clock out ports
    .CLK_OUT1(clk_sys65m),     // OUT
    // Status and control signals
    .RESET(!rst_n),// IN
    .LOCKED());      // OUT
	
sdram_top  sdram_top_inst(
    .clk(clk_sys100m),
	.rst_n(rst_n),
	.sdram_clk(sdram_clk),
	.sdram_cke(sdram_cke),
	.sdram_cs_n(sdram_cs_n),
	.sdram_cas_n(sdram_cas_n),
	.sdram_ras_n(sdram_ras_n),
	.sdram_we_n(sdram_we_n),
	.sdram_bank(sdram_bank),
	.sdram_addr(sdram_addr),
	.sdram_dqm(sdram_dqm),
	.sdram_dq(sdram_dq),
    //wfifo
    .wfifo_wr_en(m_wr_en),
    .wfifo_wr_data(m_data),
    .wfifo_wr_clk(ov5640_pclk),
    //rfifo
    .rfifo_rd_clk(clk_sys65m),
    .rfifo_rd_en(data_req),
    .rfifo_rd_data(img_data),
    .rfifo_rd_ready(rfifo_rd_ready),
	.init_done(init_done)
    );	
	
ov5640_top    ov5640_top_inst(
    .clk_sys50m(clk_sys50m),
	.clk_sys24m(clk_sys24m),
    .rst_n(rst_n & init_done),
	//
    .ov5640_pwdn(ov5640_pwdn),
	.ov5640_rst_n(ov5640_rst_n),
	.ov5640_xclk(ov5640_xclk),
	.ov5640_iic_scl(ov5640_iic_scl),
	.ov5640_iic_sda(ov5640_iic_sda),
	//
	.estart(estart),
	.ewdata(ewdata),
	.riic_data(riic_data),
	//
	.ov5640_pclk(ov5640_pclk),
	.ov5640_href(ov5640_href),
	.ov5640_vsync(ov5640_vsync),
	.ov5640_data(ov5640_data),
	//
	.m_data(m_data),
	.m_wr_en(m_wr_en)
    );	
	
		
vga_drive vga_drive_inst (
    .sclk(clk_sys65m), 
    .s_rst_n(rst_n & rfifo_rd_ready), 
	.y_coor(y_coor),
	.x_coor(x_coor),
    .x_max(x_max), 
    .x_min(x_min), 
    .y_max(y_max), 
    .y_min(y_min), 
    .vga_hsync(vga_hs), 
    .vga_vsync(vga_vs), 
    .vga_rgb(vga_rgb), 
    .vga_x(vga_x), 
    .vga_y(vga_y), 
    .data_req(data_req), 
//	.img_data(y)
    .img_data({16{post1_img_Y}})
    );
	
color_identify color_identify (
    .clk(clk_sys65m), 
    .rst_n(rst_n),  
	.per_frame_vsync(ov5640_vsync), 
	.per_frame_href(ov5640_href), 
    .per_frame_clken(m_wr_en), 
	
	.post_frame_vsync(post1_frame_vsync), 
	.post_frame_href(post1_frame_href), 
	.post_frame_clken(post1_frame_clken), 
    .img_data(img_data), 
    .y(y),
    .img_Y_r1(img_Y_r1),
    .post_img_Y(post1_img_Y)
    ); 
	
	position             position(
        //system signals
        .sclk                   (clk_sys65m                   ), 
        .s_rst_n                (rst_n               ),
        //图像数据输入
        .vsync_i                (vga_vs            ),
        .hsync_i                (vga_hs            ),
        .data_en_i              (data_req         ),
        .bound_data_i           (post1_img_Y       ),
//		.col_cnt(vga_x),
//		.row_cnt(vga_y),
        //坐标数据
        .x_coor                 (x_coor                 ),
        .y_coor                 (y_coor                 ),
        .coor_valid_flag        (coor_valid_flag        )
//        .valid_num_cnt          (valid_num_cnt          ),
//        .x_coor_all        (x_coor_all),
//        .y_coor_all        (y_coor_all)
);	
wire_wire wire_wire(
    .clk                (clk_sys50m ),
	.rst_n              (rst_n      ),
	.key_in             (key_in     ),
    .vga_in_f           (rgb        ),
	.hs_in_f            (vga_hs     ),
	.vs_in_f            (vga_vs     ),
	.vga_in_z           (vga_in_z   ),
	.hs_in_z            (hs_in_z    ),
	.vs_in_z            (vs_in_z    ),
	.hs_out             (vga_hs_out     ),
	.vs_out             (vga_vs_out     ),
    .vga_out            (rgb_out    )
    );
/*
    position position (
    .clk(clk_sys65m), 
    .rst_n(rst_n), 
    .per_img_Y(post1_img_Y), 
    .data_req(data_req), 
	.vga_hsync(vga_hs), 
    .vga_vsync(vga_vs), 
    .cnt_x(vga_x), 
    .cnt_y(vga_y), 
    .x_max(x_max), 
    .x_min(x_min), 
    .y_max(y_max), 
    .y_min(y_min)
    );
 
  

   position position (
    .clk(clk_sys65m), 
    .rst_n(rst_n), 
    .per_frame_vsync (post1_frame_vsync), 
    .per_frame_href  (post1_frame_href), 
    .per_frame_clken (post1_frame_clken), 
    .per_img_Bit     (post1_img_Y),
	.cnt_x           (vga_x),
	.cnt_y           (vga_y),
	
    .post_frame_vsync(post4_frame_vsync), 
    .post_frame_href (post4_frame_href), 
    .post_frame_clken(post4_frame_clken), 
    .x_min(x_min), 
    .x_max(x_max), 
    .y_min(y_min), 
    .y_max(y_max)
    );
  
  	dilate_1 dilate_1 (
    .PCLK(clk_sys65m),
    .VtcHCnt(vga_x),
    .VtcVCnt(vga_y),
    .pix_i(post1_img_Y),
    .pix_o(post2_img_Y)
  );
	

dilate dilate (           // 膨胀算法
    .clk(clk_sys65m), 
    .rst_n(rst_n), 
    .per_frame_vsync(post2_frame_vsync), 
    .per_frame_href (post2_frame_href), 
    .per_frame_clken(post2_frame_clken), 
    .per_img_Bit    (post2_img_Y), 
	
    .post_frame_vsync(post3_frame_vsync), 
    .post_frame_href (post3_frame_href), 
    .post_frame_clken(post3_frame_clken), 
    .post_img_Bit    (post3_img_Y)
    );


	dilate_0 dilate_0 (
    .clk_25m(clk_sys65m), 
    .rst_n(rst_n), 
    .read_begin(post1_frame_clken), 
    .pixel(post1_img_Y), 
    .etch(post2_img_Y)
    );


erode erode (          //腐蚀算法
    .clk(clk_sys65m), 
    .rst_n(rst_n), 
    .per_frame_vsync(post1_frame_vsync), 
    .per_frame_href (post1_frame_href), 
    .per_frame_clken(post1_frame_clken), 
    .per_img_Bit    (post1_img_Y), 
	
    .post_frame_vsync(post2_frame_vsync), 
    .post_frame_href (post2_frame_href), 
    .post_frame_clken(post2_frame_clken), 
    .post_img_Bit    (post2_img_Y)
    );


	position position (
    .clk(clk_sys65m), 
    .rst_n(rst_n), 
    .per_frame_vsync (post1_frame_vsync), 
    .per_frame_href  (post1_frame_href), 
    .per_frame_clken (data_req), 
    .per_img_Bit     (post1_img_Y),
	
    .post_frame_vsync(post4_frame_vsync), 
    .post_frame_href (post4_frame_href), 
    .post_frame_clken(post4_frame_clken), 
    .x_min(x_min), 
    .x_max(x_max), 
    .y_min(y_min), 
    .y_max(y_max)
    );
	
	*/
	
endmodule
