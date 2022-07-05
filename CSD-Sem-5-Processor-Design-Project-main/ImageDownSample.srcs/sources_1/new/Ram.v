`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 09:40:18 PM
// Design Name: 
// Module Name: Ram
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


module Ram(                //for data
    input clk,
    input w_en,
    input r_en,
    input [17:0] address,
    input [7:0] data_in,         //maximum value is 256 (8 bits)
    output reg [7:0] data_out
    );
    parameter ram_size=131072; //17 bits
    reg [7:0] ram [ram_size:0];
    
    always @(posedge clk)
    begin
        if (w_en==1)
            ram[address]<=data_in;
        else if(r_en)
            data_out<= ram[address];
          
    end
    
    initial begin
        //ram[0] = pixel value          
        // ram[65536]=8'b00000000     
    
    
      end
endmodule
