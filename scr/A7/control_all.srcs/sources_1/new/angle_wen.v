`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/13 21:41:08
// Design Name: 
// Module Name: angle_wen
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


module angle_wen(
    input   clk,
    input   rst_n,

    input       [7:0]       angle_z_in,
    input       [7:0]       angle_x_in,

    output   reg   [7:0]       angle_z_out,
    output   reg   [7:0]       angle_x_out
    );
reg [7:0]angle_z_in_t;
reg [7:0]angle_x_in_t;
reg [7:0]angle_z_in_tt;
reg [7:0]angle_x_in_tt;
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        angle_z_in_t <= 8'b0;
    end
    else if(angle_z_in > 0 && angle_z_in <= 81)begin
        angle_z_in_t <= angle_z_in;
    end
    else begin
        angle_z_in_t <= angle_z_in_t;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        angle_z_in_tt <= 8'b0;
    end
    else begin
        angle_z_in_tt <= angle_z_in_t;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        angle_z_out <= 8'b0;
    end
    else if((angle_z_in_tt - angle_z_in_t >= 40) && (angle_z_in_t - angle_z_in_tt >= 40))begin
        angle_z_out <= angle_z_out;
    end
    else begin
        angle_z_out <= angle_z_in_t;//angle_z_in_tt;
    end
end


always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        angle_x_in_t <= 8'b0;
    end
    else if(angle_x_in > 0 && angle_x_in <= 88)begin
        angle_x_in_t <= angle_x_in;
    end
    else begin
        angle_x_in_t <= angle_x_in_t;
    end
end
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        angle_x_in_tt <= 8'b0;
    end
    else begin
        angle_x_in_tt <= angle_x_in_t;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        angle_x_out <= 8'b0;
    end
    else if((angle_x_in_tt - angle_x_in_t >= 40) && (angle_x_in_t - angle_x_in_tt >= 40))begin
        angle_x_out <= angle_x_out;
    end
    else begin
        angle_x_out <= angle_x_in_t;//angle_x_in_tt;
    end
end
endmodule
