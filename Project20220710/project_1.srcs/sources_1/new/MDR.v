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
    input enable,
    input w_en,
    input write_en,
    input read_en,
    output reg [27:0] data_out,
    input [27:0] data_in,
    input [7:0] DRam_in,
    output reg [7:0] DRam_out
    );
    
    
    reg [1:0] state = 2'b0;
    always @(posedge clk)
        if (enable==1'b1)
            begin
            state<=state+1;           
            end    
            
    
    always @(posedge clk)
    begin
        if (state==2'b10)
            begin
                if (w_en==1)
                    begin
                    data_out<=data_in;
                    end
                if (read_en)
                    begin
                    data_out<= {20'd0,DRam_in};
                    end
                if (write_en)
                    begin
                    DRam_out<=data_in[7:0];
                    end
                end
    end            
    
endmodule
