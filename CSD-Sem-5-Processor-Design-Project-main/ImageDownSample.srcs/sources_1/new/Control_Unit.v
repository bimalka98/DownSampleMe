`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2022 09:46:05 AM
// Design Name: 
// Module Name: Control_Unit
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




module Control_Unit(
    input clk,
    input en,
    input z_flag,
    input [7:0] instr_address,
    input [7:0] MBRU,
    output reg [35:0] control_signals,
    output complete
    );
    
    parameter  control_signal_length=35; //36-1=35
    reg [control_signal_length:0] control_store[84:0];
    reg finish = 1'b0;
    
    //instructions which jumps
    parameter  FETCH2=8'd1;
    //parameter  JMPZ1=8'd1;
    //parameter  JMPNZ1=8'd1;
    parameter  NOP=8'd3;
    
    assign complete = finish;
    
    initial
        begin
        control_signals=36'b0;
        end
        
        
    always@(posedge clk)
        begin
            case(instr_address)
            FETCH2: 
                begin
                    control_signals={MBRU,control_store[FETCH2][27:0]};                    
                end
            //JMPZ1: 
            // begin 
            //    if (z_flag==0)
            //       control_signals={######,control_store[JMPZ1][27:0]};
            //       else
            //         control_signals={8'd8,control_store[JMPZ1][27:0]};
            // end         
            //JMPNZ1:
            // begin 
            //    if (z_flag==0)
            //       control_signals={######,control_store[JMPNZ1][27:0]};
            //       else
            //         control_signals={8'd11,control_store[JMPNZ1][27:0]};
            // end 
            NOP: finish = 1'b1;   //idling 
            default: control_signals=control_store[instr_address];
            endcase
         end
            
    initial 
    begin
    
    //control_store[0] = 36'b0000_    //FETCH1
    //control_store[1] = 36'b0000_    //FETCH2
    //control_store[0] = 36'b0000_    //FETCH1     
    
    
    end
    
    
    
    
    
    
endmodule
