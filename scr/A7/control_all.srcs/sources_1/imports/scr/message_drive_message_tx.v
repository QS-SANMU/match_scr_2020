`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:34 10/17/2020 
// Design Name: 
// Module Name:    message_tx 
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
module message_drive_message_tx(
      clk,
	  rst_n,
	  key_flag,
	  line_tx
    );
     input clk;
	 input rst_n;
	 input key_flag;
	 output reg line_tx;
	 
	 
parameter tx_start = 0,tx_stop = 1;
parameter delay_cnt = 25000000;
parameter telephone = "15909148329";
//parameter data_tx = "A"; 
reg [7:0]data_tx;
reg [12:0] cnt;  //波特率计数
reg clk_tx;      //分频时钟（波特率）
reg [3:0] cnt_tx;
reg en ;
reg [6:0]stop;

reg [24:0]cnt_20ms; //每发送一串指令后的延时
reg en_cnt_20ms;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    en_cnt_20ms <= 0;
	else if(cnt_20ms == delay_cnt - 1'b1)
	    en_cnt_20ms <= 0;
	else if(stop == 2 && cnt_tx == 11)//第一串指令发完
	    en_cnt_20ms <= 1;
	else if(stop == 12 && cnt_tx == 11)//第二串指令发完
	    en_cnt_20ms <= 1;
	else if(stop == 34 && cnt_tx == 11)//第三串指令发完
	    en_cnt_20ms <= 1;
	else if(stop == 54 && cnt_tx == 11)//第四串指令发完
	    en_cnt_20ms <= 1;
	else 
	    en_cnt_20ms <= en_cnt_20ms;
		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    cnt_20ms <= 0;
	else if(en_cnt_20ms)
	    if(cnt_20ms == delay_cnt - 1'b1)
		    cnt_20ms <= 0;
		else 
		    cnt_20ms <= cnt_20ms + 1'b1;
	else 
	    cnt_20ms <= 0;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
	    stop <= 0;
	else if(stop == 56 && cnt_tx == 11)
	    stop <= 0;
	else if(cnt_tx == 11)
	    stop <= stop + 1'b1;
	else 
	    stop <= stop;
		
always @(posedge clk or negedge rst_n)
    if(!rst_n)
	     data_tx <= "1";
	else if(en)
	     case(stop)
	     'd0:data_tx <= "A";	 
	     'd1:data_tx <= "T";
		 'd2:data_tx <= 8'b0000_1101;//回车
		 'd3:data_tx <= "A";	 
	     'd4:data_tx <= "T";
		 'd5:data_tx <= "+";
		 'd6:data_tx <= "C";	 
	     'd7:data_tx <= "M";
		 'd8:data_tx <= "G";
		 'd9:data_tx <= "F";
		 'd10:data_tx <= "=";
		 'd11:data_tx <= "1";
		 'd12:data_tx <= 8'b0000_1101;//回车
		 'd13:data_tx <= "A";	 
	     'd14:data_tx <= "T";
		 'd15:data_tx <= "+";
		 'd16:data_tx <= "C";	 
	     'd17:data_tx <= "M";
		 'd18:data_tx <= "G";
		 'd19:data_tx <= "S";
		 'd20:data_tx <= "=";
		 'd21:data_tx <= 8'b0010_0010;//"
		 'd22:data_tx <= telephone[87:80];
		 'd23:data_tx <= telephone[79:72];
		 'd24:data_tx <= telephone[71:64];
		 'd25:data_tx <= telephone[63:56];
		 'd26:data_tx <= telephone[55:48];
		 'd27:data_tx <= telephone[47:40];
		 'd28:data_tx <= telephone[39:32];
		 'd29:data_tx <= telephone[31:24];
		 'd30:data_tx <= telephone[23:16];
		 'd31:data_tx <= telephone[15:8];
		 'd32:data_tx <= telephone[7:0];
		 'd33:data_tx <= 8'b0010_0010;//"
		 'd34:data_tx <= 8'b0000_1101;//回车
		 'd35:data_tx <= "N";
		 'd36:data_tx <= ":";
		 'd37:data_tx <= "3";
		 'd38:data_tx <= "4";
		 'd39:data_tx <= "*";
		 'd40:data_tx <= "9";
		 'd41:data_tx <= "'";
		 'd42:data_tx <= " ";
		 'd43:data_tx <= " ";
		 'd44:data_tx <= " ";
		 'd45:data_tx <= "E";
		 'd46:data_tx <= ":";
		 'd47:data_tx <= "1";
		 'd48:data_tx <= "0";
		 'd49:data_tx <= "8";
		 'd50:data_tx <= "*";
		 'd51:data_tx <= "5";
		 'd52:data_tx <= "3";
		 'd53:data_tx <= "'";
		 'd54:data_tx <= 8'b0000_1101;//回车
		 'd55:data_tx <= 8'b0001_1010;//HEX :1A
		 'd56:data_tx <= 8'b0000_1101;//回车
	     endcase		
		
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
	    en <= 0;
	else if(key_flag)
	    en <= 1;
	else if(cnt_20ms == delay_cnt - 1'b1)
	    en <= 1;
	else if(stop == 2 && cnt_tx == 11)//第一串指令发完
	    en <= 0;
	else if(stop == 12 && cnt_tx == 11)//第二串指令发完
	    en <= 0;
	else if(stop == 34 && cnt_tx == 11)//第三串指令发完
	    en <= 0;
	else if(stop == 54 && cnt_tx == 11)//第四串指令发完
	    en <= 0;
	else if(stop == 56 && cnt_tx == 11)//第五串指令发完
	    en <= 0;
	else 
	    en <= en;
end

// 按键按下使能端打开，以及使能的停止


always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
	     cnt <= 0;
	 else if(en)
	 begin
	     if(cnt == 5207)
	         cnt <= 0;
	     else 
	         cnt <= cnt + 1'b1;
	 end
	 else 
	     cnt <= 0;
end
//分频计数

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
	     clk_tx <= 0;
	 else if(cnt == 2)
	     clk_tx <= 1;
	 else 
	     clk_tx <= 0;
end
//分频时钟的产生

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
	     cnt_tx <= 0;
	 else if(en)
	 begin
	     if(cnt_tx == 11)
	         cnt_tx <= 0;
	     else if(clk_tx)
	         cnt_tx <= cnt_tx + 1'b1;
	 end
	 else 
	     cnt_tx <= 0;
end

//用来传输数据的计数
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        line_tx <= 1;
	 else if(en)
	 case(cnt_tx)
	 'd0:line_tx <= 1;
	 'd1:line_tx <= tx_start;
	 'd2:line_tx <= data_tx[0];
	 'd3:line_tx <= data_tx[1];
	 'd4:line_tx <= data_tx[2];
	 'd5:line_tx <= data_tx[3];
	 'd6:line_tx <= data_tx[4];
	 'd7:line_tx <= data_tx[5];
	 'd8:line_tx <= data_tx[6];
	 'd9:line_tx <= data_tx[7];
	 'd10:line_tx <= tx_stop;
	 default:line_tx <= 1;
	 endcase
end


endmodule

