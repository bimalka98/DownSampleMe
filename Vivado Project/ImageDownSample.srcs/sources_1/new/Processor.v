`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2022 04:02:50 PM
// Design Name: 
// Module Name: Processor
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


module Processor(
    input en,
    input clk,
    output [17:0] data_addr; 
    );

    // used in Instruction_Ram
    wire [7:0] instruction_address;
    wire [25:0] instruction_out_memory;
    
    // used in Control Unit
    wire z_flag,complete;
    wire [7:0] instruction_out_MBRU;
    wire [35:0] control_signals;
    
    // used in MBRU
    wire [27:0] data_out;

    // used in MAR
    wire [27:0] mar_out;
    wire [27:0] mar_in;
    

    output wire [7:0] instruction_out;
       
    
    output wire [7:0] DRam_out; 

    wire fetch,w_en,write_en,read_en,inc;
    wire [7:0] instr_address;
    
    
    wire [27:0] data_in,MBRU_out;
    
    
    wire [7:0] DRam_in;  

    // INSTRUCTION RAM

    module Instruction_Ram(
    input clk,
    input [7:0] address,
    output reg [25:0] instr_out
    );

    Instruction_Ram IRAM(
        .clk(clk),      // input clk
        .address(instruction_address)           // to be initialized [7:0] address
        .instr_out(instruction_out_memory)      // to be initialized reg [25:0] instr_out
    );


    //Control_Unit C1(clk,en,z_flag,instr_address,MBRU,control_signals,complete);
    Control_Unit CU(
        .clk(clk),
        .en(en),
        .z_flag(z_flag),
        .instr_address(control_signals[35:28]), // from bits 35 to 28(inclusive)
        .MBRU(instruction_out_MBRU),
        .control_signals(control_signals),
        .complete(complete)
    );

    //MBRU MBRU1(.clk(clk),fetch,control_signals[18],instruction_in,MBRU,MBRU_out);
    MBRU MBRU(
        .clk(clk),
        .fetch(control_signals[8]),
        .instruction_in(instruction_out_memory),
        .instruction_out(instruction_out_MBRU),
        .data_out(data_out)
    );

    MAR MAR(
        .clk(clk),
        .w_en(w_en),
        .data_out(mar_out),
        .data_in(data_in),
        .data_addr(data_addr)
    );

    MDR MDR(
        .clk(clk),
        .w_en(w_en),
        .write_en(write_en),
        .read_en(read_en),
        .data_out(data_out),
        .data_in(data_in),
        .DRam_in(DRam_in),
        .DRam_out(DRam_out)
    );

    Accumilator ACC(
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .inc(inc),
        .w_en(w_en)
    );

    ALU ALU(
        .clk(clk),
    );

    ProgamCounter PC(
        .clk(clk),
        .en(en),
        .w_en(w_en),
        .complete(complete),
        .inc(inc),
        .data_in(data_in),
        .instruction_address(instruction_address)
    );

endmodule