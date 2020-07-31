`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 19:08:57
// Design Name: 
// Module Name: test
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


module test( );
reg clk_100MHz=0;
reg [1:0]Key=0;
//wire DAC_Out;
wire [7:0] DAC_Data;
initial
begin
clk_100MHz = 1;
Key = 0;
#200.1
Key = 2'b01;
#1000000
Key = 2'b10;
#1000000
Key = 2'b11;
#50_000_000 $stop;
end
signal_top test(
.clk_100MHz(clk_100MHz),
.Key(Key),
.clk_DAC(),
.DAC_Data(DAC_Data)
//.DAC_Din(DAC_Out),
//.DAC_Sync()
);
always #10 clk_100MHz = ~clk_100MHz;
endmodule
