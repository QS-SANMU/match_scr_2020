`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:12 10/09/2020 
// Design Name: 
// Module Name:    data_process 
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
module temp_hum_data_process(
	input clk,
	input rst,
	input [7:0] data_in,
	input rx_done,
	output [39:0] data_t,
	output [39:0] data_h
    );
	
	reg [175:0] data;
	reg [159:0] data_out;
	reg [7:0] data_t_1;
	reg [7:0] data_t_2;
	reg [7:0] data_t_3;
	reg [7:0] data_t_4;
	reg [7:0] data_t_5;
	
	reg [7:0] data_h_1;
	reg [7:0] data_h_2;
	reg [7:0] data_h_3;
	reg [7:0] data_h_4;
	reg [7:0] data_h_5;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		begin
			data <= 176'd0;
			data_out <= 160'd0;
		end
	else if(rx_done)
		begin
			data<= {data[167:0],data_in};
			if(data[175:144] == 32'h54656D70)
				data_out <= data;
		end
		
	always@(posedge clk or negedge rst)
	if(!rst)
		data_t_1 <= 8'h30;
	else 
		case(data_out[135:128])
			8'h30   : data_t_1 <= data_out[135:128];
			8'h31   : data_t_1 <= data_out[135:128];
			8'h32   : data_t_1 <= data_out[135:128];
			8'h33   : data_t_1 <= data_out[135:128];
			8'h34   : data_t_1 <= data_out[135:128];
			8'h35   : data_t_1 <= data_out[135:128];
			8'h36   : data_t_1 <= data_out[135:128];
			8'h37   : data_t_1 <= data_out[135:128];
			8'h38   : data_t_1 <= data_out[135:128];
			8'h39   : data_t_1 <= data_out[135:128];
			default :data_t_1 <= data_t_1;
		endcase
		
	always@(posedge clk or negedge rst)
	if(!rst)
		data_t_2 <= 8'h30;
	else 
		case(data_out[127:120])
			8'h30   : data_t_2 <= data_out[127:120];
			8'h31   : data_t_2 <= data_out[127:120];
			8'h32   : data_t_2 <= data_out[127:120];
			8'h33   : data_t_2 <= data_out[127:120];
			8'h34   : data_t_2 <= data_out[127:120];
			8'h35   : data_t_2 <= data_out[127:120];
			8'h36   : data_t_2 <= data_out[127:120];
			8'h37   : data_t_2 <= data_out[127:120];
			8'h38   : data_t_2 <= data_out[127:120];
			8'h39   : data_t_2 <= data_out[127:120];
			default :data_t_2 <= data_t_2;
		endcase
	
	always@(posedge clk or negedge rst)
	if(!rst)
		data_t_3 <= 8'h30;
	else 
		data_t_3 <= 8'h2E;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		data_t_4 <= 8'h30;
	else 
		case(data_out[111:104])
			8'h30   : data_t_4 <= data_out[111:104];
			8'h31   : data_t_4 <= data_out[111:104];
			8'h32   : data_t_4 <= data_out[111:104];
			8'h33   : data_t_4 <= data_out[111:104];
			8'h34   : data_t_4 <= data_out[111:104];
			8'h35   : data_t_4 <= data_out[111:104];
			8'h36   : data_t_4 <= data_out[111:104];
			8'h37   : data_t_4 <= data_out[111:104];
			8'h38   : data_t_4 <= data_out[111:104];
			8'h39   : data_t_4 <= data_out[111:104];
			default :data_t_4 <= data_t_4;
		endcase
		
	always@(posedge clk or negedge rst)
	if(!rst)
		data_t_5 <= 8'h30;
	else 
		case(data_out[103:96])
			8'h30   : data_t_5 <= data_out[103:96];
			8'h31   : data_t_5 <= data_out[103:96];
			8'h32   : data_t_5 <= data_out[103:96];
			8'h33   : data_t_5 <= data_out[103:96];
			8'h34   : data_t_5 <= data_out[103:96];
			8'h35   : data_t_5 <= data_out[103:96];
			8'h36   : data_t_5 <= data_out[103:96];
			8'h37   : data_t_5 <= data_out[103:96];
			8'h38   : data_t_5 <= data_out[103:96];
			8'h39   : data_t_5 <= data_out[103:96];
			default :data_t_5 <= data_t_5;
		endcase
		
		
		
		
		
		
	always@(posedge clk or negedge rst)
	if(!rst)
		data_h_1 <= 8'h30;
	else 
		case(data_out[55:48])
			8'h30   : data_h_1 <= data_out[55:48];
			8'h31   : data_h_1 <= data_out[55:48];
			8'h32   : data_h_1 <= data_out[55:48];
			8'h33   : data_h_1 <= data_out[55:48];
			8'h34   : data_h_1 <= data_out[55:48];
			8'h35   : data_h_1 <= data_out[55:48];
			8'h36   : data_h_1 <= data_out[55:48];
			8'h37   : data_h_1 <= data_out[55:48];
			8'h38   : data_h_1 <= data_out[55:48];
			8'h39   : data_h_1 <= data_out[55:48];
			default :data_h_1 <= data_h_1;
		endcase
		
	always@(posedge clk or negedge rst)
	if(!rst)
		data_h_2 <= 8'h30;
	else 
		case(data_out[47:40])
			8'h30   : data_h_2 <= data_out[47:40];
			8'h31   : data_h_2 <= data_out[47:40];
			8'h32   : data_h_2 <= data_out[47:40];
			8'h33   : data_h_2 <= data_out[47:40];
			8'h34   : data_h_2 <= data_out[47:40];
			8'h35   : data_h_2 <= data_out[47:40];
			8'h36   : data_h_2 <= data_out[47:40];
			8'h37   : data_h_2 <= data_out[47:40];
			8'h38   : data_h_2 <= data_out[47:40];
			8'h39   : data_h_2 <= data_out[47:40];
			default :data_h_2 <= data_h_2;
		endcase
	
	always@(posedge clk or negedge rst)
	if(!rst)
		data_h_3 <= 8'h30;
	else 
		data_h_3 <= 8'h2E;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		data_h_4 <= 8'h30;
	else 
		case(data_out[31:24])
			8'h30   : data_h_4 <= data_out[31:24];
			8'h31   : data_h_4 <= data_out[31:24];
			8'h32   : data_h_4 <= data_out[31:24];
			8'h33   : data_h_4 <= data_out[31:24];
			8'h34   : data_h_4 <= data_out[31:24];
			8'h35   : data_h_4 <= data_out[31:24];
			8'h36   : data_h_4 <= data_out[31:24];
			8'h37   : data_h_4 <= data_out[31:24];
			8'h38   : data_h_4 <= data_out[31:24];
			8'h39   : data_h_4 <= data_out[31:24];
			default :data_h_4 <= data_h_4;
		endcase
		
	always@(posedge clk or negedge rst)
	if(!rst)
		data_h_5 <= 8'h30;
	else 
		case(data_out[23:16])
			8'h30   : data_h_5 <= data_out[23:16];
			8'h31   : data_h_5 <= data_out[23:16];
			8'h32   : data_h_5 <= data_out[23:16];
			8'h33   : data_h_5 <= data_out[23:16];
			8'h34   : data_h_5 <= data_out[23:16];
			8'h35   : data_h_5 <= data_out[23:16];
			8'h36   : data_h_5 <= data_out[23:16];
			8'h37   : data_h_5 <= data_out[23:16];
			8'h38   : data_h_5 <= data_out[23:16];
			8'h39   : data_h_5 <= data_out[23:16];
			default :data_h_5 <= data_h_5;
		endcase
	
	assign data_t = {data_t_1,data_t_2,data_t_3,data_t_4,data_t_5};
	assign data_h = {data_h_1,data_h_2,data_h_3,data_h_4,data_h_5};
	
endmodule
