`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:35 10/18/2020 
// Design Name: 
// Module Name:    key_debounce 
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
module key_debounce(
    input clk,
    input rst,
    input key_in,
    output reg key_flag_n,
    output reg key_flag_p,
    output  key_state_out
    );

    parameter idle         = 3'b000,
              debounce_n   = 3'b001,
              down         = 3'b010,
              debounce_p   = 3'b100; 

    reg in_1,in_2;
	
	wire key_in_temp;
	
	assign key_in_temp = ~key_in;

    always@(posedge clk or negedge rst)
    if(!rst)
        begin
            in_1 <= 1'b1;
            in_2 <= 1'b1;
        end
    else
        begin
            in_1 <= key_in_temp;
            in_2 <= in_1;
        end
    
    wire pose,nege;

    assign pose = (!in_2) && in_1;
    assign nege = in_2 && (!in_1);

    reg [19:0] cnt;
    reg en;
    parameter cnt_end = 20'd1_000_000 - 1'b1;

    always@(posedge clk or negedge rst)
    if(!rst)
        cnt <= 'd0;
    else if(en)
        cnt <= cnt + 1'b1;
    else
        cnt <= 'd0;


    reg [2:0] state;
	reg key_state;

    always@(posedge clk or negedge rst)
    if(!rst)
        begin
            state = idle;
            en <= 0;
            key_flag_n <= 0;
            key_flag_p <= 0;
            key_state <= 1;
        end
    else
        case(state)
            idle : begin
                        en <= 0;
                        key_flag_n <= 0;
                        key_flag_p <= 0;
                        key_state <= 1;
                        if(nege)
                            begin
                                en <= 1;
                                state = debounce_n;
                            end
                        else
                            state = state;
                    end
            debounce_n :
                    begin
                        if(cnt == cnt_end)
                            begin
                                en <= 0;
                                key_state <= 0;
                                key_flag_n <= 1;
                                key_flag_p <= 0; 
                                state = down;                               
                            end
                        else if(pose)
                            begin
                                en <= 0;
                                state = idle;                            
                            end
                        else
                            state = state;
                    end
            down :
                    begin
                        key_flag_n <= 0;
                        key_flag_p <= 0;  
                        if(pose)
                            begin
                                state = debounce_p;
                                en <= 1;    
                            end  
                        else
                            state = state;            
                    end
            debounce_p :
                    begin
                        if(cnt == cnt_end)
                            begin
                                en <= 0;
                                key_state <= 1;
                                key_flag_n <= 0;
                                key_flag_p <= 1; 
                                 state = idle;                               
                            end
                        else if(nege)
                            begin
                                state = down;
                                en <= 0;
                            end
                        else
                            state = state;
                    end
            default :       state = idle;
        endcase

	
	assign key_state_out = ~key_state;
    

endmodule
