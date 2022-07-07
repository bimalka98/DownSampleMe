`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/30/2022 08:12:18 PM
// Design Name: 
// Module Name: Register
// Project Name: CSD processor design 
// Target Devices: zed 
// Tool Versions:
// Description: 
// 
// Dependencies: 
// 
// Revision: v1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register #(
    parameter REG_WIDTH = 28
)(
    input clk,
    input w_en,
    input  [(REG_WIDTH-1):0] data_in,
    output [(REG_WIDTH-1):0] data_out
    );

    reg [(REG_WIDTH-1):0] data_opt;
    
    assign data_out = data_opt;

    //register set at posedge clk
    always @(posedge clk)
    begin
        if(w_en == 1)
            data_opt<=data_in;
    end
        
endmodule
