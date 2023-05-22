`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 11:44:04
// Design Name: 
// Module Name: pc
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


module  pc (                 // program_counter
    input clk,           // ʱ���ź�
    input reset,         // ��λ�ź�  clr
    input rst,
    input inc,           // ��������һ�ź�    lp
    input ep,            //ep ��Чʱ��pc��ǰֵ����������
    input t3,
    output wire [3:0]pc  // ����������������8 λ��������
);
reg [3:0]pc1;
always @(posedge clk) begin
    if(rst) begin
        pc1 <= 4'b0101; 
        end     //��λ������  ָ��prom��3λ��11110000,�� CPU��ͣ
    if (reset&t3) begin   // ��ʼʱ������������
        pc1 <= 0;
    end 
    if (inc) begin  // �����һ�ź�Ϊ�ߵ�ƽ����������һ    lp
        pc1 = pc1 + 1;
    end else begin     // ���򣬳������������
        pc1 = pc1;
    end
end

assign pc = (ep)?pc1:4'hz;
endmodule

