`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/27 17:34:34
// Design Name: 
// Module Name: absorber
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


module absorber(
   input clk,
   input reset,
   input [7:0] fir_in,
   output reg [15:0] fir_out
    );
    reg[7:0] delay_pipeline1;
    reg[7:0] delay_pipeline2;
    reg[7:0] delay_pipeline3;
    reg[7:0] delay_pipeline4;
    reg[7:0] delay_pipeline5;
    reg[7:0] delay_pipeline6;
    reg[7:0] delay_pipeline7;
    reg[7:0] delay_pipeline8;
    reg[7:0] delay_pipeline9;
    
    always@(posedge clk or negedge reset)
       if(!reset)
          begin
             delay_pipeline1<=8'b0;
             delay_pipeline2<=8'b0;
             delay_pipeline3<=8'b0;
             delay_pipeline4<=8'b0;
             delay_pipeline5<=8'b0;
             delay_pipeline6<=8'b0;
             delay_pipeline7<=8'b0;
             delay_pipeline8<=8'b0;
             delay_pipeline9<=8'b0;
          end
       else  
          begin
             delay_pipeline1<=fir_in;
             delay_pipeline2<= delay_pipeline1;
             delay_pipeline3<= delay_pipeline2;
             delay_pipeline4<= delay_pipeline3;
             delay_pipeline5<= delay_pipeline4;
             delay_pipeline6<= delay_pipeline5;
             delay_pipeline7<= delay_pipeline6;
             delay_pipeline8<= delay_pipeline7;
             delay_pipeline9<= delay_pipeline8; 
          end
          
    wire[7:0] coeff1 =8'd7;
    wire[7:0] coeff2 =8'd5;
    wire[7:0] coeff3 =8'd51;
    wire[7:0] coeff4 =8'd135;
    wire[7:0] coeff5 =8'd179;
    wire[7:0] coeff6 =8'd135;
    wire[7:0] coeff7 =8'd51;
    wire[7:0] coeff8 =8'd5;
    wire[7:0] coeff9 =8'd7;
    reg signed [16:0] multi_data1;
    reg signed [16:0] multi_data2;
    reg signed [16:0] multi_data3;
    reg signed [16:0] multi_data4;
    reg signed [16:0] multi_data5;
    reg signed [16:0] multi_data6;
    reg signed [16:0] multi_data7;
    reg signed [16:0] multi_data8;
    reg signed [16:0] multi_data9;
    
    always@(posedge clk or negedge reset)
       if(!reset)
           multi_data1 <= 17'b0;
         else 
           multi_data1 <= delay_pipeline1*coeff1;
                           
     always@(posedge clk or negedge reset)
       if(!reset)
           multi_data2 <= 16'b0;
         else 
           multi_data2 <= delay_pipeline2*coeff2;
                           
      always@(posedge clk or negedge reset)
       if(!reset)
           multi_data3 <= 16'b0;
         else 
           multi_data3 <= delay_pipeline3*coeff3;
                    
       always@(posedge clk or negedge reset)
       if(!reset)
           multi_data4 <= 16'b0;
         else 
           multi_data4 <= delay_pipeline4*coeff4;
                            
       always@(posedge clk or negedge reset)
       if(!reset)
           multi_data5 <= 16'b0;
         else 
           multi_data5 <= delay_pipeline5*coeff5;
                          
       always@(posedge clk or negedge reset)
       if(!reset)
           multi_data6 <= 16'b0;
         else 
           multi_data6 <= delay_pipeline6*coeff6;
                           
       always@(posedge clk or negedge reset)
       if(!reset)
           multi_data7 <= 16'b0;
         else 
           multi_data7 <= delay_pipeline7*coeff7;
                          
       always@(posedge clk or negedge reset)
       if(!reset)
           multi_data8 <= 16'b0;
         else 
           multi_data8 <= delay_pipeline8*coeff8;
                     
       always@(posedge clk or negedge reset)
       if(!reset)
           multi_data9 <= 16'b0;
         else 
           multi_data9 <= delay_pipeline9*coeff9;
           
       always@(posedge clk or negedge reset)
       if(!reset)
           fir_out <= 16'b0;
         else 
           fir_out <= multi_data1+multi_data2+multi_data3+multi_data4+
                      multi_data5+multi_data6+multi_data7+multi_data8+
                      multi_data9;
             
endmodule
