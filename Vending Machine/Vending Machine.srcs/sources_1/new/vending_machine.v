`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2025 09:49:07
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(done, product, change, in, start, clk, reset, coins);
    input in; // Drink (1), Chocolate (0)
    input start, clk, reset;
    input [2:0] coins;
    output reg done, product;
    output reg [2:0] change;
    reg [3:0] prv_state, nxt_state; // Previous state, next state
    
    // State parameters
    parameter S0 = 4'b0000, // Ideal state
              S1 = 4'b0001, // Start
              S2 = 4'b0010, // Chocolate
              S3 = 4'b0011, // Drink
              S4 = 4'b0100, // Checking the price match for chocolate
              S5 = 4'b0101, // Checking the price match for drink
              S6 = 4'b0110, // >= $2 for chocolate
              S7 = 4'b0111, // >= $5 for drink
              S8 = 4'b1000, // Give change for chocolate
              S9 = 4'b1001, // Give change for drink
              S10 = 4'b1010; // Done (reset)

    // Coin parameters
    parameter C0 = 3'b000, // No coins
              C1 = 3'b001, // $1
              C2 = 3'b010, // $2
              C5 = 3'b101; // $5

    // Clock-driven state update
    always @(posedge clk) begin
        if (reset) begin
            prv_state <= S0;
        end else begin
            prv_state <= nxt_state;
        end
    end

    // State transition logic
    always @(in, start, coins, prv_state) begin
        case (prv_state)
            S0: nxt_state = start ? S1 : S0;
            S1: nxt_state = in ? S3 : S2; // Drink or Chocolate selection
            S2:if (coins >= C2) // Chocolate selection
                    nxt_state = S4;
                else
                    nxt_state = S0; 
            
            S3:if (coins >= C5)  // Drink selection
                    nxt_state = S5;
                else
                    nxt_state = S0; 
            S4: nxt_state = (coins == C2) ? S6 : (coins > C2) ? S8 : S0;
            S5: nxt_state = (coins == C5) ? S7 : (coins > C5) ? S9 : S0;
            S6, S7, S8, S9: nxt_state = S10;
            S10: nxt_state = S0; // Reset after transaction
            default: nxt_state = S0;
        endcase
    end

    // Output logic (product dispensing and change calculation)
    always @(in, start, coins, prv_state) begin
        case (prv_state)
            S6: begin
            product = 0;
            done=1;
            change=0;
            end    
            S7: begin
                product = 1;
                done = 1;
                change=0;
            end
            S8: begin
                change = (coins > C2) ? (coins - C2) : 3'b000;
                product = 0;
                done = 1;
            end
            S9: begin
                change = (coins > C5) ? (coins - C5) : 3'b000;
                product = 1;
                done = 1;
            end
            S10: begin
                done = 0; // Reset done after transaction
            end
            default: begin
                done = 0;
                product = 0;
                change = 3'b000;
            end
        endcase
    end
endmodule
























