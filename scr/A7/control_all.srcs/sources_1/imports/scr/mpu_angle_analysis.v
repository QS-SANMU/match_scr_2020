`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:14 10/03/2020 
// Design Name: 
// Module Name:    angle_analysis 
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
//mpu角度分析
module mpu_angle_analysis(
    //user signals
    input               clk,
    input               rst_n,
    //mpu signals
    input   [9:0]   	dev_z,//deviation_z,z的偏移,波特率9600
    input   [9:0]   	dev_x,//
    input           	dev_vld,
	//	
	input	[5:0]		state,
    //user  signals,来自串口屏的信号
    input   [2:0]       angle_ulr,//up_left_right,持续一个时钟然后恢复常态
	//角度信号
    output  reg[8:0]       angle_z,
    output  reg[8:0]       angle_x
    );
    localparam  model_up = 3'b010;//50~270     0~50
    localparam  model_left = 3'b100;//0~180    0~50
    localparam  model_right = 3'b001;//180~360 0~50
    reg [2:0] model;  
    //--------------------------------------------------------------------模式切换，三个方位 
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            model <= model_up;
		else if(state != 6'b001_000)
			model <= model_up;
        else case (angle_ulr)
            model_up: model <= model_up;
            model_left: model <= model_left;
            model_right: model <= model_right;
            default: model <= model;
        endcase
    end
	
    //--------------------------------------------------------------------   angle_x;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            angle_x <= 9'd50;
		else if(state != 6'b001_000)
			angle_x <= 9'd50;
        else if(angle_ulr != 3'b000)//不等于0的情况只有预设的三种
            angle_x <= 9'd50;
        else if(dev_vld)begin
            if(dev_x[9])begin
                if(angle_x + dev_x[8:0] < 9'd90)
                    angle_x <= angle_x + dev_x[8:0];
                else
                    angle_x <= angle_x;
            end
            else begin
                if(angle_x > dev_x[8:0] && (angle_x - dev_x[8:0] > 9'd30))
                    angle_x <= angle_x - dev_x[8:0];
                else
                    angle_x <= angle_x;
            end
        end
    end
    //--------------------------------------------------------------------   angle_z;
    always @(posedge clk or negedge rst_n) begin
		if(!rst_n)
			angle_z <= 9'd180;
		else if(state != 6'b001_000)
			angle_z <= 9'd180;
		else	begin
			case (model)
				model_up: begin
					if(angle_ulr == model_up)begin
						angle_z <= 9'd180;
					end
					else if(dev_vld)begin
						if(dev_z[9])begin
							if(angle_z + dev_z[8:0] < 9'd270)
								angle_z <= angle_z + dev_z[8:0];
							else
								angle_z <= angle_z;
						end
						else begin
							if((angle_z - dev_z[8:0] > 9'd50) && (angle_z > dev_z[8:0]))
								angle_z <= angle_z - dev_z[8:0];
							else
								angle_z <= angle_z;
						end
					end
					else begin
						angle_z <= angle_z;
					end
				end
				model_left: begin
					if(angle_ulr == model_left)begin
						angle_z <= 9'd270;
					end
					else if(dev_vld)begin
						if(dev_z[9])begin
							if(angle_z + dev_z[8:0] < 9'd360)
								angle_z <= angle_z + dev_z[8:0];
							else
								angle_z <= angle_z;
						end
						else begin
							if((angle_z - dev_z[8:0] > 9'd180) && (angle_z > dev_z[8:0]))
								angle_z <= angle_z - dev_z[8:0];
							else
								angle_z <= angle_z;
						end
					end
					else begin
						angle_z <= angle_z;
					end
				end
				model_right: begin
					if(angle_ulr == model_right)begin
						angle_z <= 9'd90;
					end
					else if(dev_vld)begin
						if(dev_z[9])begin
							if(angle_z + dev_z[8:0] < 9'd180)
								angle_z <= angle_z + dev_z[8:0];
							else
								angle_z <= angle_z;
						end
						else begin
							if((angle_z - dev_z[8:0] > 9'd0) && (angle_z > dev_z[8:0]))
								angle_z <= angle_z - dev_z[8:0];
							else
								angle_z <= angle_z;
						end
					end
					else begin
						angle_z <= angle_z;
					end
				end
				default: angle_z <= 0;
			endcase
		end
    end
endmodule
