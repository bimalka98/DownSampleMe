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
    input clk
    );
wire z_flag,complete;
wire [7:0] instr_address;
wire [7:0] MBRU;
wire [35:0] control_signals;
wire [27:0] data_in,MBRU_out;
wire [7:0] instruction_address;
wire [25:0] instruction_in;
  
    
Control_Unit C1(clk,en,z_flag,instr_address,MBRU,control_signals,complete);

MBRU MBRU1(clk,control_signals[18],instruction_in,MBRU,MBRU_out);

ProgamCounter PC(clk,en,control_signals[6],complete,control_signals[8],data_in,instruction_address );

endmodule
