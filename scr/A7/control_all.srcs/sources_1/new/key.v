module key(
	input wire		clk,
	input wire		key1,
	
	output reg 		key1_flag

);

reg [24:0]	cnt;

parameter CNT_END = 33000000;   //����Ƶ��
parameter TIME = 99;  //����ʱ��


always @(posedge clk)
	if(key1)   //��������
		cnt<=0;
	else if(cnt==CNT_END)
		cnt<=0;
	else if(!key1)    //��������
		cnt<=cnt+1;
//---
always @(posedge clk)
	if(cnt==TIME)
		key1_flag<=1;
	else 
		key1_flag<=0;
//---



endmodule