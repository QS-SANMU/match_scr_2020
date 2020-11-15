`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:42:15 05/31/2020
// Design Name:   power_ctrl
// Module Name:   D:/isedaima/daima/ov5640/tb_power.v
// Project Name:  ov5640
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: power_ctrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_power;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire ov5640_pwdn;
	wire ov5640_rst_n;
	wire power_done;

	// Instantiate the Unit Under Test (UUT)
	power_ctrl uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.ov5640_pwdn(ov5640_pwdn), 
		.ov5640_rst_n(ov5640_rst_n), 
		.power_done(power_done)
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

