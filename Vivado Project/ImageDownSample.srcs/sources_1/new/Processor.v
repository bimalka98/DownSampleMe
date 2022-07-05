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
output wire [35:0] control_signals;
output wire [7:0] instruction_out;
output wire [27:0] data_out;   
output wire [17:0] data_addr; 
output wire [7:0] DRam_out; 

wire z_flag,complete,fetch,w_en,write_en,read_en,inc;
wire [7:0] instr_address;
wire [7:0] MBRU;
wire [35:0] control_signals;
wire [27:0] data_in,MBRU_out;
wire [7:0] instruction_address;
wire [25:0] instruction_in;
wire [7:0] DRam_in;  
    
//Control_Unit C1(clk,en,z_flag,instr_address,MBRU,control_signals,complete);
Control_Unit CU(.clk(clk),.en(en),.z_flag(z_flag),.instr_address(instr_address),.MBRU(MBRU),.control_signals(control_signals),.complete(complete));

//MBRU MBRU1(.clk(clk),fetch,control_signals[18],instruction_in,MBRU,MBRU_out);
MBRU MBRU(.clk(clk),.fetch(fetch),.instruction_in(instruction_in),.instruction_out(instruction_out),.data_out(data_out));

MAR MAR(.clk(clk),.w_en(w_en),.data_out(data_out),.data_in(data_in),.data_addr(data_addr));

MDR MDR(.clk(clk),.w_en(w_en),.write_en(write_en),.read_en(read_en),.data_out(data_out),.data_in(data_in),.DRam_in(DRam_in),.DRam_out(DRam_out));

Accumilator ACC(.clk(clk),.data_in(data_in),.data_out(data_out),.inc(inc),.w_en(w_en));

ALU ALU(.clk(clk),);

ProgamCounter PC(.clk(clk),.en(en),.w_en(w_en),.complete(complete),.inc(inc),.data_in(data_in),.instruction_address(instruction_address));



ProgamCounter PC(clk,en,control_signals[6],complete,control_signals[8],data_in,instruction_address );

endmodule

module ALU(
    input clk,
    input [27:0] A,
    input [27:0] B,
    output reg [27:0] out,
    output reg z_flag,
    input [3:0] sel
    );