`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:33:17 05/16/2020 
// Design Name: 
// Module Name:    sdram_auto_write_read 
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
module  auto_write_read(
        // system signals
        input                   s_rst_n                 ,       
        // wfifo
        input                   wfifo_wclk              ,
        input                   wfifo_wr_en             ,       
        input           [15:0]  wfifo_wr_data           ,
        input                   wfifo_rclk              ,
        input                   wfifo_rd_en             ,       
        output  wire    [15:0]  wfifo_rd_data           ,
        output  reg             wr_trig                 ,
        // rfifo
        input                   rfifo_wclk              ,       // 100MHz
        input                   rfifo_wr_en             ,       
        input           [15:0]  rfifo_wr_data           ,
        input                   rfifo_rclk              ,
        input                   rfifo_rd_en             ,       
        output  wire    [15:0]  rfifo_rd_data           ,
        output  reg             rd_trig                 ,
        // user interfaces
        output  reg             rfifo_rd_ready          
);

//========================================================================\
// =========== Define Parameter and Internal signals =========== 
//========================================================================/
localparam      WFIFO_RD_CNT    =       256                     ;
localparam      RFIFO_WR_CNT    =       243                     ;

wire    [ 9:0]                  wfifo_rside_usedw               ;
wire    [ 9:0]                  wfifo_wside_usedw               ;

wire    [ 9:0]                  rfifo_rside_usedw               ;
wire    [ 9:0]                  rfifo_wside_usedw               ;

reg                             rfifo_wr_valid                  ;
wire                            rd_trig_pos                     ;
reg                             rd_trig_r1                      ;
reg                             rfifo_wr_en_r1                  ;
reg                             rd_trig_flag                    ;
//=============================================================================
//**************    Main Code   **************
//=============================================================================
/* always  @(posedge wfifo_rclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                wr_trig <=      1'b0;
        else if(wfifo_rside_usedw >= WFIFO_RD_CNT)
                wr_trig <=      1'b1;
        else
                wr_trig <=      1'b0;
end

always  @(posedge rfifo_wclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rd_trig <=      1'b0;
        else if(rfifo_wside_usedw <= RFIFO_WR_CNT && rfifo_wr_valid == 1'b1)      // rfifo_wside_usedw:0
                rd_trig <=      1'b1;
        else
                rd_trig <=      1'b0;
end */

always@(posedge wfifo_wclk or negedge s_rst_n)
begin
	if(!s_rst_n)	
		begin
		wr_trig <= 0;
		rd_trig <= 0;
		end
					//鍐欏叆浼樺厛锛屽甫瀹藉唴闃叉鏁版嵁涓㈠け
        else if(wfifo_rside_usedw >= WFIFO_RD_CNT)	// && wr_load_flag == 1'b0)	
                begin					//wrfifo婊＄獊鍙戦暱锟                
					 wr_trig <= 1;		//鍐檚darm浣胯兘
                rd_trig <= 0;		//璇籹dram绌洪棽
                end
        else if(rfifo_wside_usedw < RFIFO_WR_CNT && rfifo_wr_valid ) // && rd_load_flag == 1'b0)  && data_valid_r
                begin					//rdfifo婊＄獊鍙戦暱锟                
					 wr_trig <= 0;		//鍐檚dram绌洪棽
                rd_trig <= 1;		//璇籹dram浣胯兘
                end
        else
                begin
                wr_trig <= 0;		//鍐檚dram绌洪棽
                rd_trig <= 0;		//璇籹dram绌洪棽
                end
end

always  @(posedge rfifo_wclk) begin
        rd_trig_r1      <=      rd_trig;
        rfifo_wr_en_r1  <=      rfifo_wr_en;
end

always  @(posedge rfifo_wclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rfifo_wr_valid  <=      1'b0;
        else if(wr_trig == 1'b1)
                rfifo_wr_valid  <=      1'b1;
end

always  @(posedge rfifo_wclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rd_trig_flag    <=      1'b0;
        else if(rd_trig_pos == 1'b1)
                rd_trig_flag    <=      1'b1;
end 

always  @(posedge rfifo_wclk or negedge s_rst_n) begin
        if(s_rst_n == 1'b0)
                rfifo_rd_ready  <=      1'b0;
        else if(rd_trig_flag == 1'b1 && rfifo_wside_usedw >= RFIFO_WR_CNT)
                rfifo_rd_ready  <=      1'b1;
end

assign  rd_trig_pos     =       rd_trig & ~rd_trig_r1; 

dfifo_512x16    wdfifo_inst (
        .rst                    (~s_rst_n               ),      // input rst
        .wr_clk                 (wfifo_wclk             ),      // input wr_clk
        .rd_clk                 (wfifo_rclk             ),      // input rd_clk
        .din                    (wfifo_wr_data          ),      // input [15 : 0] din
        .wr_en                  (wfifo_wr_en            ),      // input wr_en
        .rd_en                  (wfifo_rd_en            ),      // input rd_en
        .dout                   (wfifo_rd_data          ),      // output [15 : 0] dout
        .full                   (                       ),      // output full
        .almost_full            (                       ),      // output almost_full
        .empty                  (                       ),      // output empty
        .almost_empty           (                       ),      // output almost_empty
        .rd_data_count          (wfifo_rside_usedw      ),      // output [8 : 0] rd_data_count
        .wr_data_count          (wfifo_wside_usedw      )       // output [8 : 0] wr_data_count
);

dfifo_512x16    rdfifo_inst (
        .rst                    (~s_rst_n               ),      // input rst
        .wr_clk                 (~rfifo_wclk            ),      // input wr_clk
        .rd_clk                 (rfifo_rclk             ),      // input rd_clk
        .din                    (rfifo_wr_data          ),      // input [15 : 0] din
        .wr_en                  (rfifo_wr_en_r1         ),      // input wr_en
        .rd_en                  (rfifo_rd_en            ),      // input rd_en
        .dout                   (rfifo_rd_data          ),      // output [15 : 0] dout
        .full                   (                       ),      // output full
        .almost_full            (                       ),      // output almost_full
        .empty                  (                       ),      // output empty
        .almost_empty           (                       ),      // output almost_empty
        .rd_data_count          (rfifo_rside_usedw      ),      // output [8 : 0] rd_data_count
        .wr_data_count          (rfifo_wside_usedw      )       // output [8 : 0] wr_data_count
);


endmodule
