`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 13:22:56
// Design Name: 
// Module Name: test_beat
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


module test_beat_top();
reg clk;
wire [15:0]cube;
reg reset;
reg rst;
//wire [7:0]test;
wire [7:0] w;
wire t0,t1,t2,t3,t4,t5;
wire lp,ep,lm,epr,li,ei,la,ea,n,ev,lb,lo;
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
       #4 $finish;
end
always #0.02  clk = ~clk; 

beat beat_clk(clk,t5,t0,t1,t2,t3,t4);
control_unit control_oper(reset,clk,operate_code,t0,t1,t2,t3,t4,t5,lp,ep,lm,epr,li,ei,la,ea,n,ev,lb,lo);
pc pc(clk,reset,rst,lp,ep,t3,w[3:0]);
store_unit store_uni(lm,clk,epr,w);
ir ir(clk,reset,rst,li,ei,t0,w,operate_code);
alu_adder alu_adder(reset,ev,n,clk,ea,la,lb,cout,w);
output_unit output_unit(lo,reset,rst,clk,w,cube);


/*
wire [15:0]addr;
mar mar(w[3:0],lm,clk,addr);
wire [7:0] mem;
prom prom(clk,addr,mem,epr);
wire [7:0]test1;
wire [7:0]test2; 
*/
/*
    wire [7:0] a;
    wire [7:0] b;
    register_a register_a(clk,reset,w,la,a);
    register_a register_b(clk,reset,w,lb,b);
*/
/*
beat beat1(
        .clk(clk),
        .t0(t0),
        .t1(t1),
        .t2(t2),
        .t3(t3),
        .t4(t4),
        .t5(t5)
);
*/

endmodule
