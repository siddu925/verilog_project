`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 10:50:16
// Design Name: 
// Module Name: vm_add_coins
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

module vm_add_coins(done, product, change, start, in, coins, clk, reset);
    input clk, reset, in, start; 
    input [2:0] coins;
    output reg done, product;
    output reg [2:0] change;
    reg [3:0] prv_state, nxt_state;  
    reg [2:0] total_coins;         

    // State parameters
    parameter S0 = 4'b0000,  // Initial state
              S1 = 4'b0001,  // Start state
              S2 = 4'b0010,  // Accepting coins for chocolate ($2)
              S3 = 4'b0011,  // Accepting coins for drink ($5)
              S4 = 4'b0100,  // Exactly $2 for chocolate
              S5 = 4'b0101,  // Exactly $5 for drink
              S6 = 4'b0110,  // More than $2 for chocolate
              S7 = 4'b0111,  // More than $5 for drink
              S8 = 4'b1000;  // Transaction done

    // Coin value parameters
    parameter C0 = 3'b000,  // No coin
              C1 = 3'b001,  // $1
              C2 = 3'b010,  // $2
              C5 = 3'b101;  // $5

    // Update of state and total_coins on clock edge
    always @(posedge clk) begin
        if (reset) 
            begin
                prv_state <= S0;
                total_coins <= 3'b000;
            end 
         else 
             begin
                prv_state <= nxt_state;
                   if ((prv_state == S2 || prv_state == S3) && coins != C0) 
                    begin
                        total_coins <= total_coins + coins;
                    end
                   if (nxt_state == S8) 
                      begin
                        total_coins <= 3'b000;
                      end
             end
        end

    // Determine next state
    always @(*) begin
        case (prv_state)
            S0: if (start)
                     nxt_state = S1;
                 else 
                     nxt_state = S0;
            S1: if (in)
                     nxt_state = S3; 
                 else 
                     nxt_state = S2;
            S2: begin
                if(total_coins + coins >= C2) 
                begin
                    if (total_coins + coins == C2) 
                        nxt_state = S4;
                    else 
                        nxt_state = S6;
                end 
                else 
                    begin
                        nxt_state = S2;  // Stay to accept more coins
                    end
            end
            S3: begin
                if (total_coins + coins >= C5)
                begin
                    if (total_coins + coins == C5) 
                        nxt_state = S5;
                    else 
                        nxt_state = S7;
                end
                else begin
                    nxt_state = S3;  // Stay to accept more coins
                end
            end
            S4: nxt_state = S8;
            S5: nxt_state = S8;
            S6: nxt_state = S8;
            S7: nxt_state = S8;
            S8: nxt_state = S0;
            default: nxt_state = S0;
        endcase
    end

    // Combinational logic: Set outputs
    always @(*) begin
        // Default outputs to prevent latches
        done = 0;
        product = 0;
        change = 3'b000;
        case (prv_state)
            S4: begin
                done = 1;
                product = 0;  // Chocolate
                change = 3'b000;
            end
            S5: begin
                done = 1;
                product = 1;  // Drink
                change = 3'b000;
            end
            S6: begin
                done = 1;
                product = 0;  // Chocolate
                change = total_coins - C2;  // Return change
            end
            S7: begin
                done = 1;
                product = 1;  // Drink
                change = total_coins - C5;  // Return change
            end
            S8: begin
                done = 1;
                change = 3'b000;
            end
        endcase
    end
endmodule











