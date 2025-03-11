`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 18:27:55
// Design Name: 
// Module Name: rgb_no_overlap
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


module rgb_no_overlap(det,R,B,G,clk,rst);
input R,B,G,clk,rst; //Red,Blue,Green,clock,reset
output reg det;//detection
reg [3:0]prv_state,nxt_state;//previous state,next state
parameter S0=4'b0000,  //states 
          RED=4'b0001, 
          BLUE=4'b0010, 
          GREEN=4'b0011, 
          RB=4'b0100,
          BG=4'b0101,
          RG=4'b0110,
          RBG=4'b0111;
 always@(posedge clk)
  begin
    if(rst)
        prv_state<=S0;
    else
        prv_state<=nxt_state;
  end
  
//setting up the states
always@(*)
   begin
    case(prv_state)
        S0:if(R) nxt_state=RED;
           else if(B) nxt_state=BLUE;
           else if(G) nxt_state=GREEN;
           else nxt_state=S0;
        RED:if(B) nxt_state=RB;
            else if(G) nxt_state=RG;
            else nxt_state=S0;
        BLUE:if(R) nxt_state=RB;
            else if(G) nxt_state=BG;
            else nxt_state=S0;
        GREEN:if(B) nxt_state=BG;
            else if(R) nxt_state=RG;
            else nxt_state=S0;
        RB:if(G) nxt_state=RBG;
            else nxt_state=S0;
        BG:if(R) nxt_state=RBG;
            else nxt_state=S0;
        RG:if(B) nxt_state=RBG;
           else nxt_state=S0;
        RBG: nxt_state=S0;
          
       endcase
     end 
//output detection 
always@(*)
    begin
        case(prv_state)
              S0,RED,BLUE,GREEN,RB,BG,RG: det=0;
              RBG:det=1;
              
        endcase
   end
endmodule




















