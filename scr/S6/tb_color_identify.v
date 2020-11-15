`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:45:01 10/04/2020
// Design Name:   color_identify
// Module Name:   F:/verilog/ov5640_wzs/ov5640/tb_color_identify.v
// Project Name:  ov5640
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: color_identify
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_color_identify;

	// Inputs
	reg clk;
	reg rst_n;
	reg [15:0] img_data;

	// Outputs
	wire [7:0] img_Y_r1;
	wire img_en;

	// Instantiate the Unit Under Test (UUT)
	color_identify uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.img_data(img_data), 
		.img_Y_r1(img_Y_r1), 
		.img_en(img_en)
	);
always #10 clk <= ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		img_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_n = 1;
		img_data = 16'b11001_110111_00011;
        
		// Add stimulus here

	end
      
endmodule

