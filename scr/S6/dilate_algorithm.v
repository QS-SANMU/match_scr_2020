`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:13 10/17/2020 
// Design Name: 
// Module Name:    dilate_algorithm 
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
module dilate_algorithm(

    //System Interfaces
    input                   sclk            ,
    input                   rst_n           ,
    //Communication Interfaces
    input                   rx_data         ,
    input                   pi_flag         ,
    output  reg             tx_data         ,
    output  reg             po_flag         
);
 
//========================================================================================\
//**************Define Parameter and  Internal Signals**********************************
//========================================================================================/
parameter           COL_NUM     =   1024    ;
parameter           ROW_NUM     =   720     ;
parameter           VALUE       =   80      ;

wire                        mat_row1        ;
wire                        mat_row2        ;
wire                        mat_row3        ;
					      
wire                        mat_flag        ; 
					      
reg                         mat_row1_1      ;
reg                         mat_row2_1      ;
reg                         mat_row3_1      ;
reg                         mat_row1_2      ;
reg                         mat_row2_2      ;
reg                         mat_row3_2      ;

reg                         mat_flag_1      ; 
reg                         mat_flag_2      ; 
reg                         mat_flag_3      ; 
reg                         mat_flag_4      ; 
reg                         mat_flag_5      ; 
reg                         mat_flag_6      ; 
reg                         mat_flag_7      ;
     

reg                         mat_row1_flag   ;
reg                         mat_row2_flag   ;
reg                         mat_row3_flag   ; 
reg                         mat_row1_1_flag ;
reg                         mat_row2_1_flag ;
reg                         mat_row3_1_flag ;
reg                         mat_row1_2_flag ;
reg                         mat_row2_2_flag ;
reg                         mat_row3_2_flag ; 

 
//========================================================================================\
//**************     Main      Code        **********************************
//========================================================================================/
always @(posedge sclk)
    begin
        mat_row1_1          <=          mat_row1;
        mat_row2_1          <=          mat_row2;
        mat_row3_1          <=          mat_row3;
        mat_row1_2          <=          mat_row1_1;
        mat_row2_2          <=          mat_row2_1;
        mat_row3_2          <=          mat_row3_1;
    end
    
always @(posedge sclk)
    begin
        mat_flag_1          <=          mat_flag;      
        mat_flag_2          <=          mat_flag_1;      
        mat_flag_3          <=          mat_flag_2;      
        mat_flag_4          <=          mat_flag_3;      
        mat_flag_5          <=          mat_flag_4;      
        mat_flag_6          <=          mat_flag_5;      
        mat_flag_7          <=          mat_flag_6;      
    end

/*
always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row1_flag       <=          1'b0;
    else if(mat_row1 == 1)
        mat_row1_flag       <=          1'b1;
    else
        mat_row1_flag       <=          1'b0;
          
always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row2_flag       <=          1'b0;
    else if(mat_row2 == 1)
        mat_row2_flag       <=          1'b1;
    else
        mat_row2_flag       <=          1'b0;
          
always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row3_flag       <=          1'b0;
    else if(mat_row3 == 1)
        mat_row3_flag       <=          1'b1;
    else
        mat_row3_flag       <=          1'b0;
          
always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row1_1_flag     <=          1'b0;  
    else if(mat_row1_1 == 1)
        mat_row1_1_flag     <=          1'b1;
    else
        mat_row1_1_flag     <=          1'b0;

always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row2_1_flag     <=          1'b0;  
    else if(mat_row2_1 == 1)
        mat_row2_1_flag     <=          1'b1;
    else
        mat_row2_1_flag     <=          1'b0;

always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row3_1_flag     <=          1'b0;  
    else if(mat_row3_1 == 1)
        mat_row3_1_flag     <=          1'b1;
    else
        mat_row3_1_flag     <=          1'b0;
          
always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row1_2_flag     <=          1'b0;  
    else if(mat_row1_2 == 1)
        mat_row1_2_flag     <=          1'b1;
    else
        mat_row1_2_flag     <=          1'b0;

always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row2_2_flag     <=          1'b0;  
    else if(mat_row2_2 == 1)
        mat_row2_2_flag     <=          1'b1;
    else
        mat_row2_2_flag     <=          1'b0;

always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        mat_row3_2_flag     <=          1'b0;  
    else if(mat_row2_2 == 1)
        mat_row3_2_flag     <=          1'b1;
    else
        mat_row3_2_flag     <=          1'b0;
           
always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        tx_data             <=          1'd0; 
    else if(mat_row1_flag + mat_row2_flag + mat_row3_flag + mat_row1_1_flag + mat_row2_1_flag + mat_row3_1_flag + mat_row1_2_flag + mat_row2_2_flag + mat_row3_2_flag >= 'd1)
        tx_data             <=          1;
    else 
        tx_data             <=          1'd0; 
		
*/
reg	tx_data0,	tx_data1,	tx_data2;
always@(posedge sclk or negedge rst_n)
begin
	if(!rst_n)
		begin
		tx_data0 <= 1'b0;
		tx_data1 <= 1'b0;
		tx_data2 <= 1'b0;
		end
	else
		begin
		tx_data0 <= mat_row1 | mat_row2 | mat_row3;
		tx_data1 <= mat_row1_1 | mat_row2_1 | mat_row3_1;
		tx_data2 <= mat_row1_2 | mat_row2_2 | mat_row3_2;
		end
end

//Step 2

always@(posedge sclk or negedge rst_n)
begin
	if(!rst_n)
		tx_data <= 1'b0;
	else
		tx_data <= tx_data0 | tx_data1 | tx_data2;
end

always @(posedge sclk or negedge rst_n)
    if(rst_n == 1'b0)
        po_flag             <=          1'b0;
    else if(mat_flag_2 == 1'b1 && mat_flag_4 == 1'b1) 
        po_flag             <=          1'b1;
    else
        po_flag             <=          1'b0;      
        

fifo_3x3 fifo_3x3_inst(
    //System Interfaces
    .sclk                   (sclk                   ),
    .rst_n                  (rst_n                  ),
    //Communication Interfaces
    .rx_data                (rx_data                ),
    .pi_flag                (pi_flag                ),
    .mat_row1               (mat_row1               ),
    .mat_row2               (mat_row2               ),
    .mat_row3               (mat_row3               ),
    .mat_flag               (mat_flag               )

);


endmodule
