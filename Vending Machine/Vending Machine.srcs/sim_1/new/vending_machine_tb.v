`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 18:46:18
// Design Name: 
// Module Name: vending_machine_tb
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

module vending_machine_tb();
    reg in; 
    reg start, clk, reset;
    reg [2:0] coins;
    wire done, product;
    wire [2:0] change;

    // Instantiate the Vending Machine
    vending_machine UUT (
        .in(in),
        .start(start),
        .clk(clk),
        .reset(reset),
        .coins(coins),
        .done(done),
        .product(product),
        .change(change)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        $monitor("time=%d \t start=%b \t in=%b \t coins=%b \t done=%b \t product=%b \t change=%b", 
                 $time, start, in, coins, done, product, change);
        
        // Initialize signals
        clk = 0; 
        reset = 1;
        start = 0; 
        in = 0; 
        coins = 3'b000;

        // Hold reset for some time
        #10 reset = 0;

        // Test Case 1: Buying Chocolate with Exact Money ($2)
        #10 start = 1; 
        #10 in = 0;
        #10 coins = 3'b010; // Insert $2 for chocolate
        

        // Test Case 2: Buying Drink with $5 
        #20 start = 1; 
        #10 in = 1; 
        #10 coins = 3'b101; // Insert $5 for drink
        
        #10 start=0;
        // Test Case 3: Buying Chocolate with More Money ($5)
        #20 start = 1; 
        #10 in = 0; 
        #10 coins = 3'b101; // Insert $5 for chocolate
        #60 $finish; // End simulation
    end
endmodule




















