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
    parameter FETCH         =   8'd0;
    parameter NOOP          =   8'd3;
    parameter CLAC          =   8'd4;
    parameter LDAC          =   8'd5;
    parameter LDX1R1        =   8'd9;
    parameter LDX2R2        =   8'd14;
    parameter LDX3R3        =   8'd19;
    parameter LDXXR9        =   8'd24;
    parameter LDX4R6        =   8'd29;
    parameter SWX5R3        =   8'd34;
    parameter SWX12R2       =   8'd35;
    parameter SWXXAC        =   8'd36;
    parameter STAC          =   8'd38;
    parameter MOVACR1       =   8'd39;
    parameter MOVACR2       =   8'd40;
    parameter MOVACR3       =   8'd41;
    parameter MOVACR4       =   8'd42;
    parameter MOVACR5       =   8'd43;
    parameter MOVACR6       =   8'd44;
    parameter MOVACR7       =   8'd45;
    parameter MOVACR8       =   8'd46;
    parameter MOVACR9       =   8'd47;
    parameter MOVR1AC       =   8'd48;
    parameter MOVR2AC       =   8'd49;
    parameter MOVR3AC       =   8'd50;
    parameter MOVR4AC       =   8'd51;
    parameter MOVR5AC       =   8'd52;
    parameter MOVR6AC       =   8'd53;
    parameter MOVR7AC       =   8'd54;
    parameter MOVR8AC       =   8'd55;
    parameter MOVR9AC       =   8'd56;
    parameter MOVACMAR      =   8'd57;
    parameter MOVACMDR      =   8'd58;
    parameter ADDR1         =   8'd59;
    parameter ADDR2         =   8'd60;
    parameter ADDR4         =   8'd61;
    parameter ADDR5         =   8'd62;
    parameter ADDR6         =   8'd63;
    parameter ADDR7         =   8'd64;
    parameter LSHIFT1       =   8'd65;
    parameter RSHIFT1       =   8'd66;
    parameter LSHIFT8       =   8'd67;
    parameter INCREMENTPC   =   8'd68;
    parameter INCREMENTAC   =   8'd69;
    parameter DECREMENTAC   =   8'd70;
    parameter JUMP          =   8'd71;
    parameter JMPZ          =   8'd73;
    parameter JMPNZ         =   8'd77;
    
    initial begin
        //inst_ram[0] = instruction  //put instructions 174
                       //{opcode(8bits),immediate_data(18bits)}
        inst_ram[0] = {FETCH,18'b0}; //AC <� 0 
        inst_ram[1] = {NOOP,18'b0}; //MAR <� AC 
        //inst_ram[2] = {LDX1R1,18'b000000000011111111/18'd255}     X1=255
    
    
      end
    
    always @(posedge clk)
    begin 
        instr_out<= inst_ram[address];
    
    end
    
    
endmodule
