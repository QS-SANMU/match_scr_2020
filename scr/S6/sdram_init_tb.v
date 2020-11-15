`timescale 1ns / 1ps
`define CLOCK   10
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:02:20 05/07/2020
// Design Name:   sdram_top
// Module Name:   D:/isedaima/daima/ov5640/sdram_init_tb.v
// Project Name:  ov5640
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sdram_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sdram_init_tb;
reg                         clk             ;
reg                         rst_n           ;
wire                        sdram_clk       ;
wire                        sdram_cke       ;
wire                        sdram_cs_n      ;
wire                        sdram_cas_n     ;
wire                        sdram_ras_n     ;
wire                        sdram_we_n      ;
wire    [ 1:0]              sdram_bank      ;
wire    [12:0]              sdram_addr      ;
wire    [ 1:0]              sdram_dqm       ;
wire    [15:0]              sdram_dq        ;
reg wfifo_wr_en;
reg [15:0]wfifo_wr_data;
reg wfifo_wr_clk;
reg rfifo_rd_clk;
reg rfifo_rd_en;
wire [15:0]rfifo_rd_data;
wire rfifo_rd_ready;

initial begin
    clk         =       1'b0;
    rst_n       <=      1'b0;
    #(100*`CLOCK);
    rst_n       <=      1'b1;
	/*#(100000*`CLOCK);
	wr_trig     <= 1'b1;
	#10;
	wr_trig     <= 1'b0;
	/*#1022064;
	 rd_trig     <= 1'b1;
	#10;
	 rd_trig     <= 1'b0;*/
	/* #6000000;
	 wr_trig     <= 1'b1;
	#10;
	wr_trig     <= 1'b0;*/
	
end
always  #(`CLOCK/2)     clk        =       ~clk;  
//-------------------------------------------------------
always #10 wfifo_wr_clk = ~wfifo_wr_clk;

initial begin
   wfifo_wr_clk = 1;
   wfifo_wr_en <= 0;
   #210000;
   wfifo_wr_en <= 1;
   //#5120;
   //wfifo_wr_en <= 0;
	
end

always @(posedge wfifo_wr_clk or negedge rst_n)
    if(!rst_n)
	    wfifo_wr_data <= 0;
	else if(wfifo_wr_data >= 480000 - 1)
	   wfifo_wr_data <= 0;
	else if(wfifo_wr_en)
	    wfifo_wr_data <= wfifo_wr_data+ 1'b1;
//-------------------------------------------------------
//-------------------------------------------------------
always #13 		rfifo_rd_clk = ~rfifo_rd_clk;
initial begin
  rfifo_rd_clk = 0;
	
end
always @(posedge rfifo_rd_clk or negedge rst_n)
    if(!rst_n)
	    rfifo_rd_en <= 0;
    else if(rfifo_rd_ready)
	    rfifo_rd_en <= 1;
//-------------------------------------------------------*/
sdram_top sdram_top_inst(
    //System Interfaces
    .clk                    (clk                   ),
    .rst_n                  (rst_n                  ),
    //SDRAM Interfaces
    .sdram_clk              (sdram_clk              ),
    .sdram_cke              (sdram_cke              ),
    .sdram_cs_n             (sdram_cs_n             ),
    .sdram_cas_n            (sdram_cas_n            ),
    .sdram_ras_n            (sdram_ras_n            ),
    .sdram_we_n             (sdram_we_n             ),
    .sdram_bank             (sdram_bank             ),
    .sdram_addr             (sdram_addr             ),
    .sdram_dqm              (sdram_dqm              ),
    .sdram_dq               (sdram_dq               ),
	
	
	.wfifo_wr_en            (wfifo_wr_en            ),
    .wfifo_wr_data          (wfifo_wr_data          ),
    .wfifo_wr_clk           (wfifo_wr_clk           ),
	//rfifo
    .rfifo_rd_clk           (rfifo_rd_clk           ),
    .rfifo_rd_en            (rfifo_rd_en            ),
    .rfifo_rd_data          (rfifo_rd_data          ),
    .rfifo_rd_ready         (rfifo_rd_ready         )
);

defparam        sdram_model_plus_inst.addr_bits =       13;
defparam        sdram_model_plus_inst.data_bits =       16;
defparam        sdram_model_plus_inst.col_bits  =       9;
defparam        sdram_model_plus_inst.mem_sizes =       2*1024*1024;            // 2M

sdram_model_plus sdram_model_plus_inst(
    .Dq                     (sdram_dq               ), 
    .Addr                   (sdram_addr             ), 
    .Ba                     (sdram_bank             ), 
    .Clk                    (sdram_clk              ), 
    .Cke                    (sdram_cke              ), 
    .Cs_n                   (sdram_cs_n             ), 
    .Ras_n                  (sdram_ras_n            ), 
    .Cas_n                  (sdram_cas_n            ), 
    .We_n                   (sdram_we_n             ), 
    .Dqm                    (sdram_dqm              ),
    .Debug                  (1'b1                   )
);

endmodule
