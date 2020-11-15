`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:23:49 10/16/2020 
// Design Name: 
// Module Name:    bin_asci 
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
module bin_asci(
	input		[8:0]	bin,
	output	reg	[47:0]	asci
    );

localparam	asci_0		=	8'b0011_0000;
localparam	asci_1		=	8'b0011_0001;
localparam	asci_2		=	8'b0011_0010;
localparam	asci_3		=	8'b0011_0011;
localparam	asci_4		=	8'b0011_0100;
localparam	asci_5		=	8'b0011_0101;
localparam	asci_6		=	8'b0011_0110;
localparam	asci_7		=	8'b0011_0111;
localparam	asci_8		=	8'b0011_1000;
localparam	asci_9		=	8'b0011_1001;
localparam	asci_space	=	8'b0010_0000;

integer i;//位宽为主机位数 64
reg	[3:0]	H;
reg	[3:0]	T;
reg	[3:0]	O;
always@(bin)begin
	H = 4'b0;
	T = 4'b0;
	O = 4'b0;
	for(i = 8;i >= 0;i=i - 1)begin
		if(H >= 4'd5)
			H = H + 4'd3;
		if(T >=  4'd5)
			T = T + 4'd3;
		if(O >= 4'd5)
			O = O + 4'd3;
		H = H << 1;
		H[0] = T[3];
		T = T << 1;
		T[0] = O[3];
		O = O << 1;
		O[0] = bin[i];
	end
end

always@(*)begin
	asci[47:32] = 16'b0010_0000_0010_0000;
	asci[7:0]   = 8'b0010_0000;
	case (H)
		4'd0: asci[31:24] = 8'b0011_0000;
		4'd1: asci[31:24] = 8'b0011_0001;
		4'd2: asci[31:24] = 8'b0011_0010;
		4'd3: asci[31:24] = 8'b0011_0011;
		4'd4: asci[31:24] = 8'b0011_0100;
		4'd5: asci[31:24] = 8'b0011_0101;
		4'd6: asci[31:24] = 8'b0011_0110;
		4'd7: asci[31:24] = 8'b0011_0111;
		4'd8: asci[31:24] = 8'b0011_1000;
		4'd9: asci[31:24] = 8'b0011_1001;
		default: asci[31:24] = 8'b0010_0000;
	endcase
	case (T)
		4'd0: asci[23:16] = 8'b0011_0000;
		4'd1: asci[23:16] = 8'b0011_0001;
		4'd2: asci[23:16] = 8'b0011_0010;
		4'd3: asci[23:16] = 8'b0011_0011;
		4'd4: asci[23:16] = 8'b0011_0100;
		4'd5: asci[23:16] = 8'b0011_0101;
		4'd6: asci[23:16] = 8'b0011_0110;
		4'd7: asci[23:16] = 8'b0011_0111;
		4'd8: asci[23:16] = 8'b0011_1000;
		4'd9: asci[23:16] = 8'b0011_1001;
		default: asci[23:16] = 8'b0010_0000;
	endcase
	case (O)
		4'd0: asci[15:8] = 8'b0011_0000;
		4'd1: asci[15:8] = 8'b0011_0001;
		4'd2: asci[15:8] = 8'b0011_0010;
		4'd3: asci[15:8] = 8'b0011_0011;
		4'd4: asci[15:8] = 8'b0011_0100;
		4'd5: asci[15:8] = 8'b0011_0101;
		4'd6: asci[15:8] = 8'b0011_0110;
		4'd7: asci[15:8] = 8'b0011_0111;
		4'd8: asci[15:8] = 8'b0011_1000;
		4'd9: asci[15:8] = 8'b0011_1001;
		default: asci[23:16] = 8'b0010_0000;
	endcase
end
endmodule 
