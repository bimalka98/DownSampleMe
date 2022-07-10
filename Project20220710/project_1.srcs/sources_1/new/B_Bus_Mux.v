`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2022 10:47:55 AM
// Design Name: 
// Module Name: B_Bus_Mux
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


module B_Bus_Mux(
    input clk,
    input [3:0] sel,
    input [27:0] AC,
    input [27:0] MAR,
    input [27:0] MDR,
    input [7:0] PC,
    input [27:0] MBRU,
    input [27:0] R1,
    input [27:0] R2,
    input [27:0] R3,
    input [27:0] R4,
    input [27:0] R5,
    input [27:0] R6,
    input [27:0] R7,
    input [27:0] R8,
    input [27:0] R9,
    output reg [27:0] Bus_Out
    );
    
    always @(sel or MAR or MDR or PC or MBRU or R1 or R2 or R3 or R4 or R5 or R6 or R7 or R8 or R9)
    
        begin
            case(sel)
            4'b0000 : Bus_Out <= AC;
            4'b0001 : Bus_Out <= MAR;
            4'b0010 : Bus_Out <= MDR;
            4'b0011 : Bus_Out <= MBRU;
            4'b0100 : Bus_Out <= R1;
            4'b0101 : Bus_Out <= R2;
            4'b0110 : Bus_Out <= R3;
            4'b0111 : Bus_Out <= R4;
            4'b1000 : Bus_Out <= R5;
            4'b1001 : Bus_Out <= R6;
            4'b1010 : Bus_Out <= R7;
            4'b1011 : Bus_Out <= R8;
            4'b1100 : Bus_Out <= R9;
            4'b1101 : Bus_Out <= {20'b0,PC};
            default : Bus_Out <= 18'b0;
            
            endcase
          end
          
endmodule
