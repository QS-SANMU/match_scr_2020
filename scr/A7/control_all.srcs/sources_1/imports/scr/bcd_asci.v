`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:52 10/23/2020 
// Design Name: 
// Module Name:    bcd_asci 
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
module bcd_asci(
    input  		 [3:0]   bcd,
    output  reg	 [7:0]   asci
    );
always@(*)begin
    case (bcd)
		4'd0: asci = 8'b0011_0000;
		4'd1: asci = 8'b0011_0001;
		4'd2: asci = 8'b0011_0010;
		4'd3: asci = 8'b0011_0011;
		4'd4: asci = 8'b0011_0100;
		4'd5: asci = 8'b0011_0101;
		4'd6: asci = 8'b0011_0110;
		4'd7: asci = 8'b0011_0111;
		4'd8: asci = 8'b0011_1000;
		4'd9: asci = 8'b0011_1001;
		default: asci = 8'b0010_1111;
    endcase
end

endmodule
