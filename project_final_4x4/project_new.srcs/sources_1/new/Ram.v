`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 09:40:18 PM
// Design Name: 
// Module Name: Ram
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


module Ram#(
  parameter DATA_WIDTH = 8, // maximum 255 
  parameter ADDR_WITDH = 18
)(                
    input clk,
    input w_en,
    input r_en,
    input done,
    input  [(ADDR_WITDH-1):0] address,
    input  [(DATA_WIDTH-1):0] data_in,         //maximum value is 256 (8 bits)
    output [(DATA_WIDTH-1):0] data_out
);
    
    // localparam ram_size=131072; //17 bits
    reg [(DATA_WIDTH-1):0] ram [2**ADDR_WITDH -1: 0];
    reg [(DATA_WIDTH-1):0] read_data;
    reg [17:0] index;
    reg [17:0] index_conv;
    integer f;
    integer g;
       
    always @(posedge clk)
        begin
            if (w_en==1)
                ram[address]<=data_in;                  
    end
        
    always @ (posedge clk)
        begin
            if(r_en == 1)
                read_data<= ram[address];   
    end
        
    assign data_out = read_data; 
    

    always@(posedge clk)
        begin
          if ( done  == 1 )
          begin
              index <= index+1;
              $fwrite(f,"%b\n",ram[index] ); //NOT DRAM < DMEM
              
          end
          if(index == 70003)
              begin
                $fclose(f);
                $finish;
              end
        end
    initial 
    begin
        //E:\Work\ENTC\5 CSD\outputs
        f = $fopen("F:\\output.txt","w"); 
        index = 70000;              //start index
        ram[3]  = 8'bx; // height_count
        ram[4]  = 8'bx; // a: a local variable
        ram[5]  = 8'bx; // b: a local variable
        ram[6]  = 8'bx; // c: a local variable
        ram[7]  = 8'bx; // width_count
        
        // image data: 8 bit single channel image
        ram[20] = 8'b10000000;
        ram[21] = 8'b01100100;
        ram[22] = 8'b01100100;
        ram[23] = 8'b10001100;
        ram[24] = 8'b10010110;
        ram[25] = 8'b01010000;
        ram[26] = 8'b00111100;
        ram[27] = 8'b00110010;
        ram[28] = 8'b00001010;
        ram[29] = 8'b01010000;
        ram[30] = 8'b00110010;
        ram[31] = 8'b01100010;
        ram[32] = 8'b10010110;
        ram[33] = 8'b10110100;
        ram[34] = 8'b11001000;
        ram[35] = 8'b01111101;
        
    end
        
    
    
    
endmodule