`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 18:16:17
// Design Name: 
// Module Name: signal_top
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


module signal_top(
    input clk_100MHz,
    input [1:0]Key,
    output clk_DAC,
    output  DAC_Din,
    output  DAC_Sync,
    output  [7:0] DAC_Data
    );
    
    clk_wiz_0 clk_25MHz(.clk_out1(clk_DAC),.clk_in1(clk_100MHz));
    
    Driver_DAC u1(
    .clk_100MHz(clk_100MHz),
    .Wave_Mode(Key),
    .clk_DAC(clk_DAC),
    .DAC_En(1),
    .Phase(90),
    .DAC_Data(DAC_Data)
    //.DAC_Din(DAC_Din),
    //.DAC_Sync(DAC_Sync)
    );
      
endmodule