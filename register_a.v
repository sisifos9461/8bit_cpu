`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/20 09:11:18
// Design Name: 
// Module Name: register_a
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


module register (
  input clk,
  input reset,   //clr
  input [7:0] data_in,    //总线上 [7:0]w from ir instr_out_l to mar to prom 最后取得的8位数 
  input la,
  output  [7:0] add_out
);

reg [7:0] add_out1;

 always @(posedge clk) begin
    if (reset) begin
      add_out1 <= 0;
    end
    if (la) begin 
      add_out1 <= data_in;
    end 

  end

assign add_out = add_out1;

endmodule

