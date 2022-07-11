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
    parameter LDIR2         =   8'd81;
    parameter LDIR3         =   8'd83;
    parameter LDIR1         =   8'd85;
    parameter LDIR6         =   8'd86;
    parameter DONE          =   8'd87; // completion of the downsampling


    
    initial 
    begin
        inst_ram[0]     = {FETCH,   18'd0};
        inst_ram[1]     = {CLAC,    18'd0};
        inst_ram[2]     = {LDIR1,  18'd20}; // start of original image
        inst_ram[3]     = {LDIR2,  18'd128}; // image width as an immediate data
        inst_ram[4]     = {LDIR3,  18'd128}; // image height as an immediate data
        inst_ram[5]     = {SWX5R3,  18'd3};
        inst_ram[6]     = {CLAC,    18'd0};
        inst_ram[7]     = {MOVACR4, 18'd0};
        inst_ram[8]     = {MOVACR5, 18'd0};
        inst_ram[9]     = {MOVACR6, 18'd0};
        inst_ram[10]    = {MOVR4AC, 18'd0};
        inst_ram[11]    = {LSHIFT8, 18'd0};
        inst_ram[12]    = {ADDR5,   18'd0};
        inst_ram[13]    = {ADDR1,   18'd0};
        inst_ram[14]    = {LDAC,    18'd0};
        inst_ram[15]    = {LSHIFT1, 18'd0};
        inst_ram[16]    = {MOVACR7, 18'd0};
        inst_ram[17]    = {MOVR2AC, 18'd0};
        inst_ram[18]    = {DECREMENTAC, 18'd0};
        inst_ram[19]    = {SWXXAC, 18'd7};
        inst_ram[20]    = {MOVR4AC, 18'd0};
        inst_ram[21]    = {LSHIFT8, 18'd0};
        inst_ram[22]    = {ADDR5, 18'd0};
        inst_ram[23]    = {INCREMENTAC, 18'd0};
        inst_ram[24]    = {ADDR1, 18'd0};
        inst_ram[25]    = {LDAC, 18'd0};
        inst_ram[26]    = {MOVACR8, 18'd0};
        inst_ram[27]    = {ADDR7, 18'd0};
        inst_ram[28]    = {ADDR6, 18'd0};
        inst_ram[29]    = {RSHIFT1, 18'd0};
        inst_ram[30]    = {RSHIFT1, 18'd0};
        inst_ram[31]    = {MOVACR9, 18'd0};
        inst_ram[32]    = {MOVR4AC, 18'd0};
        inst_ram[33]    = {LSHIFT8, 18'd0};
        inst_ram[34]    = {ADDR5, 18'd0};
        inst_ram[35]    = {ADDR1, 18'd0};
        inst_ram[36]    = {MOVACMAR, 18'd0};
        inst_ram[37]    = {MOVR9AC, 18'd0};
        inst_ram[38]    = {MOVACMDR, 18'd0};
        inst_ram[39]    = {MOVR7AC, 18'd0};
        inst_ram[40]    = {RSHIFT1, 18'd0};
        inst_ram[41]    = {MOVACR6, 18'd0};
        inst_ram[42]    = {MOVR8AC, 18'd0};
        inst_ram[43]    = {LSHIFT1, 18'd0};
        inst_ram[44]    = {MOVACR7, 18'd0};
        inst_ram[45]    = {MOVR5AC, 18'd0};
        inst_ram[46]    = {INCREMENTAC, 18'd0};
        inst_ram[47]    = {MOVACR5, 18'd0};
        inst_ram[48]    = {LDXXR9, 18'd7};
        inst_ram[49]    = {MOVR9AC, 18'd0};
        inst_ram[50]    = {DECREMENTAC, 18'd0};
        inst_ram[51]    = {STAC, 18'd0};
        inst_ram[52]    = {JMPNZ, 18'd20}; // double check this
        inst_ram[53]    = {CLAC, 18'd0};
        inst_ram[54]    = {ADDR7, 18'd0};
        inst_ram[55]    = {ADDR6, 18'd0};
        inst_ram[56]    = {RSHIFT1, 18'd0};
        inst_ram[57]    = {RSHIFT1, 18'd0};
        inst_ram[58]    = {MOVACR9, 18'd0};
        inst_ram[59]    = {MOVR4AC, 18'd0};
        inst_ram[60]    = {LSHIFT8, 18'd0};
        inst_ram[61]    = {ADDR5,   18'd0};
        inst_ram[62]    = {ADDR1, 18'd0};
        inst_ram[63]    = {MOVACMAR, 18'd0};
        inst_ram[64]    = {MOVR9AC, 18'd0};
        inst_ram[65]    = {MOVACMDR, 18'd0};
        inst_ram[66]    = {MOVR4AC, 18'd0};
        inst_ram[67]    = {INCREMENTAC, 18'd0};
        inst_ram[68]    = {MOVACR4, 18'd0};
        inst_ram[69]    = {LDXXR9, 18'd3};
        inst_ram[70]    = {MOVR9AC, 18'd0};
        inst_ram[71]    = {DECREMENTAC, 18'd0};
        inst_ram[72]    = {STAC, 18'd0};
        inst_ram[73]    = {JMPNZ, 18'd8}; // double check this
        inst_ram[74]    = {SWX12R2, 18'd7};
        inst_ram[75]    = {CLAC, 18'd0};
        inst_ram[76]    = {MOVACR5, 18'd0};
        inst_ram[77]    = {MOVACR4, 18'd0};
        inst_ram[78]    = {MOVACR6, 18'd0};
        inst_ram[79]    = {MOVR4AC, 18'd0};
        inst_ram[80]    = {LSHIFT8, 18'd0};
        inst_ram[81]    = {ADDR5, 18'd0};
        inst_ram[82]    = {ADDR1, 18'd0};
        inst_ram[83]    = {LDAC, 18'd0};
        inst_ram[84]    = {LSHIFT1, 18'd0};
        inst_ram[85]    = {MOVACR7, 18'd0};
        inst_ram[86]    = {MOVR3AC, 18'd0};
        inst_ram[87]    = {DECREMENTAC, 18'd0};
        inst_ram[88]    = {SWXXAC, 18'd3};
        inst_ram[89]    = {MOVR4AC, 18'd0};
        inst_ram[90]    = {LSHIFT8, 18'd0};
        inst_ram[91]    = {ADDR5,   18'd0};
        inst_ram[92]    = {ADDR2, 18'd0};
        inst_ram[93]    = {ADDR1, 18'd0};
        inst_ram[94]    = {LDAC, 18'd0};
        inst_ram[95]    = {MOVACR8, 18'd0};
        inst_ram[96]    = {ADDR7, 18'd0};
        inst_ram[97]    = {ADDR6, 18'd0};
        inst_ram[98]    = {RSHIFT1, 18'd0};
        inst_ram[99]    = {RSHIFT1, 18'd0};
        inst_ram[100]   = {MOVACR9, 18'd0};
        inst_ram[101]   = {MOVR4AC, 18'd0};
        inst_ram[102]   = {LSHIFT8, 18'd0};
        inst_ram[103]   = {ADDR5, 18'd0};
        inst_ram[104]   = {ADDR1, 18'd0};
        inst_ram[105]   = {MOVACMAR, 18'd0};
        inst_ram[106]   = {MOVR9AC, 18'd0};
        inst_ram[107]   = {MOVACMDR, 18'd0};
        inst_ram[108]   = {MOVR7AC, 18'd0};
        inst_ram[109]   = {RSHIFT1, 18'd0};
        inst_ram[110]   = {MOVACR6, 18'd0};
        inst_ram[111]   = {MOVR8AC, 18'd0};
        inst_ram[112]   = {LSHIFT1, 18'd0};
        inst_ram[113]   = {MOVACR7, 18'd0};
        inst_ram[114]   = {MOVR4AC, 18'd0};
        inst_ram[115]   = {INCREMENTAC, 18'd0};
        inst_ram[116]   = {MOVACR4, 18'd0};
        inst_ram[117]   = {LDXXR9, 18'd3};
        inst_ram[118]   = {MOVR9AC, 18'd0};
        inst_ram[119]   = {DECREMENTAC, 18'd0};
        inst_ram[120]   = {STAC, 18'd0};
        inst_ram[121]   = {JMPNZ, 18'd89};
        inst_ram[122]   = {CLAC, 18'd0};
        inst_ram[123]   = {ADDR7, 18'd0};
        inst_ram[124]   = {ADDR6, 18'd0};
        inst_ram[125]   = {RSHIFT1, 18'd0};
        inst_ram[126]   = {RSHIFT1, 18'd0};
        inst_ram[127]   = {MOVACR9, 18'd0};
        inst_ram[128]   = {MOVR4AC, 18'd0};
        inst_ram[129]   = {LSHIFT8, 18'd0};
        inst_ram[130]   = {ADDR5,   18'd0};
        inst_ram[131]   = {ADDR1, 18'd0};
        inst_ram[132]   = {MOVACMAR, 18'd0};
        inst_ram[133]   = {MOVR9AC, 18'd0};
        inst_ram[134]   = {MOVACMDR, 18'd0};
        inst_ram[135]   = {MOVR5AC, 18'd0};
        inst_ram[136]   = {INCREMENTAC, 18'd0};
        inst_ram[137]   = {MOVACR5, 18'd0};
        inst_ram[138]   = {LDXXR9, 18'd7};
        inst_ram[139]   = {MOVR9AC, 18'd0};
        inst_ram[140]   = {DECREMENTAC, 18'd0};
        inst_ram[141]   = {STAC, 18'd0};
        inst_ram[142]   = {JMPNZ, 18'd77};
        inst_ram[143]   = {LDIR6, 18'd70000}; // start of downsampled image
        inst_ram[144]   = {MOVR3AC, 18'd0};
        inst_ram[145]   = {RSHIFT1, 18'd0};
        inst_ram[146]   = {SWXXAC, 18'd3};
        inst_ram[147]   = {CLAC, 18'd0};
        inst_ram[148]   = {MOVACR4, 18'd0};
        inst_ram[149]   = {MOVACR5, 18'd0};
        inst_ram[150]   = {MOVR2AC, 18'd0};
        inst_ram[151]   = {RSHIFT1, 18'd0};
        inst_ram[152]   = {SWXXAC, 18'd7};
        inst_ram[153]   = {MOVR5AC, 18'd0};
        inst_ram[154]   = {LSHIFT8, 18'd0};
        inst_ram[155]   = {ADDR4, 18'd0};
        inst_ram[156]   = {LSHIFT1, 18'd0};
        inst_ram[157]   = {ADDR1, 18'd0};
        inst_ram[158]   = {LDAC, 18'd0};
        inst_ram[159]   = {MOVACR9, 18'd0};
        inst_ram[160]   = {MOVR6AC, 18'd0};
        inst_ram[161]   = {MOVACMAR, 18'd0};
        inst_ram[162]   = {INCREMENTAC, 18'd0};
        inst_ram[163]   = {MOVACR6,   18'd0};
        inst_ram[164]   = {MOVR9AC, 18'd0};
        inst_ram[165]   = {MOVACMDR, 18'd0};
        inst_ram[166]   = {MOVR5AC, 18'd0};
        inst_ram[167]   = {INCREMENTAC, 18'd0};
        inst_ram[168]   = {MOVACR5, 18'd0};
        inst_ram[169]   = {LDXXR9, 18'd7};
        inst_ram[170]   = {MOVR9AC, 18'd0};
        inst_ram[171]   = {DECREMENTAC, 18'd0};
        inst_ram[172]   = {STAC, 18'd0};
        inst_ram[173]   = {JMPNZ, 18'd153};
        inst_ram[174]   = {MOVR4AC, 18'd0};
        inst_ram[175]   = {INCREMENTAC, 18'd0};
        inst_ram[176]   = {MOVACR4, 18'd0};
        inst_ram[177]   = {LDXXR9, 18'd3};
        inst_ram[178]   = {MOVR9AC, 18'd0};
        inst_ram[179]   = {DECREMENTAC, 18'd0};
        inst_ram[180]   = {STAC, 18'd0};
        inst_ram[181]   = {JMPNZ, 18'd149};
        inst_ram[182]   = {NOOP, 18'd0};
        inst_ram[183]   = {DONE, 18'd0}; 
    
    end
    
    always @(posedge clk)
    begin 
        instr_out<= inst_ram[address];
    
    end
    
    
endmodule
