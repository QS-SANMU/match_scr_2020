`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:21 10/14/2020 
// Design Name: 
// Module Name:    cmp 
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
module red_lazer_temp_cmp(
	input [3:0] cmp_in,
	output reg [3:0] cmp_out
    );
	
	always@(*)
	begin
		if(cmp_in > 4)
			cmp_out = cmp_in + 3;
		else
			cmp_out = cmp_in;
	
	end
	


endmodule
