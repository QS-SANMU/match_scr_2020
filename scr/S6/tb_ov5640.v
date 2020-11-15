`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:49:53 07/06/2020
// Design Name:   ov5640_top
// Module Name:   D:/isedaima/daima/ov5640/tb_ov5640.v
// Project Name:  ov5640
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ov5640_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ov5640;

	// Inputs
	reg clk_sys50m;
	reg clk_sys24m;
	reg rst_n;
	reg estart;
	reg [31:0] ewdata;

	// Outputs
	wire ov5640_pwdn;
	wire ov5640_rst_n;
	wire ov5640_xclk;
	wire ov5640_iic_scl;
	wire [7:0] riic_data;

	// Bidirs
	wire ov5640_iic_sda;

	// Instantiate the Unit Under Test (UUT)
	ov5640_top uut (
		.clk_sys50m(clk_sys50m), 
		.clk_sys24m(), 
		.rst_n(rst_n), 
		.ov5640_pwdn(ov5640_pwdn), 
		.ov5640_rst_n(ov5640_rst_n), 
		.ov5640_xclk(ov5640_xclk), 
		.ov5640_iic_scl(ov5640_iic_scl), 
		.ov5640_iic_sda(ov5640_iic_sda), 
		.estart(estart), 
		.ewdata(ewdata), 
		.riic_data(riic_data)
	);
always #10 clk_sys50m = ~clk_sys50m;
	initial begin
		// Initialize Inputs
		clk_sys50m = 0;
		//clk_sys24m = 0;
		rst_n = 0;
		estart = 0;
		ewdata = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_n = 1;
        
		// Add stimulus here

	end
      
endmodule

