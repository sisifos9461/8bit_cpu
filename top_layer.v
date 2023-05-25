`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/25 21:39:22
// Design Name: 
// Module Name: top_layer
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


module top_layer(
    input clk,
    input rst,
    input reset, //clr
    output [15:0]cubedata,
    output p0,
    output ea0,
    output [3:0]led     
    );
reg p1;
reg[26:0]cnt;
reg [3:0]led1;
reg clkreg;
wire clk_1hz;
wire [7:0] w;
wire t0,t1,t2,t3,t4,t5;
wire lp,ep,lm,epr,li,ei,la,ea,n,ev,lb,lo,co,po;
wire cout;
wire [3:0]operate_code;


always @(posedge clk)begin
     p1 = 0;
     if(t3&reset) begin p1= 1; end
     if(rst)begin cnt = 0; end
     led1 = operate_code;
     cnt=cnt+1;
     if(cnt<16777216) begin clkreg=0 ; end
     else begin clkreg =1 ;end
     if(cnt>33554432) begin cnt = 0;end
end
assign p0=p1;
//assign led = led1;
assign clk_1hz = clkreg;
assign led = w[7:4];
assign ea0 = ea;

beat beat_clk(clk_1hz,t5,t0,t1,t2,t3,t4);
control_unit control_oper(reset,clk_1hz,operate_code,t0,t1,t2,t3,t4,t5,lp,ep,lm,epr,li,ei,la,ea,n,ev,lb,lo,co,po);
pc pc(clk_1hz,reset,rst,lp,ep,t3,cp,po,w[3:0]);
store_unit store_unit(lm,clk_1hz,epr,w);
ir ir(clk_1hz,reset,rst,li,ei,t0,w,operate_code);
register_group register_group(clk_1hz,reset,la,lb,ea,ev,co,n,w,cp);
//alu_adder alu_adder(reset,ev,n,clk,ea,la,lb,co,cout,cp,w);
output_unit output_unit(lo,reset,rst,clk,w,cubedata);
/*
control_unit control_oper(reset,clk,operate_code,t0,t1,t2,t3,t4,t5,lp,ep,lm,epr,li,ei,la,ea,n,ev,lb,lo);
pc pc(clk,reset,rst,lp,ep,t0,w[3:0]);
store_unit store_uni(lm,clk,epr,w);
ir ir(clk,reset,rst,li,ei,t0,w,operate_code);
alu_adder alu_adder(reset,ev,n,clk,ea,la,lb,cout,w);
output_unit output_unit(lo,reset,rst,clk,w,cubedata);
*/


endmodule
