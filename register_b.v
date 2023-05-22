`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/20 09:11:18
// Design Name: 
// Module Name: register_b
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

/*
module register_b  (
  input clk,
  input reset,
  input [7:0] data_in,
  input lb,
  input n,
  output wire [7:0]add_out
);
reg add_out1;

  always @(*) begin
    if (reset) begin
      add_out1 <= 0;
    end 
    if (lb) begin
      add_out1 <= data_in;
    end 
    if (n) begin
      add_out1 <= $signed(~data_in + 1);
    end
  end

assign add_out = add_out1;

endmodule
*£¿
