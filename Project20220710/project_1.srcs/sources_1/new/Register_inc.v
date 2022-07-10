`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 08:18:02 PM
// Design Name: 
// Module Name: Register_inc
// Project Name: CSD
// Target Devices: zed
// Tool Versions: 
// Description: Register with increment
// 
// Dependencies: 
// 
// Revision: v1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register_inc(
    input clk,
    input w_en,
    input inc,
    input [17:0] data_in,
    output reg [17:0] data_out
    );

    
    //register set at posedge clk
    always @(posedge clk)
    begin
        if(w_en == 1)
            data_out<=data_in;
        else if(inc==1)
            data_out <= data_out+1;
    end
        
endmodule
