`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2025
// Design Name: FIFO
// Module Name: fifo
// Project Name: 
// Target Devices: 
// Description: Synchronous FIFO buffer
//
//////////////////////////////////////////////////////////////////////////////////

module fifo(clk,rst,buf_in,buf_out,buf_empty,buf_full,wrt_en,rd_en,fifo_counter);
    
    input clk,rst,wrt_en,rd_en; //clock ,reset,write enable,read enable
    input [7:0]buf_in;        //8-bit input data to be written into FIFO
    output reg [7:0]buf_out; // 8-bit output data read from FIFO
    output reg buf_empty,buf_full; //buf_empty: High when FIFO is empty , buf_full: High when FIFO if full 
    output reg [6:0]fifo_counter; //7-bit counter to keep track of number of elements in FIFO
    reg [7:0] buf_memory[63:0]; //FIFO memory array of 64 locations, each 8 bits wide
    reg [5:0]wrt_ptr,rd_ptr; // 6-bit  write and read pointer
    
    //check the memory is full or not
    always@(fifo_counter)
        begin
            buf_empty = (fifo_counter==0);
            buf_full  = (fifo_counter==64);
        end
    
    // writting and reading
    always@(posedge clk , posedge rst)
        begin
            if(rst)
                fifo_counter <= 0;
            else if((!buf_full && wrt_en) && (!buf_empty && rd_en))
                fifo_counter <= fifo_counter;
            else if((!buf_full && wrt_en))
                fifo_counter <= fifo_counter + 1;
            else if((!buf_empty && rd_en))
                fifo_counter <= fifo_counter - 1;
            else
                fifo_counter <= fifo_counter;
         end
 
    //reading the memory
    always @ (posedge clk , posedge rst)
        begin
            if(rst)
                buf_out <= 0;
            else 
                begin
                    if(!buf_empty && rd_en)
                        buf_out <= buf_memory[rd_ptr];
                    else
                        buf_out <= buf_out;
                end
        end
     //writting to the memory
     always @ (posedge clk)
        begin
            if(!buf_full && wrt_en)
                buf_memory[wrt_ptr] <= buf_in;
            else
                buf_memory[wrt_ptr] <= buf_memory[wrt_ptr];
        end
    // flags updates
    always @ (posedge clk , posedge rst)
        begin
            if(rst)
                begin
                    wrt_ptr <= 0;
                    rd_ptr <= 0;
                end
            else
                begin
                    //writting flag
                    if(!buf_full && wrt_en)
                        wrt_ptr <= wrt_ptr + 1;
                     else
                        wrt_ptr <= wrt_ptr;
                    //reading flag
                    if(!buf_empty && rd_en)
                        rd_ptr <= rd_ptr + 1;
                    else
                        rd_ptr <= rd_ptr;
                end  
         end
endmodule