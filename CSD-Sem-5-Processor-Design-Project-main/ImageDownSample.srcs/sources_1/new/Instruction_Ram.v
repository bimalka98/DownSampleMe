`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 10:06:57 PM
// Design Name: 
// Module Name: Instruction_Ram
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


module Instruction_Ram(
    input clk,
    input [7:0] address,
    output reg [25:0] instr_out
    );
    parameter inst_count = 200;
    reg [25:0] inst_ram [inst_count:0];
    
    
    //define instructions
    parameter FETCH = 8'd0;
    parameter NOOP = 8'd3;
    parameter LDX1R1 = 8'd9;
    
    initial begin
        //inst_ram[0] = instruction  //put instructions 174
                       //{opcode(8bits),immediate_data(18bits)}
        inst_ram[0] = {FETCH,18'b0}; //AC <— 0 
        inst_ram[1] = {NOOP,18'b0}; //MAR <— AC 
        //inst_ram[2] = {LDX1R1,18'b000000000011111111/18'd255}     X1=255
    
    
      end
    
    always @(posedge clk)
    begin 
        instr_out<= inst_ram[address];
    
    end
    
    
endmodule
