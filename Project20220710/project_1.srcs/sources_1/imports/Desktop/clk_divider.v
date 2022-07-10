`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2022 10:04:13 AM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    output clk_div
    );
reg [3:0]count=4'd0;
parameter limit=4'd4;
reg out=0;

assign clk_div=out;

always @(posedge clk)
    begin
    
    if (count>=(limit-1))
        begin
        count<=4'd0;
        out<= ~out;
        end
    
    else
        count <= count+4'd1;
    
    end     

endmodule




