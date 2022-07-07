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
    localparam T = 20;    // clock period in nano seconds

    // signal declaration
    reg clock = 1'b0;
    reg write_en = 1'b0, read_en = 1'b0;      // enable signal stimulus
    reg [17:0] address18b = 18'd0;      // ram address stimulus
    reg [7:0] data_ip = 8'b0000_0000;   // data input stimulus
    wire [7:0] data_op = 8'b0000_0000;  // data output stimulus

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
            
        // memory read Verification
        for(mem_location = 20; mem_location <30; mem_location = mem_location + 1) begin
            
            write_en    <= 0; 
            read_en     <= 1; 
            address18b  <= mem_location; 
            data_ip     <= 8'bx;
            #(10);
        end 
        
    end

    // ----------------------------------------------------------------
    // Test Results
    initial
    $monitor("time=%d, w_en=%b, r_en=%b, address=%d, pixel value=%b", $time, write_en, read_en, address18b, data_op);
endmodule
