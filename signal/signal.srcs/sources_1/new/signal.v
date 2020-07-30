`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 14:16:24
// Design Name: 
// Module Name: signal
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


module signal( input   wire sys_clk,
            input   wire rst_n,
            output  wire [7:0] data,
            output  reg  da_clk_25MHz);
 reg [2:0] counter;            
//*******rom数据读取模块例化*******//
rom_read i_rom_read( .clk_100MHz(sys_clk),
                     .rst_n(rst_n),
                     .data_out(data));
//*******DA模块时钟输出*******//
always @(posedge sys_clk or negedge rst_n)begin
    if(!rst_n)begin
        counter <= 0;
    end
    else if(counter == 3)begin
        counter <= 0;
    end
    else begin
        counter <= counter + 1'b1;
    end
end
always @(posedge sys_clk or negedge rst_n)begin
    if(!rst_n)begin
        da_clk_25MHz <= 0;
    end
    else if(counter == 3)begin
        da_clk_25MHz <= ~da_clk_25MHz;
    end 
    else begin
        da_clk_25MHz <= da_clk_25MHz;
    end
end
wire [8:0] probe0;
ila_0 i_ila ( .clk(sys_clk), // input wire clk
	          .probe0(probe0)); // input wire [8:0] probe0
assign probe0[7:0] = data;
assign probe0[8] = da_clk_25MHz;
endmodule