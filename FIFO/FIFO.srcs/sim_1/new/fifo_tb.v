`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025 18:58:40
// Design Name: 
// Module Name: fifo_tb
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

module tb_fifo;
    reg clk,rst,wrt_en,rd_en; 
    reg [7:0]buf_in; 
    wire [7:0]buf_out; 
    wire buf_empty,buf_full;
    wire [6:0]fifo_counter;

    // Instantiate the FIFO module
    fifo uut(.clk(clk),
            .rst(rst),
            .wrt_en(wrt_en),
            .rd_en(rd_en),
            .buf_in(buf_in),
            .buf_out(buf_out),
            .buf_empty(buf_empty),
            .buf_full(buf_full),
            .fifo_counter(fifo_counter)
            );

    // Clock Generation
    initial clk = 0;
    always #5 clk = ~clk; 

    // Test Sequence
    initial begin
        $monitor("Time: %d \t  rst=%b  \t wrt_en=%b \t rd_en=%b \t buf_in=%h \t buf_out=%h \t buf_empty=%b \t buf_full=%b  \t fifo_count=%b", 
                 $time, rst, wrt_en, rd_en, buf_in, buf_out, buf_empty, buf_full, fifo_counter);
        // Initial values
        rst = 1; wrt_en = 0; rd_en = 0; buf_in = 8'h00;
        #15;
        // Reset FIFO
        rst = 0;
        #10 ;
        
        // Write operations
        repeat (8) begin
            @(posedge clk);
            wrt_en = 1;
            rd_en = 0;
            buf_in = $random;
        end
        
        @(posedge clk);
        wrt_en = 0;
        
        // Test Case 2: Try writing when full
        @(posedge clk);
        wrt_en = 1;
        buf_in = $random;
        @(posedge clk);
        wrt_en = 0;
        
        // Test Case 3: Empty FIFO completely
        repeat (8) begin
            @(posedge clk);
            wrt_en = 0;
            rd_en = 1;
        end

        @(posedge clk);
        rd_en = 0;
        
         // Test Case 4: Try reading when empty
        @(posedge clk);
        rd_en = 1;
        @(posedge clk);
        rd_en = 0;
        
        // Test Case 5: Simultaneous write and read
        repeat (5) begin
            @(posedge clk);
            wrt_en = 1;
            rd_en = 1;
            buf_in = $random;
        end

        wrt_en = 0;
        rd_en = 0;

        // Test Case 6: Reset during operation
        @(posedge clk);
        wrt_en = 1;
        buf_in = 8'hAA;
        @(posedge clk);
        rst = 1; 
        @(posedge clk);
        rst = 0; 
        wrt_en = 0;
        
        #100;
        $finish;
    end
endmodule

