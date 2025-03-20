`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 14:29:00
// Design Name: 
// Module Name: vm_add_coins_tb
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


module vm_add_coins_tb();
    // Inputs
    reg clk,reset,in,start;            
    reg [2:0] coins;   
    // Outputs
    wire done,product;      
    wire [2:0] change; 
    vm_add_coins uut (.clk(clk),.reset(reset),.in(in),.start(start),.coins(coins),.done(done),.product(product),.change(change));
    always #5 clk = ~clk;

    // Test sequence
    initial begin
    $monitor("Time=%d \t reset=%b \t start=%b \t in=%b \t coins=%b \t done=%b \t product=%b \t change=%b",$time, reset, start, in, coins, done, product, change);
        // Initialize inputs
        clk = 0;reset = 1;start = 0;in = 0;coins = 3'b000;

        // Apply reset for 10ns
        #10;
        reset = 0;
        #10;
        // Test Case 1: Exact payment for chocolate ($2)
        start = 1;         // Start transaction
        #10 start = 0;
        in = 0;            // Select chocolate
        #10 coins = 3'b010;    // Insert $2
        #10 coins = 3'b000;    // No more coins
        // Expect: done=1, product=0, change=000
        #20;

        // Test Case 2: Exact payment for drink ($5)
        start = 1;
        #10 start = 0;
        in = 1;            // Select drink
        #10 coins = 3'b101;    // Insert $5
        #10 coins = 3'b000;
        // Expect: done=1, product=1, change=000
        #20;

        // Test Case 3: Insufficient coins for chocolate ($1, then $1 more)
        start = 1;
        #10 start = 0;
        in = 0;            // Select chocolate
        #10 coins = 3'b001;    // Insert $1
        #10 coins = 3'b000;
        #10 coins = 3'b001;    // Insert another $1 (total $2)
        #10 coins = 3'b000;
        // Expect: done=1, product=0, change=000
        #20;

        // Test Case 4: Excess coins for chocolate ($5 for $2 product)
        start = 1;
        #10 start = 0;
        in = 0;            // Select chocolate
        #10 coins = 3'b101;    // Insert $5
        #10 coins = 3'b000;
        // Expect: done=1, product=0, change=011 ($3)
        #20;

        //Test Case 5: Excess coins for drink ($6 for $5 product)
        start = 1;
        #10 start = 0;
        in = 1;            // Select drink
        #10 coins = 3'b010;    // Insert $2
        #10 coins = 3'b000;
        #10 coins = 3'b010;    // Insert another $2 (total $4)
        #10 coins = 3'b000;
        #10 coins = 3'b010;    // Insert another $2 (total $6)
        #10 coins = 3'b000;
        // Expect: done=1, product=1, change=001 ($1)
        #100;
        $finish;
    end
endmodule

















