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
module red_lazer_temp_data_process(
	input clk,
	input rst,
	input [7:0] data_in,
	input rx_done,
	output [7:0] data_o_out,
	output [7:0] data_a_out
    );
	
	reg [79:0] data;
	reg [79:0] data_out;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		begin
			data <= 79'd0;
			data_out <= 79'd0;
		end
	else if(rx_done)
		begin
			data<= {data[71:0],data_in};
			if(data[79:48] == 32'h5A5A4504)
				data_out <= data;
		end
	
	reg [7:0] data_o;
	reg [7:0] data_a;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		begin
			data_o <= 8'd0;
			data_a <= 8'd0;
		end
	else
		begin
			data_o <= data_out[47:32] / 7'd100;
			data_a <= data_out[31:16] / 7'd100;
		end
		
	assign data_o_out = data_o;
	assign data_a_out = data_a;

endmodule
