`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/01 17:38:55
// Design Name: 
// Module Name: test_uart
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


module test_top(
    );
    reg CLK;
    reg RSTn, EN;
    reg RX_Pin_In;
    wire [7:0] DAC_Data;
    wire clk_DAC; 
    
    initial 
      begin
        CLK = 0;RSTn = 0;EN = 0;RX_Pin_In = 1;
        #20000 RSTn = 1;EN = 1;//1 a
        #520830 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #2000000;
        #520830 RX_Pin_In = 0;//2 b
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #2000000;
        #520830 RX_Pin_In = 0;//3 c
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #2000000;
        #520830 RX_Pin_In = 0;//4
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 1;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 0;
        #52083 RX_Pin_In = 1;
      end
            
    uart u0( .CLK(CLK), .RSTn(RSTn), .EN(EN), .RX_Pin_In(RX_Pin_In), .DAC_Data(DAC_Data), .clk_DAC(clk_DAC));
    always #5 CLK = ~CLK;//100MHz
endmodule
