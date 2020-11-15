`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:58:27 05/06/2020
// Design Name:   top
// Module Name:   D:/isedaima/daima/ov5640/tb0.v
// Project Name:  ov5640
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb0;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire vga_hs;
	wire vga_vs;
	wire [15:0] rgb;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.vga_hs(vga_hs), 
		.vga_vs(vga_vs), 
		.rgb(rgb)
	);
always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst_n = 1;
		// Add stimulus here

	end
      
endmodule

