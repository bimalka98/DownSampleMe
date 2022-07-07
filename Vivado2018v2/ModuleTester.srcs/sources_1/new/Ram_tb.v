`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bimalka Piyaruwan
// 
// Create Date: 07/06/2022 07:49:17 PM
// Design Name: 
// Module Name: Ram_tb
// Project Name: DownSampleMe
// Target Devices: 
// Tool Versions: 
// Description: Test bench for Ram.v
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: https://github.com/bimalka98/Hardware-Description-Languages/blob/master/HDLs/week_4.md#test-benchestest-fixture-or-test-harness-in-verilog
// 
//////////////////////////////////////////////////////////////////////////////////


module Ram_tb(); // no sensitivity list for test benches

    //constant declarations   
    parameter T = 20;    // clock period in nano seconds
    parameter DATA_WIDTH = 8; // maximum 255 
    parameter ADDR_WITDH = 18;

    // signal declaration
    reg clock = 1'b0;
    reg write_en = 1'b0, read_en = 1'b1;      // enable signal stimulus
    reg [(ADDR_WITDH-1):0]  address18b;      // ram address stimulus
    reg [(DATA_WIDTH-1):0] data_ip = 8'b0000_0000;   // data input stimulus
    wire [(DATA_WIDTH-1):0] data_op;  // data output stimulus

    // component instantiation: instantiate the device under test (DUT)
    Ram DUT(
        .clk(clock),
        .w_en(write_en),
        .r_en(read_en),
        .address(address18b),
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

    // ----------------------------------------------------------------
    // Test Process
    integer mem_location;
    initial begin
        #(200);    
        // memory read Verification
        for(mem_location = 20; mem_location <30; mem_location = mem_location + 1) begin
            address18b  <= mem_location; 
            #(10);
        end 
        
    end

    // ----------------------------------------------------------------
    // Test Results
    initial
    $monitor("time=%d, w_en=%b, r_en=%b, address=%d, pixel value=%b", $time, write_en, read_en, address18b, data_op);
endmodule
