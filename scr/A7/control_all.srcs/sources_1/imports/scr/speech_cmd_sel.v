`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:06 10/23/2020 
// Design Name: 
// Module Name:    cmd_sel 
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
module speech_cmd_sel(
	input clk,
	input rst,
	input cmd_1,
	input cmd_2,
	input cmd_3,
	input cmd_4,
	input cmd_5,
	input cmd_6,
	input cmd_7,
	input cmd_8,
	input cmd_9,
	input cmd_10,
	input cmd_11,
	output reg data_out
    );
	reg [31:0]cnt;
	reg start;

reg cmd_1_t;
reg cmd_2_t;
reg cmd_3_t;
reg cmd_4_t;
reg cmd_5_t;
reg cmd_6_t;
reg cmd_7_t;
reg cmd_8_t;
reg cmd_9_t;
reg cmd_10_t;
reg cmd_11_t;

	localparam NUM = 32'd100_000_000;
	reg [10:0] flag;
	
	always @(posedge clk or negedge rst)begin
		if(!rst)begin
			start <= 1'b0;
		end
		else if(cnt >= NUM)begin
			start <= 1'b0;
		end
		else if(cmd_1 || cmd_2 || cmd_3 || cmd_4 || cmd_5 || cmd_6 || cmd_7 || cmd_8 || cmd_9 || cmd_10)begin
			start = 1'b1;
		end
	end
	always @(posedge clk or negedge rst) begin
		if(!rst)begin
			cnt <= 32'd0;
		end
		else if(cnt >= NUM)begin
			cnt <= 32'd0;
		end
		else if(start)begin
			cnt <= cnt + 1'b1;
		end
	end

	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			flag <= 11'd0;
		end
		else if((start == 1'b0) && (cmd_1 || cmd_2 || cmd_3 || cmd_4 || cmd_5 || cmd_6 || cmd_7 || cmd_8 || cmd_9 || cmd_10))begin
			if(cmd_1)
				flag <= 11'b100_0000_0000;
			else if(cmd_2)
				flag <= 11'b010_0000_0000;
			else if(cmd_3)
				flag <= 11'b001_0000_0000;
			else if(cmd_4)
				flag <= 11'b000_1000_0000;
			else if(cmd_5)
				flag <= 11'b000_0100_0000;
			else if(cmd_6)
				flag <= 11'b000_0010_0000;
			else if(cmd_7)
				flag <= 11'b000_0001_0000;
			else if(cmd_8)
				flag <= 11'b000_0000_1000;
			else if(cmd_9)
				flag <= 11'b000_0000_0100;
			else if(cmd_10)
				flag <= 11'b000_0000_0010;
			else if(cmd_11)
				flag <= 11'b000_0000_0001;
			else 
				flag <= flag;
		end
	end
					
	always@(posedge clk or negedge rst)
	if(!rst)	
		data_out <= 1'b1;
	else	
		case(flag)
			11'b100_0000_0000 : data_out <= cmd_1_o;
			11'b010_0000_0000 : data_out <= cmd_2_o;
			11'b001_0000_0000 : data_out <= cmd_3_o;
			11'b000_1000_0000 : data_out <= cmd_4_o;
			11'b000_0100_0000 : data_out <= cmd_5_o;
			11'b000_0010_0000 : data_out <= cmd_6_o;
			11'b000_0001_0000 : data_out <= cmd_7_o;
			11'b000_0000_1000 : data_out <= cmd_8_o;
			11'b000_0000_0100 : data_out <= cmd_9_o;
			11'b000_0000_0010 : data_out <= cmd_10_o;
			11'b000_0000_0001 : data_out <= cmd_11_o;
			default :           data_out <= 1'b1;
		endcase

	always @(posedge clk or negedge rst) begin
		if(!rst)begin
			cmd_1_t <= 'd0;
			cmd_2_t <= 'd0;
			cmd_3_t <= 'd0;
			cmd_4_t <= 'd0;
			cmd_5_t <= 'd0;
			cmd_6_t <= 'd0;
			cmd_7_t <= 'd0;
			cmd_8_t <= 'd0;
			cmd_9_t <= 'd0;
			cmd_10_t<= 'd0;
			cmd_11_t<= 'd0;
		end
		else if((cmd_1 || cmd_2 || cmd_3 || cmd_4 || cmd_5 || cmd_6 || cmd_7 || cmd_8 || cmd_9 || cmd_10) && (start == 1'b0))begin
			cmd_1_t <= 'd1;
			cmd_2_t <= 'd1;
			cmd_3_t <= 'd1;
			cmd_4_t <= 'd1;
			cmd_5_t <= 'd1;
			cmd_6_t <= 'd1;
			cmd_7_t <= 'd1;
			cmd_8_t <= 'd1;
			cmd_9_t <= 'd1;
			cmd_10_t<= 'd1;
			cmd_11_t<= 'd1;
		end
		else begin
			cmd_1_t <= 'd0;
			cmd_2_t <= 'd0;
			cmd_3_t <= 'd0;
			cmd_4_t <= 'd0;
			cmd_5_t <= 'd0;
			cmd_6_t <= 'd0;
			cmd_7_t <= 'd0;
			cmd_8_t <= 'd0;
			cmd_9_t <= 'd0;
			cmd_10_t<= 'd0;
			cmd_11_t<= 'd0;
		end
	end



	speech_uart_tx_continuously_cmd_1 speech_uart_tx_continuously_cmd_1(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_1),
	.tx_data(cmd_1_o)
    );
	
	speech_uart_tx_continuously_cmd_2 speech_uart_tx_continuously_cmd_2(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_2),
	.tx_data(cmd_2_o)
    );
	
	speech_uart_tx_continuously_cmd_3 speech_uart_tx_continuously_cmd_3(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_3),
	.tx_data(cmd_3_o)
    );
	
	
	speech_uart_tx_continuously_cmd_4 speech_uart_tx_continuously_cmd_4(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_4),
	.tx_data(cmd_4_o)
    );
	
	speech_uart_tx_continuously_cmd_5 speech_uart_tx_continuously_cmd_5(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_5),
	.tx_data(cmd_5_o)
    );
	
	speech_uart_tx_continuously_cmd_6 speech_uart_tx_continuously_cmd_6(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_6),
	.tx_data(cmd_6_o)
    );
	
	speech_uart_tx_continuously_cmd_7 speech_uart_tx_continuously_cmd_7(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_7),
	.tx_data(cmd_7_o)
    );
	
	speech_uart_tx_continuously_cmd_8 speech_uart_tx_continuously_cmd_8(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_8),
	.tx_data(cmd_8_o)
    );
	
	speech_uart_tx_continuously_cmd_9 speech_uart_tx_continuously_cmd_9(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_9),
	.tx_data(cmd_9_o)
    );
	
	
	speech_uart_tx_continuously_cmd_10 speech_uart_tx_continuously_cmd_10(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_10),
	.tx_data(cmd_10_o)
    );
	
	speech_uart_tx_continuously_cmd_11 speech_uart_tx_continuously_cmd_11(
	.clk(clk),
	.rst(rst),
	.tx_start(cmd_11),
	.tx_data(cmd_11_o)
    );

endmodule
