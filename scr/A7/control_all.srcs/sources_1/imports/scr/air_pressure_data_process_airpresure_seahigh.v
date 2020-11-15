`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:52 10/25/2020 
// Design Name: 
// Module Name:    data_process_airpresure_seahigh 
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
module air_pressure_data_process_airpresure_seahigh(
	input clk,
	input rst,
	input rx_done,
	input [7:0] data_in,
	output [55:0] data_p,      //airpressure 
	output [39:0] data_h       //high
    );
	
	reg [279:0] data_value;
	reg [279:0] data_out;


	always@(posedge clk or negedge rst)
	if(!rst)
		data_value <= 280'd0;
	else
		begin
			if(rx_done)
				data_value <= {data_value[271:0],data_in};
			if(data_value[279:216] == 64'h5072657373757265)
				data_out <= data_value;
		end
		
	assign data_p = data_out[191:136];
	assign data_h = data_out[39:0];

endmodule
