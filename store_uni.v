`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 11:18:14
// Design Name: 
// Module Name: store_uni
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

module store_unit(
    input lm,
    input clk,
    input epr,
    inout [7:0]w
    );
wire [15:0]addr;
mar mar(w[3:0],lm,clk,addr);
prom prom(clk,addr,w,epr);
 
endmodule

