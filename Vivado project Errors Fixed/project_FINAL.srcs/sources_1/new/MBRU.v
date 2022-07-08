`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2022 08:57:34 AM
// Design Name: 
// Module Name: MBRU
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


module MBRU(
    input clk,
    //input clk_devider,
    input fetch,
    input [25:0] instruction_in,
    output reg [7:0] instruction_out,
    output reg [27:0] data_out
    );
    
        
     initial
       begin
            instruction_out = 8'b00000100;
       end
    
    
    always @(posedge clk)
       
        begin
            if (fetch == 1)
            begin
            instruction_out<=instruction_in[25:18];
                                          
             data_out<={10'b0000000000,instruction_in[17:0]};
             
            end
         end
  
  
        
//         always @(posedge clk_devider)
            
//             begin
//                 if (fetch == 1)
//                 begin
                 
//                 end
//              end
endmodule
