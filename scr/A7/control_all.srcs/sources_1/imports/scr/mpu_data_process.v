`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:41 09/22/2020 
// Design Name: 
// Module Name:    data_process 
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
module mpu_data_process(
	input clk,
	input rst,
	input rx_done,
	input [7:0] data_in,
	output [9:0] X,
	output [9:0] Y,
	output [9:0] Z
    );
	
	//to find the data of angle
	
	reg [63:0] data;
	reg [63:0] data_angle;
	
	always@(posedge clk or negedge rst)
	if(!rst)
		begin
			data <= 64'd0;
			data_angle <= 64'd0;
		end
	else if(rx_done)
		begin
			data <= {data[55:0],data_in};
			if(data[63:48] == 16'h5553)
				data_angle <= data;
		end
		
	
	//to process the data 
	
	reg [15:0] X_tmp;	
	reg [15:0] Y_tmp;
	reg [15:0] Z_tmp;
	
	always@(posedge rx_done or negedge rst)
	if(!rst)
		begin
			X_tmp <= 16'd0;
			Y_tmp <= 16'd0;
			Z_tmp <= 16'd0;
		end
	else
		begin
			X_tmp <= {data_angle[39:32],data_angle[47:40]};
			Y_tmp <= {data_angle[23:16],data_angle[31:24]};
			Z_tmp <= {data_angle[7:0]  ,data_angle[15:8] };
		end
	
	reg [23:0] X_tmp_1;	
	reg [23:0] Y_tmp_1;
	reg [23:0] Z_tmp_1;
	
	always@(posedge rx_done or negedge rst)
	if(!rst)
		begin
			X_tmp_1 <= 24'd0;
			Y_tmp_1 <= 24'd0;
			Z_tmp_1 <= 24'd0;
		end
	else
		begin
			X_tmp_1 <= X_tmp * 8'd180;
			Y_tmp_1 <= Y_tmp * 8'd180;
            Z_tmp_1 <= Z_tmp * 8'd180;
		end
	
	reg [8:0] X_tmp_2;	
	reg [8:0] Y_tmp_2;
	reg [8:0] Z_tmp_2;
	
	always@(posedge rx_done or negedge rst)
	if(!rst)
		begin
			X_tmp_2 <= 9'd0;
		    Y_tmp_2 <= 9'd0;
		    Z_tmp_2 <= 9'd0;
		end
	else
		begin
			X_tmp_2 <= X_tmp_1 / 16'd32768;
			Y_tmp_2 <= Y_tmp_1 / 16'd32768;
			Z_tmp_2 <= Z_tmp_1 / 16'd32768;
		end
		
	reg [9:0] X_tmp_3;
	reg [9:0] Y_tmp_3;
	reg [9:0] Z_tmp_3;
	
	always@(posedge rx_done or negedge rst)      //高位是1，则角度为负，反之为正
	if(!rst)
		begin
			X_tmp_3 <= 10'd0;
		    Y_tmp_3 <= 10'd0;
			Z_tmp_3 <= 10'd0;
		end
	else 
		begin
			X_tmp_3 <= (X_tmp_2 > 8'd180)? {1'b1,(9'd360 - X_tmp_2)} : {1'b0,X_tmp_2};
		    Y_tmp_3 <= (Y_tmp_2 > 8'd180)? {1'b1,(9'd360 - Y_tmp_2)} : {1'b0,Y_tmp_2};
			Z_tmp_3 <= (Z_tmp_2 > 8'd180)? {1'b1,(9'd360 - Z_tmp_2)} : {1'b0,Z_tmp_2};
		end
		
		
		
	reg [9:0] X_tmp_4;
	reg [9:0] Y_tmp_4;
	reg [9:0] Z_tmp_4;
	reg [9:0] X_tmp_5;
	reg [9:0] Y_tmp_5;
	reg [9:0] Z_tmp_5;
	
	
	always@(posedge rx_done or negedge rst)
	if(!rst)
		begin
			X_tmp_4 <= 10'd0;
		    Y_tmp_4 <= 10'd0;
		    Z_tmp_4 <= 10'd0;
		    X_tmp_5 <= 10'd0;
		    Y_tmp_5 <= 10'd0;
		    Z_tmp_5 <= 10'd0;
		end
	else
		begin
			X_tmp_4 <= X_tmp_3;
			Y_tmp_4 <= Y_tmp_3;
			Z_tmp_4 <= Z_tmp_3;
			X_tmp_5 <= X_tmp_4;
			Y_tmp_5 <= Y_tmp_4;
			Z_tmp_5 <= Z_tmp_4;
		end
		
	
	reg [9:0] X_change;
	reg [9:0] Y_change;
	reg [9:0] Z_change;

	always@(posedge rx_done or negedge rst)
	if(!rst)
		X_change <= 10'd0;
	else
		case({X_tmp_4[9],X_tmp_5[9]})
			2'b00 : 
					begin
						if(X_tmp_4[8:0] > X_tmp_5[8:0])
							X_change <= {1'b0,(X_tmp_4[8:0] - X_tmp_5[8:0])};
						else if(X_tmp_4[8:0] < X_tmp_5[8:0])
							X_change <= {1'b1,(X_tmp_5[8:0] - X_tmp_4[8:0])};
						else
							X_change <= 10'd0;
					end
			2'b11 : 
					begin
						if(X_tmp_4[8:0] > X_tmp_5[8:0])
							X_change <= {1'b1,(X_tmp_4[8:0] - X_tmp_5[8:0])};
						else if(X_tmp_4[8:0] < X_tmp_5[8:0])
							X_change <= {1'b0,(X_tmp_5[8:0] - X_tmp_4[8:0])};
						else
							X_change <= 10'd0;
					end	
			2'b01 : 
					begin
							X_change <= {1'b0,(X_tmp_4[8:0] + X_tmp_5[8:0])};
					end
			2'b10 : 
					begin
							X_change <= {1'b1,(X_tmp_4[8:0] + X_tmp_5[8:0])};
					end
			default :
					begin
							X_change <= 10'd0;
					end
		endcase
		
	
	
	
	always@(posedge rx_done or negedge rst)
	if(!rst)
		Y_change <= 10'd0;
	else
		case({Y_tmp_4[9],Y_tmp_5[9]})
			2'b00 : 
					begin
						if(Y_tmp_4[8:0] > Y_tmp_5[8:0])
							Y_change <= {1'b0,(Y_tmp_4[8:0] - Y_tmp_5[8:0])};
						else if(Y_tmp_4[8:0] < Y_tmp_5[8:0])
							Y_change <= {1'b1,(Y_tmp_5[8:0] - Y_tmp_4[8:0])};
						else
							Y_change <= 10'd0;
					end
			2'b11 : 
					begin
						if(Y_tmp_4[8:0] > Y_tmp_5[8:0])
							Y_change <= {1'b1,(Y_tmp_4[8:0] - Y_tmp_5[8:0])};
						else if(Y_tmp_4[8:0] < Y_tmp_5[8:0])
							Y_change <= {1'b0,(Y_tmp_5[8:0] - Y_tmp_4[8:0])};
						else
							Y_change <= 10'd0;
					end	
			2'b01 : 
					begin
							Y_change <= {1'b0,(Y_tmp_4[8:0] + Y_tmp_5[8:0])};
					end
			2'b10 : 
					begin
							Y_change <= {1'b1,(Y_tmp_4[8:0] + Y_tmp_5[8:0])};
					end
			default :
					begin
							Y_change <= 10'd0;
					end
		endcase
		
	
	always@(posedge rx_done or negedge rst)
	if(!rst)
		Z_change <= 10'd0;
	else
		case({Z_tmp_4[9],Z_tmp_5[9]})
			2'b00 : 
					begin
						if(Z_tmp_4[8:0] > Z_tmp_5[8:0])
							Z_change <= {1'b1,(Z_tmp_4[8:0] - Z_tmp_5[8:0])};
						else if(Z_tmp_4[8:0] < Z_tmp_5[8:0])
							Z_change <= {1'b0,(Z_tmp_5[8:0] - Z_tmp_4[8:0])};
						else
							Z_change <= 10'd0;
					end
			2'b11 : 
					begin
						if(Z_tmp_4[8:0] > Z_tmp_5[8:0])
							Z_change <= {1'b0,(Z_tmp_4[8:0] - Z_tmp_5[8:0])};
						else if(Z_tmp_4[8:0] < Z_tmp_5[8:0])
							Z_change <= {1'b1,(Z_tmp_5[8:0] - Z_tmp_4[8:0])};
						else
							Z_change <= 10'd0;
					end	
			2'b01 : 
					begin
							Z_change <= {1'b1,(Z_tmp_4[8:0] + Z_tmp_5[8:0])};
					end
			2'b10 : 
					begin
							Z_change <= {1'b0,(Z_tmp_4[8:0] + Z_tmp_5[8:0])};
					end
			default :
					begin
							Z_change <= 10'd0;
					end
		endcase
	
	
		
	assign X = X_change;
	assign Y = Y_change;
	assign Z = Z_change;

	
		
endmodule
