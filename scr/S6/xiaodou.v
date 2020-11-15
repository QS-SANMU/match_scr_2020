`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:00 11/12/2020 
// Design Name: 
// Module Name:    xiaodou 
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
module xiaodou(
    input clk,
	 input rst_n,
	 input key_in,
	 output reg key_out
    );
	 
	 reg key_1;
	 reg key_2;
	 always@(posedge clk or negedge rst_n)
	    begin
		    if(!rst_n) begin
			    key_1 <= 0;
				key_2 <= 0;
			end
			else begin
			    key_1 <= key_in;
				key_2 <= key_1;
			end
		end
	 
	 parameter s0 = 2'b00,s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;
	 reg [1:0] state;
	 always@(posedge clk or negedge rst_n) begin
		    if(!rst_n) begin
			    state <= s0;
				 key_out <= 0;
			end
			else begin
			    case(state)
				    s0 : 
					    begin
						    if(key_2) begin
								state <= s1;
								key_out <= 0;
							end
							else begin
								state <= s0;
                                key_out <= 0;
                            end									
						end
					s1 :
					    begin
						    if(!(key_1 ^ key_2)) begin
						        state <= s2;
								key_out <= 1;
							end
							else if(key_1 ^ key_2) begin
								state <= s1;
								key_out <= 0;
							end
							else begin
								   state <= s1;
                                   key_out <= 0;
						    end
						end
					 s2 :
					     begin
						    if(!key_2) begin
							    state <= s3;
							    key_out <= 1;
							end
							else begin
							    state <= s2;
								key_out <= 1;
							end
						end
					 s3 :
					    begin
						    if(!(key_1 ^ key_2)) begin
							    state <= s0;
								key_out <= 0;
                        end								  
                        else if(key_1 ^ key_2) begin
							    state <= s3;
								key_out <= 1;
							end							  
						end
                    default : state <= s0;
				endcase
			end
		end
endmodule
