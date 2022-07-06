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
    input [7:0] DRam_in,
    output [17:0] data_addr,
    output [7:0]  DRam_out
    
    );

    // used in Instruction_Ram
    wire [7:0] instruction_address;
    wire [25:0] instruction_out_memory;
    
    // used in Control Unit
    wire z_flag,complete;
    wire [7:0] instruction_out_MBRU;
    wire [35:0] control_signals;
    
    // used in MBRU
    wire [27:0] mbru_out;

    // used in MAR
    wire [27:0] mar_out;
    wire [27:0] B_bus;
    wire [27:0] C_bus;
    
    wire [27:0] R1_bus;
    wire [27:0] R2_bus;
    wire [27:0] R3_bus;
    wire [27:0] R4_bus;
    wire [27:0] R5_bus;
    wire [27:0] R6_bus;
    wire [27:0] R7_bus;
    wire [27:0] R8_bus;
    wire [27:0] R9_bus;
    // used in Accumulator
    wire [27:0] A_bus;

    // used in mdr
    wire [27:0] mdr_out;    

    output wire [7:0] instruction_out;
       

    wire fetch,w_en,write_en,read_en,inc;
    wire [7:0] instr_address;
    
    
    wire [27:0] data_in;

    // INSTRUCTION RAM
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
        .data_out(mbru_out)
    );

    MAR MAR(
        .clk(clk),
        .w_en(control_signals[22]),
        .data_out(mar_out),
        .data_in(C_bus),
        .data_addr(data_addr)
    );

    MDR MDR(
        .clk(clk),
        .w_en(control_signals[21]),
        .write_en(control_signals[6]),
        .read_en(control_signals[7]),
        .data_out(mdr_out),
        .data_in(C_bus),
        .DRam_in(DRam_in),
        .DRam_out(DRam_out)
    );

    Accumilator ACC(
        .clk(clk),
        .data_in(C_bus),
        .data_out(A_bus),
        .inc(control_signals[4]),
        .w_en(control_signals[9])
    );

    ALU ALU(
        .clk(clk),
        .A(A_bus),
        .B(B_bus),
        .out(C_bus),
        .z_flag(z_flag),
        .sel(control_signals[26:23])
    );

    Register R1(
        .clk(clk),
        .w_en(control_signals[18]),
        .data_in(C_bus),
        .data_out(R1_bus)
    );

    Register R2(
        .clk(clk),
        .w_en(control_signals[17]),
        .data_in(C_bus),
        .data_out(R2_bus)
    );

    Register R3(
        .clk(clk),
        .w_en(control_signals[16]),
        .data_in(C_bus),
        .data_out(R3_bus)
    );

    Register R4(
        .clk(clk),
        .w_en(control_signals[15]),
        .data_in(C_bus),
        .data_out(R4_bus)
    );

    Register R5(
        .clk(clk),
        .w_en(control_signals[14]),
        .data_in(C_bus),
        .data_out(R5_bus)
    );

    Register R6(
        .clk(clk),
        .w_en(control_signals[13]),
        .data_in(C_bus),
        .data_out(R6_bus)
    );

    Register R7(
        .clk(clk),
        .w_en(control_signals[12]),
        .data_in(C_bus),
        .data_out(R7_bus)
    );

    Register R8(
        .clk(clk),
        .w_en(control_signals[11]),
        .data_in(C_bus),
        .data_out(R8_bus)
    );

    Register R9(
        .clk(clk),
        .w_en(control_signals[10]),
        .data_in(C_bus),
        .data_out(R9_bus)
    );

    ProgamCounter PC(
        .clk(clk),
        .en(en),
        .w_en(control_signals[20]),
        .complete(complete),
        .inc(control_signals[5]),
        .data_in(C_bus),
        .instruction_address(instruction_address)  
        // .PC_out(pc_out)
    );

    B_Bus_Mux MUX(
        .clk(clk),
        .sel(control_signals[3:0]),
        .AC(A_bus),
        .MAR(mar_out),
        .MDR(mdr_out),
        .PC(instruction_address), //.PC(pc_out)
    //input [8:0] PC,??[7:0??]
        .MBRU(mbru_out),
        .R1(R1_bus),
        .R2(R2_bus),
        .R3(R3_bus),
        .R4(R4_bus),
        .R5(R5_bus),
        .R6(R6_bus),
        .R7(R7_bus),
        .R8(R8_bus),
        .R9(R9_bus),
        .Bus_Out(B_bus)
    );

    Ram RAM(
        .clk(clk),
        .w_en(control_signals[]),
        .r_en(),
        input [17:0] address,
        input [7:0] data_in,         //maximum value is 256 (8 bits)
        output reg [7:0] data_out
    );

endmodule
