`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/13 16:39:30
// Design Name: 
// Module Name: keys_wen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module keys_wen(
    input               clk         ,
    input               rst_n       ,
	input				keys_in		,
    output              keys_out
    );
	reg [31:0]cnt;
	localparam NUM = 32'd5_000_000;
    reg keys_in_t;
    reg flag;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            keys_in_t <= 1'b0;
        end
        else begin
            keys_in_t <= keys_in;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)begin
            flag <= 1'b0;
        end
        else if(cnt >= NUM)begin
            flag <= 1'b0;
        end
        else if(keys_in_t != keys_in)begin
            flag <= 1'b1;
        end
    end


	always @(posedge clk or negedge rst_n) begin
		if(!rst_n)begin
			cnt <= 32'd0;
		end
		else if(cnt >= NUM)begin
			cnt <= 32'd0;
		end
		else if(keys_in)begin
			cnt <= cnt + 1'b1;
		end
        else begin
            cnt <= 1'b0;
        end
	end

    always @(posedge clk or negedge rst_n) begin
        if(rst_n)begin
            keys_out <= 1'b0;
        end
        else if(cnt >= NUM)begin
            keys_out <= 1'b1;
        end
    end
    
endmodule
