`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:42 05/31/2020 
// Design Name: 
// Module Name:    ov5640_iic 
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
module ov5640_iic(
    clk,
	rst_n,
	start,
	wdata,
	iic_scl,
	iic_sda,
	iic_data,
	busy
    );
input clk;
input rst_n;
input start;
input [31:0]wdata;
output iic_scl;
inout  iic_sda;
output reg [7:0]iic_data;
output reg busy;

localparam delay_max = 250;  // clk_100k


wire [7:0]id_reg;
wire [16:0]word_reg;
wire [7:0]in_data;
wire dir;

reg clk_100k;
reg high_flag;
reg low_flag;

reg count_en;
reg [5:0]count;
reg [8:0]cnt;

reg sda_en;
reg sda;


assign iic_sda = (sda_en)?sda:1'bz;
assign iic_scl = ((dir && (count == 0 || count == 29 || count == 49))||
                  (!dir && (count == 0 || count == 38)))?1'b1:clk_100k;
assign id_reg = wdata[31:24];
assign word_reg = wdata[23:8];
assign in_data = wdata[7:0];
assign dir = wdata[24];

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    cnt <= 0;
	else if(cnt == (delay_max * 2) - 1)
	    cnt <= 0;
	else 
	    cnt <= cnt + 1'b1;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
        clk_100k <= 0;
    else if(cnt <= delay_max - 1)
        clk_100k <= 1;
    else if(cnt > delay_max)
        clk_100k <= 0;
	else 
	    clk_100k <= clk_100k;

always @(posedge clk or negedge rst_n)
    if(!rst_n)begin
	    high_flag <= 0;
		low_flag <= 0;
	end
	else if(cnt == (delay_max) / 2 - 1)
	    high_flag <= 1;
	else if(cnt == delay_max + (delay_max) / 2 - 1)
	    low_flag <= 1;
    else begin
	    high_flag <= 0;
		low_flag <= 0;
	end

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    count_en <= 0;
	else if((dir && count == 49) || (!dir && count == 38))
	    count_en <= 0;
	else if(start)
	    count_en <= 1;
	else 
	    count_en <= count_en;
		
always @(posedge clk_100k or negedge rst_n)
    if(!rst_n)
	    count <= 0;
	else if(count_en)
	    count <= count + 1'b1;
	else 
	    count <= 0;
 
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    busy <= 0;
	else if(start)
	    busy <= 1;
	else if((dir && count == 49 && high_flag)||(!dir && count == 38 && high_flag))
	    busy <= 0;
    else 
	    busy <= busy;
		
always @(posedge clk or negedge rst_n)
    if(!rst_n)begin
	    sda <= 1;
		sda_en <= 1;
		iic_data <= 0;
	end
    else if(dir)begin
	     if(high_flag)
         case(count)
              1:begin sda_en <= 1; sda <= 0;end	
	         29:begin sda_en <= 1;  sda <= 1;end		
             30:begin sda_en <= 1;  sda <= 0;end	
             40:begin sda_en <= 0;  iic_data[7] <= iic_sda;end
		     41:begin sda_en <= 0;  iic_data[6] <= iic_sda;end
		     42:begin sda_en <= 0;  iic_data[5] <= iic_sda;end
		     43:begin sda_en <= 0;  iic_data[4] <= iic_sda;end
		     44:begin sda_en <= 0;  iic_data[3] <= iic_sda;end
		     45:begin sda_en <= 0;  iic_data[2] <= iic_sda;end
		     46:begin sda_en <= 0;  iic_data[1] <= iic_sda;end
		     47:begin sda_en <= 0;  iic_data[0] <= iic_sda;end
		     49:begin sda_en <= 1;  sda <= 1;end	
		     default:begin sda_en <= sda_en;  sda <= sda; iic_data <= iic_data; end
         endcase 
         else if(low_flag)
             case(count)
             1:begin sda_en <= 1;  sda <= id_reg[7];end
             2:begin sda_en <= 1;  sda <= id_reg[6];end
             3:begin sda_en <= 1;  sda <= id_reg[5];end
             4:begin sda_en <= 1;  sda <= id_reg[4];end
             5:begin sda_en <= 1;  sda <= id_reg[3];end
             6:begin sda_en <= 1;  sda <= id_reg[2];end
             7:begin sda_en <= 1;  sda <= id_reg[1];end
             8:begin sda_en <= 1;  sda <= 0;end	
             9:sda_en <= 0;
             10:begin sda_en <= 1;  sda <= word_reg[15];end
             11:begin sda_en <= 1;  sda <= word_reg[14];end
             12:begin sda_en <= 1;  sda <= word_reg[13];end
             13:begin sda_en <= 1;  sda <= word_reg[12];end
             14:begin sda_en <= 1;  sda <= word_reg[11];end
             15:begin sda_en <= 1;  sda <= word_reg[10];end	
             16:begin sda_en <= 1;  sda <= word_reg[9];end
             17:begin sda_en <= 1;  sda <= word_reg[8];end
		     18:sda_en <= 0;
             19:begin sda_en <= 1;  sda <= word_reg[7];end
             20:begin sda_en <= 1;  sda <= word_reg[6];end
             21:begin sda_en <= 1;  sda <= word_reg[5];end
             22:begin sda_en <= 1;  sda <= word_reg[4];end
             23:begin sda_en <= 1;  sda <= word_reg[3];end
             24:begin sda_en <= 1;  sda <= word_reg[2];end
             25:begin sda_en <= 1;  sda <= word_reg[1];end
             26:begin sda_en <= 1;  sda <= word_reg[0];end
	         27:sda_en <= 0;
		     28:begin sda_en <= 1;  sda <= 0;end
		     29:begin sda_en <= 1;  sda <= 1;end
		     30:begin sda_en <= 1;  sda <= id_reg[7];end
		     31:begin sda_en <= 1;  sda <= id_reg[6];end
		     32:begin sda_en <= 1;  sda <= id_reg[5];end
		     33:begin sda_en <= 1;  sda <= id_reg[4];end
		     34:begin sda_en <= 1;  sda <= id_reg[3];end
		     35:begin sda_en <= 1;  sda <= id_reg[2];end
		     36:begin sda_en <= 1;  sda <= id_reg[1];end
		     37:begin sda_en <= 1;  sda <= id_reg[0];end
		     38:sda_en <= 0;
		     39:begin sda_en <= 0;  end 
		     40:begin sda_en <= 0;  end 
		     41:begin sda_en <= 0;  end 
		     42:begin sda_en <= 0;  end 
		     43:begin sda_en <= 0;  end 
		     44:begin sda_en <= 0;  end 
		     45:begin sda_en <= 0;  end 
		     46:begin sda_en <= 0;  end
		     47:sda_en <= 0;
		     48:begin sda_en <= 1;  sda <= 0;end
		     default:begin sda_en <= sda_en;  sda <= sda ;end
		 endcase
	end
	else if(!dir)begin
         if(high_flag)
             case(count)
             1: begin sda_en <= 1; sda <= 0;end	
             38:begin sda_en <= 1; sda <= 1;end
		     default:begin sda_en <= sda_en;  sda <= sda;end
             endcase 
         else if(low_flag)
             case(count)
             1:begin sda_en <= 1;  sda <= id_reg[7];end
             2:begin sda_en <= 1;  sda <= id_reg[6];end
             3:begin sda_en <= 1;  sda <= id_reg[5];end
             4:begin sda_en <= 1;  sda <= id_reg[4];end
             5:begin sda_en <= 1;  sda <= id_reg[3];end
             6:begin sda_en <= 1;  sda <= id_reg[2];end
             7:begin sda_en <= 1;  sda <= id_reg[1];end
             8:begin sda_en <= 1;  sda <= 0;end	
             9:sda_en <= 0;
             10:begin sda_en <= 1;  sda <= word_reg[15];end
             11:begin sda_en <= 1;  sda <= word_reg[14];end
             12:begin sda_en <= 1;  sda <= word_reg[13];end
             13:begin sda_en <= 1;  sda <= word_reg[12];end
             14:begin sda_en <= 1;  sda <= word_reg[11];end
             15:begin sda_en <= 1;  sda <= word_reg[10];end	
             16:begin sda_en <= 1;  sda <= word_reg[9];end
             17:begin sda_en <= 1;  sda <= word_reg[8];end
		     18:sda_en <= 0;
             19:begin sda_en <= 1;  sda <= word_reg[7];end
             20:begin sda_en <= 1;  sda <= word_reg[6];end
             21:begin sda_en <= 1;  sda <= word_reg[5];end
             22:begin sda_en <= 1;  sda <= word_reg[4];end
             23:begin sda_en <= 1;  sda <= word_reg[3];end
             24:begin sda_en <= 1;  sda <= word_reg[2];end
             25:begin sda_en <= 1;  sda <= word_reg[1];end
             26:begin sda_en <= 1;  sda <= word_reg[0];end
	         27:sda_en <= 0;
		     28:begin sda_en <= 1;  sda <= in_data[7];end
		     29:begin sda_en <= 1;  sda <= in_data[6];end
		     30:begin sda_en <= 1;  sda <= in_data[5];end
		     31:begin sda_en <= 1;  sda <= in_data[4];end
		     32:begin sda_en <= 1;  sda <= in_data[3];end
		     33:begin sda_en <= 1;  sda <= in_data[2];end
		     34:begin sda_en <= 1;  sda <= in_data[1];end
		     35:begin sda_en <= 1;  sda <= in_data[0];end
		     36:sda_en <= 0;
			 37:begin sda_en <= 1;  sda <= 0;end
		     default:begin sda_en <= sda_en;  sda <= sda ;end
		 endcase
    end
endmodule
