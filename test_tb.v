`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/20 10:22:19
// Design Name: 
// Module Name: tb_test
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


module tb_test();
reg clk;
wire [15:0]cube;
wire cp;
reg reset;
reg rst;
//wire [7:0]test;
wire [7:0] w;
wire t0,t1,t2,t3,t4,t5;
wire lp,ep,lm,epr,li,ei,la,ea,n,ev,lb,lo,co,po;
wire cout;
wire [3:0]operate_code;
initial  begin
       rst = 0;
       clk = 0; 
       reset = 0;
       # 0.0001 rst = 1;
       # 0.1 rst = 0;
       #1.5 reset =~reset;
       //#0.004 reset =~reset;
       #2 reset =~reset;
       #40 $finish;
end
always #0.02  clk = ~clk; 

beat beat_clk(clk,t5,t0,t1,t2,t3,t4);
control_unit control_oper(reset,clk,operate_code,t0,t1,t2,t3,t4,t5,lp,ep,lm,epr,li,ei,la,ea,n,ev,lb,lo,co,po);
pc pc(clk,reset,rst,lp,ep,t3,cp,po,w[3:0]);
store_unit store_unit(lm,clk,epr,w);
ir ir(clk,reset,rst,li,ei,t0,w,operate_code);
register_group register_group(clk,reset,la,lb,ea,ev,co,n,w,cp);
//alu_adder alu_adder(reset,ev,n,clk,ea,la,lb,co,cout,cp,w);
output_unit output_unit(lo,reset,rst,clk,w,cube);

 
endmodule
