`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 19:41:33
// Design Name: 
// Module Name: rom_read
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


module rom_read( input   wire clk_100MHz,
                 input   wire rst_n,
                 output  wire [7:0] data_out);
reg [9:0] rom_addr;
//*******rom读数据地址累加上涨*******//
always @(posedge clk_100MHz or negedge rst_n) begin
    if(!rst_n) begin
        rom_addr <= 10'd0;
    end
    else if(rom_addr == 10'd512) begin
        rom_addr <= 10'd0;
    end
    else begin
        rom_addr <= rom_addr + 1'b1;
    end
end
//*******rom ip核例化*******//
rom i_rom_ip ( .clka(clk_100MHz), // input wire clka
               .addra(rom_addr),  // input wire [9 : 0] addra
               .douta(data_out)); // output wire [7 : 0] douta
endmodule
