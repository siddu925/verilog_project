`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 19:18:22
// Design Name: 
// Module Name: rbg_no_overlap_tb
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


module rbg_no_overlap_tb();
reg R,B,G,clk,rst; 
wire det;
rgb_no_overlap UUT(.R(R),.B(B),.G(G),.clk(clk),.rst(rst),.det(det));
always #5 clk=~clk;
initial 
    begin
        $monitor("time=%d \t R=%b \t B=%b \t G=%b \t det=%b",$time,R,B,G,det);
        R=0;B=0;G=0;clk=0;rst=1;
        // Reset sequence
        #10 rst = 0;

        // Apply test pattern for RBG detection
        #10 R = 1; B = 0; G = 0;  
        #10 R = 0; B = 1; G = 0;  
        #10 R = 0; B = 0; G = 1;  //detected
        #10 R = 0; B = 0; G = 0;
        #10 R = 1; B = 0; G = 0;  
        #10 R = 0; B = 1; G = 0;  
        #10 R = 0; B = 1; G = 0;  
        #10 R = 0; B = 0; G = 0;
        #10 R = 0; B = 0; G = 0;  
        #10 R = 0; B = 0; G = 1;  
        #10 R = 0; B = 1; G = 0;  
        #10 R = 1; B = 0; G = 0;//detected
        #10 $finish;
  end
endmodule

























