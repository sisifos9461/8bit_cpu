`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 08:28:11
// Design Name: 
// Module Name: output_unit
// Project `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 11:44:04
// Design Name: 
// Module Name: output_unit
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
module datacube(
    input [3:0]num,
    output [7:0]out1
    );
    reg [7:0]out;
always @(*)begin
    case(num[3:0])
        4'b0000: out = 8'b11000000;
        4'b0001: out = 8'b11111001;
        4'b0010: out = 8'b10100100;
        4'b0011: out = 8'b10110000;
        4'b0100: out = 8'b10011001;
        4'b0101: out = 8'b10010010;
        4'b0110: out = 8'b10000010;
        4'b0111: out = 8'b11111000;
        4'b1000: out = 8'b10000000;
        4'b1001: out = 8'b10010000;
        4'b1111: out = 8'b10000110;
    endcase
    end
assign out1 = out;
endmodule


module output_unit(   //ÊýÂë¹Ü
   input lo,
   input reset,
   input rst,
   input clk,
   input [7:0]data,   //[7:0]w,
   output wire [15:0]out
    );
reg [7:0] latch;
reg [3:0]num1;
reg [3:0]num2;


always@(posedge clk) begin
    if(rst) begin
        latch <= 8'hff;
        end
    if(lo)begin
        latch<=data;
    end 
    if(reset)begin
        //latch<=8'h80;
       latch<=8'h00;
    end
    if(latch >= 8'h64) begin num1 = 4'hf ;num2 = 4'hf;end 
    else if(latch<8'h64 & latch>=8'h5a) begin num1=latch-8'h5a; num2 = 4'h9;end
    else if(latch<8'h5a & latch>=8'h50) begin num1=latch-8'h50; num2 = 4'h8;end 
    else if(latch<8'h50 & latch>=8'h46) begin num1=latch-8'h46; num2 = 4'h7;end 
    else if(latch<8'h46 & latch>=8'h3c) begin num1=latch-8'h3c; num2 = 4'h6;end 
    else if(latch<8'h3c & latch>=8'h32) begin num1=latch-8'h32; num2 = 4'h5;end 
    else if(latch<8'h32 & latch>=8'h28) begin num1=latch-8'h28; num2 = 4'h4;end 
    else if(latch<8'h28 & latch>=8'h1e) begin num1=latch-8'h1e; num2 = 4'h3;end 
    else if(latch<8'h1e & latch>=8'h14) begin num1=latch-8'h14; num2 = 4'h2;end
    else if(latch<8'h14 & latch>=8'h0a) begin num1=latch-8'h0a; num2 = 4'h1;end 
    else if(latch<8'h0a) begin num1=latch[3:0]; num2 = 4'h0;end 
    //num1=latch%10;
    //num2=latch/10;
end


datacube datacube_1(num2[3:0],out[7:0]);
//always #0.002 $display($realtime ,"out:%d,%d,%d",num1,num2,latch);
datacube datacuda_2(num1[3:0],out[15:8]);   


endmodule

