`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:48:16 06/01/2020
// Design Name:   ov5640_iic
// Module Name:   D:/isedaima/daima/ov5640/tb_iic.v
// Project Name:  ov5640
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ov5640_iic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_iic;

	// Inputs
	reg clk;
	reg rst_n;
	reg start;
    reg [31:0]wdata;
	// Outputs
	wire iic_scl;

	// Bidirs
	wire iic_sda;
	wire [7:0]iic_data;
    wire busy;


	// Instantiate the Unit Under Test (UUT)
	ov5640_iic uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.start(start), 
		.wdata(wdata),
		.iic_scl(iic_scl), 
		.iic_sda(iic_sda),
		.iic_data(iic_data),
	    .busy(busy)
	);
always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		wdata = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst_n = 1;
		wdata = 32'h79300a00;
		#1000;
		start = 1;
		#20;
		start = 0;
		#200000000;
		wdata = 32'h78300a56;
		start = 1;
		#20;
		start = 0;
		#200000000;
		wdata = 32'h78300a56;
		start = 1;
		#20;
		start = 0;
        
		// Add stimulus here

	end
      
endmodule

