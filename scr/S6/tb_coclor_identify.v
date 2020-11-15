`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:28:01 10/05/2020
// Design Name:   color_identify
// Module Name:   F:/verilog/ov5640_wzs/ov5640/tb_coclor_identify.v
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

module tb_coclor_identify;

	// Inputs
	reg clk;
	reg rst_n;
	reg per_frame_vsync;
	reg per_frame_href;
	reg per_frame_clken;
	reg [15:0] img_data;

	// Outputs
	wire img_en;

	// Instantiate the Unit Under Test (UUT)
	color_identify uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.per_frame_vsync(per_frame_vsync), 
		.per_frame_href(per_frame_href), 
		.per_frame_clken(per_frame_clken), 
		.img_data(img_data), 
		.img_en(img_en)
	);
always #10 clk <= ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		per_frame_vsync = 1;
		per_frame_href = 1;
		per_frame_clken = 1;
		img_data = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_n = 1;
		img_data = 16'b00000_000000_11111;
		
		#100000;
		img_data = 'b01100_100101_11101;
		
		#100000;
		img_data = 'd100;
		
		#100000;
		img_data = 'd140;
		
		
        
		// Add stimulus here

	end
      
endmodule

