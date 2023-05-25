`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/20 09:11:18
// Design Name: 
// Module Name: alu_adder
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
module adder(a,b,cin,sum,cout); //1bit
    input a,b,cin;
    output sum,cout;

    sum sum1(a,b,cin,sum);
    carry carry1(a,b,cin,cout);
endmodule

module sum(a,b,cin,sum);
    input a,b,cin;
    output sum;
    wire c;
    assign sum=a+b+cin;

endmodule

module carry(a,b,cin,cout);
    input a,b,cin;
    output cout;
    wire [1:0] sum;

    assign sum = a+b+cin;

    assign cout=sum[1];

endmodule
*/


module adder(input a, b, cin, output sum, cout);
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (cin & (a ^ b));
endmodule

module alu_adder(
    input [7:0]a,
    input [7:0]b,
    input ev,
    output [7:0]w,
    output cout
    );

    wire [7:0] sum; 
   // wire [7:0] re_sum;       
    wire c1, c2,c3,c4,c5,c6,c7;

    adder u1(a[0],b[0],1'b0,sum[0],c1);
    adder u2(a[1],b[1],c1,sum[1],c2);
    adder u3(a[2],b[2],c2,sum[2],c3);
    adder u4(a[3],b[3],c3,sum[3],c4);
    adder u5(a[4],b[4],c4,sum[4],c5);
    adder u6(a[5],b[5],c5,sum[5],c6);
    adder u7(a[6],b[6],c6,sum[6],c7);
    adder u8(a[7],b[7],c7,sum[7],cout);
    
    assign   w = (ev)?sum:8'hzz;
 /*   
    register register_c(clk,clr,sum,ev,re_sum);
assign cp = co ? (b>re_sum):1'b0;


always    #0.025 $display($realtime,"%b,%b,%b,%b,%b",a,b,sum,w,re_sum);
    
assign w = (ea)?re_sum:8'bzz;
*/
endmodule

module register_group(input clk,clr,la,lb,ea,ev,co,n,inout [7:0]w,output cp);
    wire [7:0]a;
    wire [7:0]b;
    register register_a(clk,clr,w,la,a);
    register register_b(clk,clr,w,lb,b);
    alu_adder alu_adder_a(a,b,ev,w,cout);
    always    #0.025 $display($realtime,"%b,%b",a,b);

    assign w = (ea)?a:8'bzz;
    assign cp = (a>b)?co:1'b0;
endmodule



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

module register_n  (
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
