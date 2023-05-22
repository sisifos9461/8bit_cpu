`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 11:44:04
// Design Name: 
// Module Name: prom
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


module prom (
    input clk,         // ʱ���ź�
    input [15:0]addr,  // ��ַ�źţ�16 λ��������
    output[7:0]inst,  // �洢����ָ��������8 λ��������  ��������w
    input epr
);

reg [7:0]reinst;
//reg [7:0] mem [0:255]; // ����һ�� 256 �� 8 λԪ�صĴ洢��
reg [7:0]mem[0:15];
integer j;
integer i;

always @(posedge clk)
   case(addr)
        16'b0000000000000001: reinst =8'b00001111;
        16'b0000000000000010: reinst= 8'b11100000;
        16'b0000000000000100: reinst= 8'b00001111;
        16'b0000000000001000: reinst= 8'b00111110;
        16'b0000000000010000: reinst= 8'b11100000;
        16'b0000000000100000: reinst= 8'b11110000;
        16'b0000000001000000: reinst= 8'b00000000;
        16'b0000000010000000: reinst= 8'b00000000;
        16'b0000000100000000: reinst= 8'b00000000;
        16'b0000001000000000: reinst= 8'b00000000;
        16'b0000010000000000: reinst= 8'b00000000;
        16'b0000100000000000: reinst= 8'b00000000;
        16'b0001000000000000: reinst= 8'b00000000;
        16'b0010000000000000: reinst= 8'b00000000;
        16'b0100000000000000: reinst= 8'b00000100; //
        16'b1000000000000000: reinst= 8'b00001000;
    endcase     
assign inst = (epr)?reinst: 8'hzz;
        
        
/*
initial begin
    mem[0] = 8'b00001111;  // MOV ��,(RF)
    mem[1] = 8'b00111110;  // ADD A, (RE)
    mem[2] = 8'b1110xxxx;  // OUT(n),A
    mem[3] = 8'b1111xxxx;  //CPU��ͣ
    for (j = 4; j <14; j = j + 1) begin
      mem[i] = 8'b00000000;
    end
    mem[14] = 8'b00100000;   //32
    mem[15] = 8'b01000000;   //64
    
      
    
end

always @* 
    for(i=0;i<16;i=i+1)begin
         //$display($realtime,"%b,%b,%b,%b,%b",i,reinst,addr[i],addr,inst);
        if(addr[i])begin
            reinst = mem[i]; // ���洢���ж�Ӧ��ַ��ָ�����
        end
    end


assign inst = (epr)?reinst: 8'hzz;
*/
endmodule

