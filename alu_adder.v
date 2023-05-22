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
    input clr,
    input ev,
    input n,
    input clk,
    input ea,
    input la,
    input lb,
    output cout,
    inout [7:0]w
    );

    wire [7:0] sum; 
    wire [7:0] re_sum;       
    wire c1, c2,c3,c4,c5,c6,c7;
    
    wire [7:0] a;
    wire [7:0] b;
    register register_a(clk,clr,w,la,a);
    register register_b(clk,clr,w,lb,b);
   

    adder u1(a[0],b[0],0,sum[0],c1);
    adder u2(a[1],b[1],c1,sum[1],c2);
    adder u3(a[2],b[2],c2,sum[2],c3);
    adder u4(a[3],b[3],c3,sum[3],c4);
    adder u5(a[4],b[4],c4,sum[4],c5);
    adder u6(a[5],b[5],c5,sum[5],c6);
    adder u7(a[6],b[6],c6,sum[6],c7);
    adder u8(a[7],b[7],c7,sum[7],cout);
    
    register register_c(clk,clr,sum,ev,re_sum);

//always    #0.025 $display($realtime,"%b,%b,%b,%b,%b",a,b,sum,w,re_sum);
    
assign w = (ea)?re_sum:8'bzz;

endmodule

