`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:01 05/12/2020 
// Design Name: 
// Module Name:    sdram_write 
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
module sdram_write(
    clk,
	rst_n,
	aref_req,
	wr_trig,
	wr_en,
	wr_req,
	wr_cmd,
	wr_addr,
	wr_bank,
	wr_data,
	flag_wr_end,
	burst_cnt_t	,
	wr_flag_aref,
    wfifo_rd_en,
	wfifo_rd_data,
	flag_wr,
	flag_rd
    );
input clk;
input rst_n;
input aref_req;
input wr_trig;
input wr_en;
output reg wr_req;
output reg[3:0]wr_cmd;
output reg[12:0]wr_addr;
output reg[1:0]wr_bank;
output [15:0]wr_data;
output reg flag_wr_end;
output reg[1:0]burst_cnt_t;
output reg wr_flag_aref;
output wfifo_rd_en;
input [15:0]wfifo_rd_data;
input flag_rd;
output reg flag_wr;
// Define State
localparam  IDLE      =   5'b0_0001       ;
localparam  REQ       =   5'b0_0010       ;
localparam  ACT       =   5'b0_0100       ;
localparam  WR        =   5'b0_1000       ;
localparam  PRE       =   5'b1_0000       ;
// SDRAM Command
localparam  CMD_NOP     =   4'b0111         ;
localparam  CMD_PRE     =   4'b0010         ;
localparam  CMD_AREF    =   4'b0001         ;
localparam  CMD_ACT     =   4'b0011         ;
localparam  CMD_WR      =   4'b0100         ;
// sdram 容量
localparam row_addr_max = 1440;
localparam col_addr_max = 0;     //0或256

reg [4:0] state;
reg [1:0] act_cnt;
reg [1:0] burst_cnt;
reg [8:0] col_addr;
reg [12:0] row_addr;
reg flag_data_end;
reg flag_data_end_t;
reg flag_row_end;
reg flag_row_end_t;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    flag_wr <= 0;
	else if(wr_en && !flag_wr)        //注意这个flag_wr的定义，之前摄像头有问题的原因就是这个
	    flag_wr <= 1;
	else if(flag_data_end_t)
	    flag_wr <= 0;
	else 
	    flag_wr <= flag_wr;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    state <= IDLE;
	else 
	    case(state)
		IDLE:if(wr_trig && (!flag_rd))//注意这个状态机刚开始的跳转，摄像头有问题的原因就是这个
		         state <= REQ;
			 else 
			     state <= state;
		REQ:if(wr_en)
		        state <= ACT;
			else 
			    state <= state;
		ACT:if(act_cnt == 3)
		        state <= WR;
		    else 
			    state <= state;
		WR:if(flag_data_end)
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
//wr_req
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    wr_req <= 0;
	else if(state == REQ && wr_en == 0)
	    wr_req <= 1;
	else if(wr_en)
	    wr_req <= 0;
	else 
	    wr_req <= wr_req;
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
    else if(state == WR)
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
//flag_wr_end		
always @(posedge clk )
        flag_wr_end <= flag_data_end_t;
//row_addr	
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    row_addr <= 0;
	else if(row_addr == row_addr_max && col_addr == col_addr_max) //所需容量 
		row_addr <= 0;
	else if(col_addr == 508 && burst_cnt == 1)
	    row_addr <= row_addr + 1'b1;
	else 
	    row_addr <= row_addr;
 //col_addr
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    col_addr <= 0;
	else if(state == WR ) 
	    if(col_addr == 511)
		    col_addr <= 0;
		else if(burst_cnt == 3)
		    col_addr <= col_addr + 3'd4;
		else 
		    col_addr <= col_addr;
	else if(flag_data_end_t && row_addr == row_addr_max)  //所需容量
	    col_addr <= 0;
    else 
	    col_addr <= col_addr;
	

	
//wr_bank

always @(posedge clk or negedge rst_n)
    if(!rst_n)
        wr_bank <= 2'b11;
    else if(flag_data_end_t && row_addr == row_addr_max)
        wr_bank <= ~wr_bank;	

		
//wr_cmd	
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    wr_cmd <= CMD_NOP;
	else 
	    case(state)
		ACT:if(act_cnt == 1) wr_cmd <= CMD_ACT;else wr_cmd <= CMD_NOP;
		WR :if(burst_cnt == 0)wr_cmd <= CMD_WR;else wr_cmd <= CMD_NOP;
		PRE:wr_cmd <= CMD_PRE;
        default:wr_cmd <= CMD_NOP;    	
	    endcase	
//wr_addr		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    wr_addr <= 13'b0;
	else 
	    case(state)
		ACT:if(act_cnt == 1) wr_addr <= row_addr;
		WR :if(burst_cnt == 0)wr_addr <= {5'b00000,col_addr};
		PRE:wr_addr <= 13'b0_0100_0000_0000;
        default:wr_addr <= CMD_NOP;    	
	    endcase
//wr_data		
/*always @(posedge clk or negedge rst_n)
    if(!rst_n)
        wr_data <= 0;
    else 
        case(burst_cnt)
        0:wr_data <= 'd3;
        1:wr_data <= 'd5;
        2:wr_data <= 'd7;
        3:wr_data <= 'd9;	
		default:wr_data <= 0;
		endcase*/
/*always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    wr_data <= 0;
	else 
	    wr_data <= wfifo_rd_data;*/
assign wr_data = wfifo_rd_data;		
//wr_flag_aref		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
    	wr_flag_aref <= 0;
	else if(aref_req && state == PRE)
	    wr_flag_aref <= 1;
	else 
	    wr_flag_aref <= 0;
//wfifo_rd_en
assign wfifo_rd_en = (state == WR)?1'b1:1'b0;
/*always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    wfifo_rd_en <= 0;
	else if(state == WR)
	    wfifo_rd_en <= 1;
	else 
	    wfifo_rd_en <= 0;*/
endmodule
