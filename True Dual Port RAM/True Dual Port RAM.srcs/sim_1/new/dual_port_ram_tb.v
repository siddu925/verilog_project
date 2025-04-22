`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2025 22:18:48
// Design Name: 
// Module Name: dual_port_ram_tb
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


module dual_port_ram_tb();
reg [7:0]data_a,data_b;
reg [5:0]addr_a,addr_b;
reg wrt_a,wrt_b,clk; 
wire [7:0]out_a,out_b; 

dual_port_ram uut(.out_a(out_a),
                  .out_b(out_b),
                  .data_a(data_a),
                  .data_b(data_b),
                  .addr_a(addr_a),
                  .addr_b(addr_b),
                  .wrt_a(wrt_a),
                  .wrt_b(wrt_b),
                  .clk(clk));
 
 always #5 clk = ~clk;
 initial
    begin
        $display("Starting simulation...");
        $monitor("time=%d \t data_a = %b \t data_b = %b \t addr_a = %b \t addr_b = %b \t wrt_a = %b \t wrt_b = %b \t clk = clk %b",$time,data_a,data_b,addr_a,addr_b,wrt_a,wrt_b,clk);
        
        clk=0;
        //initial values
        wrt_a=0; wrt_b=0;
        data_a=8'b0; data_b=8'b0;
        addr_a=6'b0; addr_b=6'b0;
        
        // Write to Port A
        #10;
        wrt_a = 1; data_a = 8'hAA; addr_a = 6'd10;
        wrt_b = 1; data_b = 8'hBB; addr_b = 6'd20;

        #10;
        wrt_a = 0; addr_a = 6'd10;
        wrt_b = 0; addr_b = 6'd20;

        #10;
        $display("Read Port A (addr 10): %h", out_a);
        $display("Read Port B (addr 20): %h", out_b);

        // Now write new data to same addresses
        #10;
        wrt_a = 1; data_a = 8'h55;
        wrt_b = 1; data_b = 8'h66;

        #10;
        wrt_a = 0; wrt_b = 0;

        #10;
        $display("Read Updated Port A (addr 10): %h", out_a);
        $display("Read Updated Port B (addr 20): %h", out_b);

        #10;
        $finish;
    end
endmodule


















