`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Creat\e Date: 2023/03/26 10:44:00
// Design Name: 
// Module Name: store_unit
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
