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
    output complete1
    );
    
    parameter  control_signal_length=35; //36-1=35
    reg [control_signal_length:0] control_store[88:0];
    reg finish = 1'b0;
    
    //instructions which jumps
    parameter  FETCH3=8'd2;
    
    parameter  JUMPZ1=8'd73;
    parameter  JMPZN1=8'd74;
    parameter  JMPZY1=8'd75;

    parameter  JMPNZ1=8'd77;
    parameter  JMPNZY1=8'd78;
    parameter  JMPNZN1=8'd79;
    

    parameter  NOOP=8'd3;
    parameter  DONE=8'd87;
    
    assign complete1 = finish;
    
    initial
      begin
        control_signals= 36'b00000000_0_0000_00000000000000_000_00_0000; //	Start
      end
        
        
    always@(posedge clk)
        begin
            case(control_signals[35:28])
            FETCH3: 
                begin
                    control_signals={MBRU,control_store[FETCH3][27:0]};                    
                end
            JUMPZ1: 
                begin 
                    if (z_flag==1'b0)
                        control_signals={JMPZN1,control_store[JUMPZ1][27:0]};
                    else
                        control_signals={JMPZY1,control_store[JUMPZ1][27:0]};
                 end         
            JMPNZ1:
                begin 
                    if (z_flag==1'b1)
                        control_signals={JMPNZY1,control_store[JMPNZ1][27:0]};
                    else
                        control_signals={JMPNZN1,control_store[JMPNZ1][27:0]};
                end 
                
             DONE: finish = 1'b1;   //COMPLETE COMMAND 
            
             default: control_signals=control_store[instr_address];
            endcase
         end
            
    initial 
    begin
    
        control_store[0]  = 36'b00000001_0_0000_00010000000000_100_00_0000; //	FETCH1
        control_store[1]  = 36'b00000010_0_0000_00000000000000_000_00_0000; //	FETCH2
        control_store[2]  = 36'bxxxxxxxx_0_0000_00000000000000_000_10_0000; //  FETCH3
        control_store[3]  = 36'b00000000_0_0000_00000000000000_000_00_0000; //	NOOP
        control_store[4]  = 36'b00000000_0_0110_00000000000001_000_00_0000; //	CLAC
        control_store[5]  = 36'b00000110_0_1000_10000000000000_010_00_0000; //	LDAC 1
        control_store[6]  = 36'b00000111_0_0000_00000000000000_000_00_0000; //	LDAC 2
        control_store[7]  = 36'b00001000_0_0000_00000000000000_000_00_0000; //	LDAC 3
        control_store[8]  = 36'b00000000_0_0111_00000000000001_000_00_0010; //	LDAC 4
        control_store[9]  = 36'b00001010_0_0111_10000000000000_010_00_0011; //	LDX1R1 1
        control_store[10] = 36'b00001011_0_0000_00000000000000_000_00_0000; //	LDX1R1 2
        control_store[11] = 36'b00001100_0_0000_00000000000000_000_00_0000; //	LDX1R1 3
        control_store[12] = 36'b00001101_0_0111_00000000000001_000_00_0010; //	LDX1R1 4
        control_store[13] = 36'b00000000_0_1000_00001000000000_000_00_0000; //	LDX1R1 5
        control_store[14] = 36'b00001111_0_0111_10000000000000_010_00_0011; //	LDX2R2 1
        control_store[15] = 36'b00010000_0_0000_00000000000000_000_00_0000; //	LDX2R2 2
        control_store[16] = 36'b00010001_0_0000_00000000000000_000_00_0000; //	LDX2R2 3
        control_store[17] = 36'b00010010_0_0111_00000000000001_000_00_0010; //	LDX2R2 4
        control_store[18] = 36'b00000000_0_1000_00000100000000_000_00_0000; //	LDX2R2 5
        control_store[19] = 36'b00010100_0_0111_10000000000000_010_00_0011; //	LDX3R3 1
        control_store[20] = 36'b00010101_0_0000_00000000000000_000_00_0000; //	LDX3R3 2
        control_store[21] = 36'b00010110_0_0000_00000000000000_000_00_0000; //	LDX3R3 3
        control_store[22] = 36'b00010111_0_0111_00000000000001_000_00_0010; //	LDX3R3 4
        control_store[23] = 36'b00000000_0_1000_00000010000000_000_00_0000; //	LDX3R3 5
        control_store[24] = 36'b00011001_0_0111_10000000000000_010_00_0011; //	LDX12R9 1
        control_store[25] = 36'b00011010_0_0000_00000000000000_000_00_0000; //	LDX12R9 2
        control_store[26] = 36'b00011011_0_0000_00000000000000_000_00_0000; //	LDX12R9 3
        control_store[27] = 36'b00011100_0_0111_00000000000001_000_00_0010; //	LDX12R9 4
        control_store[28] = 36'b00000000_0_1000_00000000000010_000_00_0000; //	LDX12R9 5
        control_store[29] = 36'b00011110_0_0111_10000000000000_010_00_0011; //	LDX4R6 1
        control_store[30] = 36'b00011111_0_0000_00000000000000_000_00_0000; //	LDX4R6 2
        control_store[31] = 36'b00100000_0_0000_00000000000000_000_00_0000; //	LDX4R6 3
        control_store[32] = 36'b00100001_0_0111_00000000000001_000_00_0010; //	LDX4R6 4
        control_store[33] = 36'b00000000_0_1000_00000000010000_000_00_0000; //	LDX4R6 5
        control_store[34] = 36'b00100100_0_0111_00000000000001_000_00_0110; //	SWX5R3 1
        control_store[35] = 36'b00100100_0_0111_00000000000001_000_00_0101; //	SWX12R2 1
        control_store[36] = 36'b00100101_0_0111_10000000000000_000_00_0011; //	SWX5AC 1
        control_store[37] = 36'b00000000_0_1000_01000000000000_001_00_0000; //	SWX5AC 2
        control_store[38] = 36'b00000000_0_1000_01000000000000_001_00_0000; //	STAC
        control_store[39] = 36'b00000000_0_1000_00001000000000_000_00_0000; //	MOVACR1
        control_store[40] = 36'b00000000_0_1000_00000100000000_000_00_0000; //	MOVACR2
        control_store[41] = 36'b00000000_0_1000_00000010000000_000_00_0000; //	MOVACR3
        control_store[42] = 36'b00000000_0_1000_00000001000000_000_00_0000; //	MOVACR4
        control_store[43] = 36'b00000000_0_1000_00000000100000_000_00_0000; //	MOVACR5
        control_store[44] = 36'b00000000_0_1000_00000000010000_000_00_0000; //	MOVACR6
        control_store[45] = 36'b00000000_0_1000_00000000001000_000_00_0000; //	MOVACR7
        control_store[46] = 36'b00000000_0_1000_00000000000100_000_00_0000; //	MOVACR8
        control_store[47] = 36'b00000000_0_1000_00000000000010_000_00_0000; //	MOVACR9
        control_store[48] = 36'b00000000_0_0111_00000000000001_000_00_0100; //	MOVR1AC
        control_store[49] = 36'b00000000_0_0111_00000000000001_000_00_0101; //	MOVR2AC
        control_store[50] = 36'b00000000_0_0111_00000000000001_000_00_0110; //	MOVR3AC
        control_store[51] = 36'b00000000_0_0111_00000000000001_000_00_0111; //	MOVR4AC
        control_store[52] = 36'b00000000_0_0111_00000000000001_000_00_1000; //	MOVR5AC
        control_store[53] = 36'b00000000_0_0111_00000000000001_000_00_1001; //	MOVR6AC
        control_store[54] = 36'b00000000_0_0111_00000000000001_000_00_1010; //	MOVR7AC
        control_store[55] = 36'b00000000_0_0111_00000000000001_000_00_1011; //	MOVR8AC
        control_store[56] = 36'b00000000_0_0111_00000000000001_000_00_1100; //	MOVR9AC
        control_store[57] = 36'b00000000_0_1000_10000000000000_000_00_0000; //	MOVACMAR
        control_store[58] = 36'b00000000_0_1000_01000000000000_001_00_0000; //	MOVACMDR
        control_store[59] = 36'b00000000_0_0001_00000000000001_000_00_0100; //	ADDR1
        control_store[60] = 36'b00000000_0_0001_00000000000001_000_00_0101; //	ADDR2
        control_store[61] = 36'b00000000_0_0001_00000000000001_000_00_0111; //	ADDR4
        control_store[62] = 36'b00000000_0_0001_00000000000001_000_00_1000; //	ADDR5
        control_store[63] = 36'b00000000_0_0001_00000000000001_000_00_1001; //	ADDR6
        control_store[64] = 36'b00000000_0_0001_00000000000001_000_00_1010; //	ADDR7
        control_store[65] = 36'b00000000_0_0010_00000000000001_000_00_0000; //	LSHIFT1
        control_store[66] = 36'b00000000_0_0011_00000000000001_000_00_0000; //	RSHIFT1
        control_store[67] = 36'b00000000_0_0100_00000000000001_000_00_0000; //	LSHIFT8
        control_store[68] = 36'b00000000_0_0000_00000000000000_000_10_0000; //	INCREMENTPC
        control_store[69] = 36'b00000000_0_0000_00000000000000_000_01_0000; //	INCREMENTAC
        control_store[70] = 36'b00000000_0_0101_00000000000001_000_00_0000; //	DECREMENTAC
        control_store[71] = 36'b01001000_0_0111_00000000000001_000_00_0011; //	JUMP1
        control_store[72] = 36'b00000000_1_1000_00100000000000_000_00_0000; //	JUMP2
        control_store[73] = 36'bxxxxxxxx_1_0000_00000000000000_000_00_0000; //	JUMPZ1
        control_store[74] = 36'b00000000_0_0000_00000000000000_000_00_0000; //	JMPZN1 (Z = 0)
        control_store[75] = 36'b01001100_0_0111_00000000000001_000_00_0011; //	JMPZY1 (Z = 1)
        control_store[76] = 36'b00000000_1_1000_00100000000000_000_00_0000; //	JMPZY2 (Z = 1)
        control_store[77] = 36'bxxxxxxxx_1_0000_00000000000000_000_00_0000; //	JMPNZ1
        control_store[78] = 36'b00000000_0_0000_00000000000000_000_00_0000; //	JMPNZY1 (Z = 1)
        control_store[79] = 36'b01010000_0_0111_00000000000001_000_00_0011; //	JMPNZN1 (Z = 0)
        control_store[80] = 36'b01011000_1_1000_00100000000000_000_00_0000; //	JMPNZN2 (Z = 0)
        control_store[81] = 36'b01010010_0_0111_00000000000001_000_00_0011; //  LDIR2 1 
        control_store[82] = 36'b00000000_0_1000_00000100000000_000_00_0000; //  LDIR2 2
        control_store[83] = 36'b01010100_0_0111_00000000000001_000_00_0011; //  LDIR3 1
        control_store[84] = 36'b00000000_0_1000_00000010000000_000_00_0000; //  LDIR3 2   
        control_store[85] = 36'b00000000_0_0111_00001000000000_000_00_0011; //  LDIR1 1
        control_store[86] = 36'b00000000_0_0111_00000000010000_000_00_0011; //  LDIR6 1
        control_store[87] = {36{1'bz}}; // DONE
        control_store[88] = 36'b00000000_0_0110_00000000000001_000_00_0000; //JMPNZN3 (Z = 0)

    end
    
    
    
    
    
    
endmodule
