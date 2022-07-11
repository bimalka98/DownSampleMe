`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2022 09:26:42 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    reg clk;
    reg enable;
    
    Processor Processor_DUT(
    .en(enable),
    .clk(clk)    
    );
    
    //clk generation
    initial 
        begin
            clk = 1'b0;
            forever #1 clk = ~clk;
        end


     //enabling processor 
       // Generate the reset

    initial 
        begin
            enable = 1'b0;
            #10
            forever #1 enable = 1'b1;
            
        end
   
endmodule
