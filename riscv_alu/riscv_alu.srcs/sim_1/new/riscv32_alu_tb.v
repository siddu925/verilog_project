`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 22:21:42
// Design Name: 
// Module Name: riscv32_alu_tb
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


module riscv32_alu_tb();
  reg [31:0] op_1_in;
  reg [31:0] op_2_in;
  reg [3:0] opcode_in;
  wire [31:0] result_out;

  riscv32_alu uut (.op_1_in(op_1_in), .op_2_in(op_2_in), .opcode_in(opcode_in), .result_out(result_out));

  initial
  begin
    
    $monitor("time=%d \t op_1_in=%h \t op_2_in=%h \t opcode_in=%b \t result_out=%h", $time, op_1_in, op_2_in, opcode_in, result_out);

    // Initialize inputs
    op_1_in = 32'h00000005; op_2_in = 32'h00000003; opcode_in = 4'b0000;

    // Test Cases
    #10 opcode_in = 4'b0000; // ADD
    #10 opcode_in = 4'b1000; // SUB
    #10 opcode_in = 4'b0110; // OR
    #10 opcode_in = 4'b0111; // AND
    #10 opcode_in = 4'b0100; // XOR
    #10 opcode_in = 4'b0001; // SLL
    #10 opcode_in = 4'b0101; // SRL
    #10 opcode_in = 4'b0010; // SLT
    #10 opcode_in = 4'b0011; // SLTU

    $stop;
  end
endmodule

