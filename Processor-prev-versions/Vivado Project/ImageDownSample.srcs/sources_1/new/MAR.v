`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2022 09:42:04 AM
// Design Name: 
// Module Name: MAR
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


module MAR(
    input clk,
    input w_en,
    output reg [27:0] data_out,
    input [27:0] data_in,
    output reg [17:0] data_addr
    );
     always @(posedge clk)
        begin
            if (w_en==1)
                data_addr<=data_in[17:0];
                data_out<=data_in;
        end
    
endmodule
