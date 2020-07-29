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
input RX_Pin_In,        //������������
    );
    wire [7:0] RX_Data;
    wire H2L_Sig,BPS_CLK,Count_Sig,RX_Done_Sig,TX_Done_Sig;
    
    detect_module u1(
    .CLK(CLK),
    .RSTn(RSTn),
    .RX_Pin_In(RX_Pin_In),       //������������  
    .H2L_Sig(H2L_Sig)            //֡��ʼ�ź�
       );
    rx_bps_module u2(
    .CLK(CLK),
    .RSTn(RSTn),
    .Count_Sig(Count_Sig),              //����λ��Ч�ź�
    .BPS_CLK(BPS_CLK)                   //��ʾ�źŲɼ�ʱ��
          );
     rx_control_module u3(
     .CLK(CLK), 
     .RSTn(RSTn),                   //��λ�ź�
     .H2L_Sig(H2L_Sig),             //֡��ʼ�ź�H2L_Sig
     .RX_Pin_In(RX_Pin_In),         //�������������ź�
     .BPS_CLK(BPS_CLK),             //һλ�������Ķ�λ�ź�
     .RX_En_Sig(EN),                //���ڽ���ʹ���ź�
     .Count_Sig(Count_Sig),         //��������֡��ʼȷ���źţ���ʾ��������֡��ʼʱ�̡�
     .RX_Data(RX_Data),             //װ�غõ�8λ��������
     .RX_Done_Sig(RX_Done_Sig)      //�������ݽ��ս����źţ���ʾһ֡�������ݡ�
           );
    display u4(
       .CLK(CLK),
       .sum(RX_Data),                //�ж�����
          );
endmodule
