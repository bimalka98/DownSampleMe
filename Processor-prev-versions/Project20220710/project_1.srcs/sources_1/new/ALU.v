`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 08:46:50 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input enable,
    input clk,
    input [27:0] A,
    input [27:0] B,
    output reg [27:0] out,
    output reg z_flag,
    input [3:0] sel
    );

    parameter ADD = 4'b0001;
    parameter LSHIFT1 = 4'b0010;
    parameter RSHIFT1 = 4'b0011;
    parameter LSHIFT8 = 4'b0100;
    parameter DEAC = 4'b0101;
    parameter RESET = 4'b0110;
    parameter PASS_B = 4'b0111;
    parameter PASS_A = 4'b1000;
    parameter SUB = 4'b1001;
    parameter INCAC = 4'b1011;

    //events performed at positive edge
    
    reg [1:0] state = 2'b0;
    
    initial 
        begin
            out = 24'b0;
            z_flag = 1'b0;
        end
        
    always @(posedge clk)
        if (enable==1'b1)
            begin
            state<=state+1;           
            end    
        
    
    always @(posedge clk)
    begin
        if (state==2'b11)
            begin
                case(sel)
                ADD:
                    out<=A+B;
                SUB:
                    begin
                    out<=A-B;
                    if (out==28'b0)
                        z_flag = 1'b1;
                    else
                        z_flag = 1'b0;
                     end
                PASS_A:
                    out<=A;
                PASS_B:
                    out<=B;
                INCAC:
                    out<=A+1;
                DEAC:
                    out<=A-1;
                LSHIFT1:
                    out<=A<<1;
                LSHIFT8:
                    out<=A<<8;   
                RSHIFT1:
                    out<=A>>1;
                RESET:
                    out<=24'b0;
                default:
                    out<=24'b0;
                    
                    
                endcase 
             end      
    end    
endmodule
