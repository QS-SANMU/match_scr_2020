module OV_VGA_TEST(
input clk100,
input wire pclk,
input wire vsync,
input wire href,
input wire [7:0] d,

//input wire key, 
//--------------------------SRAM
//inout wire [15:0] 	sram_data,
//
//output reg			sram_oe_r,
//output reg			sram_ce_r,
//output reg			sram_we_r,
//output reg			sram_ub_r,
//output reg			sram_lb_r,
//output wire [18:0] 	sram_addr,
//------------------------------
output reg[4:0] vga_red,
output reg[5:0] vga_green,
output reg[4:0] vga_blue, 
output reg vga_hsync,
output reg vga_vsync,
output wire xclk,
output wire I2C_SCLK,
output wire I2C_SDAT,
output wire pwdm,
output wire reset_cam
    );
      parameter hRez   = 800;
      parameter hStartSync   = 840;
      parameter hEndSync     = 800+40+128;
      parameter hMaxCount    = 1056;
      
      parameter vRez         = 600;
      parameter vStartSync   = 601;
      parameter vEndSync     = 600+1+4;
      parameter vMaxCount    = 628;
	  
//	 parameter hRez   = 640;
//     parameter hStartSync   = 656;
//     parameter hEndSync     = 640+16+96;
//     parameter hMaxCount    = 800;
//    
//     parameter vRez         = 480;
//     parameter vStartSync   = 490;
//     parameter vEndSync     = 480+10+2;
//     parameter vMaxCount    = 525;
    
    parameter hsync_active   =0;
    parameter vsync_active  = 0;
    reg[11:0] hCounter;
    reg[10:0] vCounter;    
    reg[16:0] address;  
    reg blank;
    
    wire [15:0] frame_pixel;
    wire [16:0] frame_addr;
	
	wire [10:0] HCnt;
	wire [10:0] VCnt;
	wire   clk25;
	wire   clk40;
	
	reg flag_h = 0;
	reg flag_v = 0;
	
	reg [10:0] cnt;
	
   initial   hCounter = 11'b0;
   initial   vCounter = 10'b0;  
   initial   address = 17'b0;   
   initial   blank = 1'b1;    
   
     wire pwdm;
   wire reset_cam;
   
   
   assign pwdm = 1'b0;
   assign reset_cam = 1'b1;
   assign xclk = clk40;   //摄像头时钟
   
   assign frame_addr = address;
   assign HCnt = hCounter;
   assign VCnt = vCounter;
   
   always@(posedge clk40)begin
       if( hCounter == hMaxCount-1 )begin
           hCounter <=  11'b0;
   		   if (vCounter == vMaxCount-1 ) vCounter <=  10'b0;
   		   else vCounter <= vCounter+1;
   	   end
   	   else hCounter <= hCounter+1;
   
   			if (blank ==0) begin
   				vga_red   <= frame_pixel[15:11] ; 
   				vga_green <= frame_pixel[10:5];
   				vga_blue  <= frame_pixel[4:0];
   				end
   			else begin
   				vga_red   <= 5'b0;
   				vga_green <= 6'b0;
   				vga_blue  <= 5'b0;
   			     end;
   	
   			if(  vCounter  >= 480 || vCounter  < 0) begin   //410    170
   				address <= 17'b0; 
   				blank <= 1;
   				end
   			else begin
   				if ( hCounter  <= 640 && hCounter  > 0) begin  //480-160   560             160-160   240
				    if(vCounter == 240 && hCounter > 260 && hCounter < 380) begin
					    {vga_red,vga_green,vga_blue} <= 16'b11111_000000_00000;
						 address <= (hCounter - 0)/2 +(vCounter - 0)/2 * 320;
					end
					else if(hCounter == 320 && vCounter > 180 && vCounter < 300) begin
					    {vga_red,vga_green,vga_blue} <= 16'b11111_000000_00000;
						 address <= (hCounter - 0)/2 +(vCounter - 0)/2 * 320;
					end
   					else begin
					
//					if(!flag_h) begin
//					    blank <= 0;
//   					    address <= address+1;
//				      	flag_h <= ~flag_h;
//					end
//					else if(flag_h) begin
//					    blank <= 0;
//   					    address <= address;
//					  	flag_h <= ~flag_h;
//					end
					
					
				    blank <= 0;
   					address <= (hCounter - 0)/2 +(vCounter - 0)/2 * 320;
					
