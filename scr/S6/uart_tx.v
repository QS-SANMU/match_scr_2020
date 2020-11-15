`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:39 08/05/2020 
// Design Name: 
// Module Name:    uart_tx 
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
module uart_tx(
    input clk,
    input rst,
    input [3:0] tx_num,
    input tx_sel_data,
    input [7:0] data_in,

    output reg data_tx
    );

    always@(posedge clk or negedge rst)
    if(!rst)
        data_tx <= 1'b1;
    else if(tx_sel_data)
        case(tx_num)
            0 : data_tx <= 1'b0;
            1 : data_tx <= data_in[0];
            2 : data_tx <= data_in[1];
            3 : data_tx <= data_in[2];
            4 : data_tx <= data_in[3];
            5 : data_tx <= data_in[4];
            6 : data_tx <= data_in[5];
            7 : data_tx <= data_in[6];
            8 : data_tx <= data_in[7];
            9 : data_tx <= 1'b1;
            default :
                data_tx <= 1'b1;
        endcase



endmodule
