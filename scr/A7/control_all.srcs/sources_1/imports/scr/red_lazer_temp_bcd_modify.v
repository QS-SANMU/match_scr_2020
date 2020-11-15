`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:09 10/14/2020 
// Design Name: 
// Module Name:    bcd_modify 
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
module red_lazer_temp_bcd_modify(
	input [19:0] data_in,
	output [19:0] data_out 
    );
	
	wire [3:0] bcd_reg1,bcd_reg2,bcd_reg3;
	
	red_lazer_temp_cmp red_lazer_temp_cmp_1(
	.cmp_in(data_in[19:16]),
	.cmp_out(bcd_reg1)
    );
	
	red_lazer_temp_cmp red_lazer_temp_cmp_2(
	.cmp_in(data_in[15:12]),
	.cmp_out(bcd_reg2)
    );
	
	red_lazer_temp_cmp red_lazer_temp_cmp_3(
	.cmp_in(data_in[11:8]),
	.cmp_out(bcd_reg3)
    );
	
	assign data_out = {bcd_reg1[2:0],bcd_reg2,bcd_reg3,data_in[7:0],1'b0};


endmodule
