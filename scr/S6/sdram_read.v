`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:49:52 05/16/2020 
// Design Name: 
// Module Name:    sdram_read 
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
module sdram_read(
    clk,
	rst_n,
	aref_req,
	rd_trig,
	rd_en,
	rd_req,
	rd_cmd,
	rd_addr,
	rd_bank,
	flag_rd_end,
	rd_flag_aref,
	
	rfifo_wr_en,
	flag_rd,
	flag_wr
    );
input clk;
input rst_n;
input aref_req;
input rd_trig;
input rd_en;
output reg rd_req;
output reg[3:0]rd_cmd;
output reg[12:0]rd_addr;
output reg[1:0]rd_bank;
output reg flag_rd_end;
output reg rd_flag_aref;
output reg rfifo_wr_en;
output reg flag_rd;
input flag_wr;

// Define State
localparam  IDLE      =   5'b0_0001       ;
localparam  REQ       =   5'b0_0010       ;
localparam  ACT       =   5'b0_0100       ;
localparam  RD        =   5'b0_1000       ;
localparam  PRE       =   5'b1_0000       ;
// SDRAM Command
localparam  CMD_NOP     =   4'b0111         ;
localparam  CMD_PRE     =   4'b0010         ;
localparam  CMD_AREF    =   4'b0001         ;
localparam  CMD_ACT     =   4'b0011         ;
localparam  CMD_RD      =   4'b0101         ;
// sdram 容量
localparam row_addr_max = 1440;
localparam col_addr_max = 0;     //0或256

reg [4:0] state;
reg [1:0] act_cnt;
reg [1:0] burst_cnt;
reg [1:0]burst_cnt_t;
reg [8:0] col_addr;
reg [12:0] row_addr;
reg flag_data_end;
reg flag_data_end_t;
reg flag_row_end;
reg flag_row_end_t;

reg rfifo_wr_en_r1;
reg rfifo_wr_en_r2;
reg rfifo_wr_en_r3;
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    flag_rd <= 0;
	else if(rd_en && !flag_rd)//注意这个flag_rd的定义，之前摄像头有问题的原因就是这个
	    flag_rd <= 1;
	else if(flag_data_end_t)
	    flag_rd <= 0;
	else 
	    flag_rd <= flag_rd;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    state <= IDLE;
	else 
	    case(state)
		IDLE:if(rd_trig && (!flag_wr))//注意这个状态机刚开始的跳转，摄像头有问题的原因就是这个
		         state <= REQ;
			 else 
			     state <= state;
		REQ:if(rd_en)
		        state <= ACT;
			else 
			    state <= state;
		ACT:if(act_cnt == 3)
		        state <= RD;
		    else 
			    state <= state;
		RD:if(flag_data_end)
		        state <= PRE;
		   else if(aref_req && burst_cnt == 3 )
		        state <= PRE;
		   else if(flag_row_end)
		        state <= PRE;
		   else 
		        state <= state;
		PRE:if(flag_data_end_t)
		        state <= IDLE;
			else if(flag_row_end_t)
			    state <= ACT;
			else if(burst_cnt_t == 3)
			    state <= REQ;
			else 
			    state <= state;
		default:state <= IDLE;
		endcase
//rd_req
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    rd_req <= 0;
	else if(state == REQ && rd_en == 0)
	    rd_req <= 1;
	else if(rd_en)
	    rd_req <= 0;
	else 
	    rd_req <= rd_req;
//act_cnt		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    act_cnt <= 0;
	else if(state == ACT)
	    if(act_cnt == 3)
	        act_cnt <= act_cnt;
		else 
		    act_cnt <= act_cnt + 1'b1;
	else 
	    act_cnt <= 0;
//burst_cnt
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        burst_cnt <= 0;
    else if(state == RD)
	    if(burst_cnt == 3)
	        burst_cnt <= 0;
		else 
		    burst_cnt <= burst_cnt + 1'b1;
	else 
	    burst_cnt <= 0;
		
//burst_cnt_t		
always @(posedge clk )
    burst_cnt_t <= burst_cnt;	
//flag_row_end
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    flag_row_end <= 0;
	else if(col_addr == 508 && burst_cnt == 2)
	    flag_row_end <= 1;
	else 
	    flag_row_end <= 0;
//flag_row_end_t		
always @(posedge clk )
    flag_row_end_t <= flag_row_end;       	
//flag_data_end
always @(posedge clk or negedge rst_n)
    if(!rst_n)
        flag_data_end <= 0;
    else if((col_addr == 252 && burst_cnt == 2) || (col_addr == 508 && burst_cnt == 2))	
        flag_data_end <= 1;
    else 
        flag_data_end <= 0;
//flag_data_end_t
always @(posedge clk )
        flag_data_end_t <= flag_data_end;
//flag_rd_end		
always @(posedge clk )
        flag_rd_end <= flag_data_end_t;
//row_addr	
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    row_addr <= 0;
	else if(row_addr == row_addr_max && col_addr == col_addr_max)//所需容量 
		row_addr <= 0;
	else if(col_addr == 508 && burst_cnt == 1)
	    row_addr <= row_addr + 1'b1;
	else 
	    row_addr <= row_addr;
 //col_addr
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    col_addr <= 0;
	else if(state == RD) 
	    if(col_addr == 511)
		    col_addr <= 0;
		else if(burst_cnt == 3)
		    col_addr <= col_addr + 3'd4;
		else 
		    col_addr <= col_addr;
	else if(flag_data_end_t && row_addr == row_addr_max)//所需容量 
	    col_addr <= 0;
    else 
	    col_addr <= col_addr;
		
		
		
//rd_bank


always @(posedge clk or negedge rst_n)
    if(!rst_n)
        rd_bank <= 0;
    else if(flag_data_end_t && row_addr == row_addr_max)
        rd_bank <= ~rd_bank;	


//rd_cmd	
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    rd_cmd <= CMD_NOP;
	else 
	    case(state)
		ACT:if(act_cnt == 1) rd_cmd <= CMD_ACT;else rd_cmd <= CMD_NOP;
		RD :if(burst_cnt == 0)rd_cmd <= CMD_RD;else rd_cmd <= CMD_NOP;
		PRE:rd_cmd <= CMD_PRE;
        default:rd_cmd <= CMD_NOP;    	
	    endcase	
//rd_addr		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    rd_addr <= 13'b0;
	else 
	    case(state)
		ACT:if(act_cnt == 1) rd_addr <= row_addr;
		RD :if(burst_cnt == 0)rd_addr <= {5'b00000,col_addr};
		PRE:rd_addr <= 13'b0_0100_0000_0000;
        default:rd_addr <= CMD_NOP;    	
	    endcase

//rd_flag_aref		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
    	rd_flag_aref <= 0;
	else if(aref_req && state == PRE)
	    rd_flag_aref <= 1;
	else 
	    rd_flag_aref <= 0;
//rfifo_wr_en		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    rfifo_wr_en_r1 <= 0;
    else if(state ==RD)
        rfifo_wr_en_r1 <= 1;
    else 
        rfifo_wr_en_r1 <= 0;

always @(posedge clk )begin
    rfifo_wr_en_r2 <= rfifo_wr_en_r1;
    rfifo_wr_en_r3 <= rfifo_wr_en_r2;
end

always @(posedge clk )  
    rfifo_wr_en <= rfifo_wr_en_r3;
  		
endmodule

