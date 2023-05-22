`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 11:44:04
// Design Name: 
// Module Name: ir
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


module ir(            //instruction_register (
  input clk,
  input reset,              //clr
  input rst,
  input li,
  input ei,
  input t0,
  inout [7:0] w,
  output [3:0] instr_out_h  //operate_word
);

reg [7:0] re_in;
reg [3:0] instr_out_h1;  //control_word
reg [3:0] instr_out_l1;

always @(posedge clk) begin
    if (reset&t0) begin
      instr_out_h1 <= 4'h0;
      instr_out_l1 <= 4'h0;
    end 
    if(li)begin
     // re_in <= w;
      instr_out_h1 <= w[7:4];
      instr_out_l1 <= w[3:0];   
    end
  end
  
  assign instr_out_h = instr_out_h1;   //operate_code
  assign w[3:0] =(ei)? instr_out_l1:4'hz;

endmodule

