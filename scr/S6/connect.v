`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:13:10 10/20/2020 
// Design Name: 
// Module Name:    connect 
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
module connect(
input clk,
input ce,
input   d,
output  q1,
output  q2 //一列三行，其中两行由shift_ram产生
    );
shift_ram shift_ram0 (
  .d(d), // input [0 : 0] d
  .clk(clk), // input clk
  .sclr(~rst_n),
  .ce(ce), // input ce
  .q(q1) // output [0 : 0] q
);

shift_ram shift_ram1 (
  .d(q1), // input [0 : 0] d
  .clk(clk), // input clk
  .sclr(~rst_n),
  .ce(ce), // input ce
  .q(q2) // output [0 : 0] q
);
endmodule
