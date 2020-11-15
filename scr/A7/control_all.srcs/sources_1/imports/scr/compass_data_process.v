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
module compass_data_process(
	input clk,
	input rst,
	input [7:0] data_in,
	input rx_done,
	output [39:0] data_zhinan
    );
	
	reg [63:0] data;
	reg [63:0] data_out;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		begin
			data <= 64'd0;
			data_out <= 64'd0;
		end
	else if(rx_done)
		begin
			data<= {data[55:0],data_in};
			if(data[63:48] == 16'h0D0A)
				data_out <= data;
		end
	
	assign data_zhinan = data_out[47:8];

endmodule
