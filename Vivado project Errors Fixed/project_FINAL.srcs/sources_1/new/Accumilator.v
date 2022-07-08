`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 09:18:03 PM
// Design Name: 
// Module Name: Accumilator
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


module Accumilator(
    input clk,
    input [27:0] data_in,
    output reg [27:0] data_out,
    input inc,
    input w_en
    );
    
    //events done at pose edge 
    always @(posedge clk)
    begin
        if (inc==1)
            data_out<= data_out+1;
        else if (w_en==1)
            data_out<= data_in;

    end
endmodule
