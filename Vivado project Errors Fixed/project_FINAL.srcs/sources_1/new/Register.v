`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 08:12:18 PM
// Design Name: 
// Module Name: Register
// Project Name: CSD processor design 
// Target Devices: zed 
// Tool Versions:
// Description: 
// 
// Dependencies: 
// 
// Revision: v1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register(
    input clk,
    input w_en,
    input [27:0] data_in,
    output reg [27:0] data_out
    );

    
    //register set at posedge clk
    always @(posedge clk)
    begin
        if(w_en == 1)
            data_out<=data_in;
    end
        
endmodule
