`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bimalka Piyaruwan
// 
// Create Date: 07/06/2022 07:53:46 PM
// Design Name: 
// Module Name: Register_tb
// Project Name: DownSampleMe
// Target Devices: 
// Tool Versions: 
// Description: Test bench for Register.v
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: https://github.com/bimalka98/Hardware-Description-Languages/blob/master/HDLs/week_4.md#test-benchestest-fixture-or-test-harness-in-verilog
// 
//////////////////////////////////////////////////////////////////////////////////


module Register_tb(); // no sensitivity list for test benches

// parameter declaration
parameter T = 20;    // clock period in nano seconds
parameter REG_WIDTH = 28;

// signal declaration
reg clock = 1'b0;
reg write_en = 1'b0;
reg [(REG_WIDTH-1):0] data_ip;
wire [(REG_WIDTH-1):0] data_op;

Register DUT(
    .clk(clock),
    .w_en(write_en),
    .data_in(data_ip),
    .data_out(data_op)
);

// -----------------------------------------------------------------
// External Device Simulation Processes
// clock driver continuously executed during simulation
always
    begin
        clock = 1'b1; 
        #(T/2);
        clock = 1'b0;
        #(T/2);
    end

initial
    begin
        #0      write_en = 0; data_ip = 28'd0;
        #(T/2)  write_en = 1; data_ip = 28'd1;
        #(T/2) write_en = 1; data_ip = 28'd2;
        #(T/2) write_en = 0; data_ip = 28'd3;
        #(T/2) write_en = 1; data_ip = 28'd4;
    end

// ----------------------------------------------------------------
    // Test Results
    initial
    $monitor("time=%d, w_en=%b, data_out=%b", $time, write_en, data_op);

endmodule
