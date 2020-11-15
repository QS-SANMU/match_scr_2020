`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:02 10/14/2020 
// Design Name: 
// Module Name:    BIN_BCD 
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
module red_lazer_temp_BIN_BCD(
	input [7:0] bin,
	output [11:0] bcd
    );

	wire [19:0] bcd_reg_0,bcd_reg_1,bcd_reg_2,bcd_reg_3,bcd_reg_4,bcd_reg_5,bcd_reg_6,bcd_reg_7,bcd_reg_8;
	
	assign bcd_reg_0 = {12'b000000000000,bin};
	
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_1(
	.data_in(bcd_reg_0),
	.data_out(bcd_reg_1) 
    );
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_2(
	.data_in(bcd_reg_1),
	.data_out(bcd_reg_2) 
    );
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_3(
	.data_in(bcd_reg_2),
	.data_out(bcd_reg_3) 
    );
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_4(
	.data_in(bcd_reg_3),
	.data_out(bcd_reg_4) 
    );
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_5(
	.data_in(bcd_reg_4),
	.data_out(bcd_reg_5) 
    );
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_6(
	.data_in(bcd_reg_5),
	.data_out(bcd_reg_6) 
    );
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_7(
	.data_in(bcd_reg_6),
	.data_out(bcd_reg_7) 
    );
	
	red_lazer_temp_bcd_modify red_lazer_temp_bcd_modify_8(
	.data_in(bcd_reg_7),
	.data_out(bcd_reg_8) 
    );
	
	assign bcd = {bcd_reg_8[19:8]};
	


endmodule
