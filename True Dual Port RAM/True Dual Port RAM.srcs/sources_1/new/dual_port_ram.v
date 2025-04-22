`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2025 19:28:22
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram(out_a,out_b,data_a,data_b,addr_a,addr_b,wrt_a,wrt_b,clk);
input [7:0]data_a,data_b; //inputs for port A and B
input [5:0]addr_a,addr_b; //address of A and B
input wrt_a,wrt_b,clk; //write enable for A and B. clk -> clock
output reg [7:0]out_a,out_b; //outputs of port A and B
reg [7:0]sram[63:0]; //64x8-bit SRAM for general data storage

//port A
always@(posedge clk)
    begin
        if(wrt_a)
            begin
                sram[addr_a]<= data_a;
                out_a <= data_a;
            end
        else
            out_a <= sram[addr_a];
     end

//port B
always@(posedge clk)
    begin
        if(wrt_b)
            begin
                sram[addr_b] <= data_b;
                out_b <= data_b;
            end
         else
            out_b <= sram[addr_b];
    end
endmodule

























