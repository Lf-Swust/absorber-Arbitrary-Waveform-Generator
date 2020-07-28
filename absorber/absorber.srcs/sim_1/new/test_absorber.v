`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 16:33:56
// Design Name: 
// Module Name: test_absorber
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


module test_absorber();
reg clk;
reg reset;
reg [7:0] fir_in;
reg [7:0] mem[1:4096];
reg [12:0] i;
wire [15:0] fir_out;

absorber u1(
.clk(clk),
.reset(reset),
.fir_in(fir_in),
.fir_out(fir_out));

initial
   begin
     $readmemh("C:/Users/SWUST-LF/Desktop/c/c.txt",mem);
     reset=0;
     clk=0;
     #50;reset=1;
     #50000;
     $stop;
   end

initial
   forever #50 clk=~clk;
   
always@(posedge clk or negedge reset)
   if(!reset)
      fir_in<=8'b0;
   else
      fir_in<=mem[i];

always@(posedge clk or negedge reset)
   if(!reset)
      i<=12'd0;
   else
      i<=i+1'd1;
     
endmodule