//					if(cnt == 'd639) begin
//						cnt <= 0;
//					end
//					else cnt <= cnt + 1'b1;
//					if(!flag_v) begin
//					    if(cnt == 'd639) begin
//						    address <= address -		 'd320;
//						    flag_v <= ~flag_v;
//						end
//						else if(!flag_h) begin
//					      blank <= 0;
//   					      address <= address+1;
//				      	flag_h <= ~flag_h;
//					    end
//					    else if(flag_h) begin
//					        blank <= 0;
//   					        address <= address;
//					  	  flag_h <= ~flag_h;
//					    end
//					end
//					
//					else if(flag_v) begin
//					    if(cnt == 'd639) begin
//						    address <= address;
//						    flag_v <= ~flag_v;
//						end
//						else if(!flag_h) begin
//					      blank <= 0;
//   					      address <= address+1;
//				      	flag_h <= ~flag_h;
//					    end
//					    else if(flag_h) begin
//					        blank <= 0;
//   					        address <= address;
//					  	  flag_h <= ~flag_h;
//					    end
//					end
					//end
					end
					
   				end
   				else
   					blank <= 1;
   				end;
			if( hCounter > hStartSync && hCounter <= hEndSync)
   				vga_hsync <= hsync_active;
   			else
   				vga_hsync <= ~ hsync_active;
   			if( vCounter >= vStartSync && vCounter < vEndSync )
   				vga_vsync <= vsync_active;
   			else
   				vga_vsync <= ~ vsync_active;

   end 
//--------------------------------

//parameter     SHOW_H_START = 160;
//parameter              SHOW_V_START = 120;
// parameter               SHOW_WIDTH = 320;
//parameter               SHOW_HEIGHT = 240;
//
//    wire [11:0] valid_h_cnt;
//    wire [10:0] valid_v_cnt;
//    assign valid_h_cnt = ((hCounter-SHOW_H_START)>=0 && (hCounter-SHOW_H_START) < SHOW_WIDTH)?(hCounter-SHOW_H_START):0;
//    assign valid_v_cnt = ((vCounter-SHOW_V_START)>=0 && (vCounter-SHOW_V_START) < SHOW_HEIGHT)?(vCounter-SHOW_V_START):0;


wire wclk; 
wire we;
wire [15:0] dout;
wire [16:0] addr;



//--------------------------------
     clk_wiz_0 clk_wiz_0
    (
     // Clock out ports
     .clk_out1(clk25),     // output clk_out1
     .clk_out2(clk40),   
    // Clock in ports
     .clk_in1(clk100));      // input clk_in1
//----------------------
blk_mem_gen_0 blk_mem_gen_0 (
  .clka(wclk),    // input wire clka
  .wea(we),      // input wire [0 : 0] wea
  .addra(addr),  // input wire [16 : 0] addra
  .dina(dout),    // input wire [15 : 0] dina
  .clkb(clk40),    // input wire clkb
  .addrb(frame_addr),  // input wire [16 : 0] addrb
  .doutb(frame_pixel)  // output wire [15 : 0] doutb
);    
//---------------------------
camCap_0 camCap_0 (
  .pclk(pclk),    // input wire pclk
  .vsync(vsync),  // input wire vsync
  .href(href),    // input wire href
  .d(d),          // input wire [7 : 0] d
  .addr(addr),    // output wire [16 : 0] addr
  .dout(dout),    // output wire [15 : 0] dout
  .we(we),        // output wire we
  .wclk(wclk)    // output wire wclk
);    
//------------------------
IICctrl_0 IICctrl_0 (
  .iCLK(clk25),          // input wire iCLK
  .I2C_SCLK(I2C_SCLK),  // output wire I2C_SCLK
  .I2C_SDAT(I2C_SDAT)  // inout wire I2C_SDAT
);  

/*
//----------------------key
wire 		key1_flag;


key key(
	.clk		(clk40),
	.key1		(key),	
	.key1_flag  (key1_flag)
);


//-----------------SRAM_TIMING
parameter SRAM_ADDR_END = 76800;		
reg	[2:0]	state = 0;	
reg			en = 0;
reg [15:0]	sram_din;
reg 		read = 0;
	
assign sram_data = (en)? 16'bz:sram_din;
assign sram_addr = (read)? cap_addr:{2'b00,frame_addr};  //与BRAM的地址一致，保存BRAM的图像数据

always @(negedge clk40)
	if(en == 0)
		sram_din <= frame_pixel;
//---
always @(posedge clk40)
	case(state)
	0:	if(key1_flag == 1)
			state <= 1;
	1:	if(frame_addr == SRAM_ADDR_END-1) 
			state <= 2;
	2:	begin  //开始写数据
			sram_oe_r <= 1'b1;
			sram_we_r <= 1'b0;
			sram_ce_r <= 1'b0;
			sram_ub_r <= 1'b0;
			sram_lb_r <= 1'b0;
			en <=0;
			read <=0;
			if(frame_addr == SRAM_ADDR_END-1)
				state <= 3;
			end
	3:	begin //数据写完，开始读数据
			sram_oe_r <= 1'b0;
			sram_we_r <= 1'b1;
			sram_ce_r <= 1'b0;
			sram_ub_r <= 1'b0;
			sram_lb_r <= 1'b0;
			en <= 1;	
			read <= 1;
			state <= 0;
			end
	default: ;
	endcase
//---------------
always @(negedge clk40)
	if(en == 1)
		cap_pixel <= sram_data;
	else 
		cap_pixel <= 16'b11111_000000_00000;
//---
*/

endmodule