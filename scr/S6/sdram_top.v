`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:17 05/07/2020 
// Design Name: 
// Module Name:    sdram_top 
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
module sdram_top(
    clk,
	rst_n,
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
//wfifo
wfifo_wr_en,
wfifo_wr_data,
wfifo_wr_clk,
//rfifo
rfifo_rd_clk,
rfifo_rd_en,
rfifo_rd_data,
rfifo_rd_ready,
init_done
    );
input clk;
input rst_n;
output  sdram_clk;
output	sdram_cke;
output	sdram_cs_n;
output	sdram_cas_n;
output	sdram_ras_n;
output	sdram_we_n;
output	[1:0]sdram_bank;
output	reg[12:0] sdram_addr;
output	[1:0]sdram_dqm;
inout	[15:0]sdram_dq ;

//input wr_trig;
//sdram_auto_write_read
input wfifo_wr_clk;
input wfifo_wr_en;
input [15:0]wfifo_wr_data;
input rfifo_rd_clk;
input rfifo_rd_en;
output [15:0]rfifo_rd_data;
output rfifo_rd_ready;
output init_done;
reg [4:0]state;
reg [3:0]sdram_cmd;
//init 
wire [3:0]init_cmd;
wire [12:0]init_addr;
wire flag_init_end;
//aref
wire aref_en;
wire [3:0]aref_cmd;
wire [12:0]aref_addr;
wire aref_req;
wire flag_aref_end;
//write
wire wr_en;
wire wr_req;
wire [3:0]wr_cmd;
wire [12:0]wr_addr;
wire [1:0]wr_bank;
wire [15:0]wr_data;
wire flag_wr_end;
wire wr_flag_aref;

//read

wire rd_en;
wire rd_req;
wire [3:0]rd_cmd;
wire [12:0]rd_addr;
wire [1:0]rd_bank;
wire flag_rd_end;
wire rd_flag_aref;

//auto_write_read
wire wfifo_rd_en;
wire [15:0]wfifo_rd_data;
wire wr_trig;
//rfifo
wire rfifo_wr_en;
wire [15:0]rfifo_wr_data;
wire rd_trig;
wire rfifo_rd_ready;
    
localparam      NOP     =   4'b0111         ;

localparam      IDLE    =   5'b0_0001       ;
localparam      ARBIT   =   5'b0_0010       ;
localparam      AREF    =   5'b0_0100       ;
localparam      WRITE   =   5'b0_1000       ;
localparam      READ    =   5'b1_0000       ;

	   
assign sdram_clk = ~clk;
assign sdram_cke = 1'b1;
assign {sdram_cs_n,sdram_ras_n,sdram_cas_n,sdram_we_n} = sdram_cmd;
assign sdram_bank = (state == WRITE)?wr_bank:rd_bank;
assign sdram_dqm = 2'b0;
assign sdram_dq = (state == WRITE)?wr_data:16'bz;
assign rfifo_wr_data = sdram_dq;
assign init_done = flag_init_end;
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    state <= IDLE;
    else 
        case(state)
        IDLE:if(flag_init_end)
                 state <= ARBIT;
             else 
                 state <= IDLE;
        ARBIT:if(aref_req)
                 state <= AREF;
			  else if(wr_req)
			     state <= WRITE;
			  else if(rd_req)
			     state <= READ;
              else 
                 state <= ARBIT;
        AREF:if(flag_aref_end)
                 state <= ARBIT;
             else 
                 state <= AREF;
		WRITE:if(flag_wr_end)
		         state <= ARBIT;
		      else if(wr_flag_aref)
			     state <= 	AREF;
			  else 
			     state <= WRITE;
		READ: if(flag_rd_end)
		         state <= ARBIT;
			  else if(rd_flag_aref)
			     state <= AREF;
			  else
			     state <= READ;
		default:state <= IDLE;
		endcase		 
	     
always @(*)
    case(state)	
	IDLE:begin
	         sdram_cmd <= init_cmd;
			 sdram_addr <= init_addr;
	     end
	AREF:begin
	         sdram_cmd <= aref_cmd;
			 sdram_addr <= aref_addr;
	     end
	WRITE:begin
	         sdram_cmd <= wr_cmd;
			 sdram_addr <= wr_addr;
	     end
    READ:begin
	         sdram_cmd <= rd_cmd;
			 sdram_addr <= rd_addr;
	     end
	default:begin
	         sdram_cmd <= NOP;
			 sdram_addr <= init_addr;
	        end
	endcase

assign aref_en = (state == AREF)?1'b1:1'b0;			
assign wr_en   = (state == WRITE && wr_req)?1'b1:1'b0;	
assign rd_en   = (state == READ && rd_req)?1'b1:1'b0;	
sdram_init  sdram_init_inst(
    .sclk(clk),
	.s_rst_n(rst_n),
	.cmd_reg(init_cmd),
	.sdram_addr(init_addr),
	.flag_init_end(flag_init_end)
    );
	
sdram_aref  sdram_aref_inst(
    .sclk(clk),
	.s_rst_n(rst_n),
	.ref_en(aref_en),
	.flag_init_end(flag_init_end),
	.aref_cmd(aref_cmd),
	.sdram_addr(aref_addr),
	.ref_req(aref_req),
	.flag_ref_end(flag_aref_end)
    );

sdram_write sdram_write_inst(
    .clk(clk),
	.rst_n(rst_n),
	.aref_req(aref_req),
	.wr_trig(wr_trig),
	.wr_en(wr_en),
	.wr_req(wr_req),
	.wr_cmd(wr_cmd),
	.wr_addr(wr_addr),
	.wr_bank(wr_bank),
	.wr_data(wr_data),
	.flag_wr_end(flag_wr_end),
	.burst_cnt_t(),
    .wr_flag_aref(wr_flag_aref),
	.wfifo_rd_en(wfifo_rd_en),
	.wfifo_rd_data(wfifo_rd_data),
	.flag_rd(flag_rd),
	.flag_wr(flag_wr)
    );
sdram_read  sdram_read_inst(
    .clk(clk),
	.rst_n(rst_n),
	.aref_req(aref_req),
	.rd_trig(rd_trig),
	.rd_en(rd_en),
	.rd_req(rd_req),
	.rd_cmd(rd_cmd),
	.rd_addr(rd_addr),
	.rd_bank(rd_bank),
	.flag_rd_end(flag_rd_end),
	.rd_flag_aref(rd_flag_aref),
	.rfifo_wr_en(rfifo_wr_en),
	.flag_rd(flag_rd),
	.flag_wr(flag_wr)
    );
	
auto_write_read  sdram_auto_write_read_inst(
    .s_rst_n(rst_n),
    .wfifo_wclk(wfifo_wr_clk),
	.wfifo_wr_en(wfifo_wr_en),
	.wfifo_wr_data(wfifo_wr_data),
	.wfifo_rclk(clk),
	.wfifo_rd_en(wfifo_rd_en),
	.wfifo_rd_data(wfifo_rd_data),
	.wr_trig(wr_trig),
	//rfifo
	.rfifo_wclk(~clk),
	.rfifo_wr_en(rfifo_wr_en),
	.rfifo_wr_data(rfifo_wr_data),
	.rfifo_rclk(rfifo_rd_clk),
    .rfifo_rd_en(rfifo_rd_en),
    .rfifo_rd_data(rfifo_rd_data),
    .rd_trig(rd_trig),
	.rfifo_rd_ready(rfifo_rd_ready)
    );
	
	
endmodule
