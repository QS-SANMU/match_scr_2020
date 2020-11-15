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
module light_data_process(
	input clk,
	input rst,
	input [7:0] data_in,
	input rx_done,
	output [23:0] data_l_o
    );
	
	reg [71:0] data;
	reg [71:0] data_out;
	reg [9:0] data_l;
	reg [7:0] data_b;//百
	reg [7:0] data_s;//十
	reg [7:0] data_g;//个
	
	always@(posedge clk or negedge rst)
	if(!rst)
		begin
			data <= 72'd0;
			data_out <= 72'd0;
		end
	else if(rx_done)
		begin
			data<= {data[63:0],data_in};
			if(data[71:40] == 32'h5A5A1504)
				data_out <= data;
		end
	
	
	always@(posedge clk or negedge rst)
	if(!rst)
		data_l <= 10'd0;
	else
		data_l <= data_out[23:8]/7'd100;
		
	
	
	always@(posedge clk or negedge rst)
	if(!rst)
		begin
			data_b <= 8'd0;
			data_s <= 8'd0;
			data_g <= 8'd0;
		end
	else
		begin
			data_b <= data_l / 7'd100;
			data_s <= (data_l / 4'd10) % 4'd10;
			data_g <= data_l % 4'd10;
		end
	
	assign data_l_o = {data_b,data_s,data_g};
	

	

endmodule
