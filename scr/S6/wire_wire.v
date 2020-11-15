`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:33:39 11/09/2020 
// Design Name: 
// Module Name:    wire_wire 
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
module wire_wire(
    input clk,
	input rst_n,
	
	input key_in,

    input [15:0] vga_in_f,
	input        hs_in_f,
	input        vs_in_f,
	
	input [15:0] vga_in_z,
	input         hs_in_z,
	input         vs_in_z,
	
	output  hs_out,
	output  vs_out,
    output  [15:0] vga_out
    );
	
	reg key_out_0;	
	always@(posedge clk or negedge rst_n) begin
	    if(!rst_n) key_out_0 <= 0;
		else key_out_0 <= key_out;
	end
	
	wire nege_key_out;
	assign nege_key_out = key_out_0 && ~key_out;
	
	reg flag;
	always@(posedge clk or negedge rst_n) begin
	    if(!rst_n) flag <= 0;
		else if(nege_key_out) flag <= ~flag;
        else flag <= flag;
	end
	
	assign vga_out[15:0] = flag ? vga_in_f[15:0] : vga_in_z[15:0];
	assign 		  hs_out = flag ?  hs_in_f :  hs_in_z;
	assign 		  vs_out = flag ?  vs_in_f :  vs_in_z;
	
	xiaodou xiaodou (
    .clk(clk), 
    .rst_n(rst_n), 
    .key_in(key_in), 
    .key_out(key_out)
    );

endmodule
