`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 19:42:07
// Design Name: 
// Module Name: uart
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


module uart(
input CLK,
input RSTn,
input EN,
input RX_Pin_In,        //串行输入数据
    );
    wire [7:0] RX_Data;
    wire H2L_Sig,BPS_CLK,Count_Sig,RX_Done_Sig,TX_Done_Sig;
    
    detect_module u1(
    .CLK(CLK),
    .RSTn(RSTn),
    .RX_Pin_In(RX_Pin_In),       //串行输入数据  
    .H2L_Sig(H2L_Sig)            //帧开始信号
       );
    rx_bps_module u2(
    .CLK(CLK),
    .RSTn(RSTn),
    .Count_Sig(Count_Sig),              //数据位有效信号
    .BPS_CLK(BPS_CLK)                   //提示信号采集时间
          );
     rx_control_module u3(
     .CLK(CLK), 
     .RSTn(RSTn),                   //复位信号
     .H2L_Sig(H2L_Sig),             //帧开始信号H2L_Sig
     .RX_Pin_In(RX_Pin_In),         //串口数据输入信号
     .BPS_CLK(BPS_CLK),             //一位数据中心定位信号
     .RX_En_Sig(EN),                //串口接收使能信号
     .Count_Sig(Count_Sig),         //串口数据帧开始确认信号，表示串口输入帧开始时刻。
     .RX_Data(RX_Data),             //装载好的8位串口数据
     .RX_Done_Sig(RX_Done_Sig)      //串口数据接收结束信号，表示一帧串口数据。
           );
    display u4(
       .CLK(CLK),
       .sum(RX_Data),                //判断数据
          );
endmodule
