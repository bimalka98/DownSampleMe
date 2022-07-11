`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2022 09:31:09 AM
// Design Name: 
// Module Name: MDR
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


module MDR(
    input clk,
    input w_en,
    input write_en,
    input read_en,
    output reg [27:0] data_out,
    input [27:0] data_in,
    input [7:0] DRam_in,
    output reg [7:0] DRam_out
    );
    
    always @(posedge clk)
    
    begin
        if (w_en==1)
            data_out<=data_in;
            else if (read_en)
            data_out<= {20'b0000000000,DRam_in};
            else if (write_en)
            DRam_out<=data_in[7:0];
        end
                
    
endmodule
