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
    input clk,           // 时钟信号
    input reset,         // 复位信号  clr
    input rst,
    input inc,           // 计数器加一信号    lp
    input ep,            //ep 有效时，pc当前值被送上总线
    input t3,
    input cp,
    input po,
    output wire [3:0]pc  // 程序计数器的输出，8 位二进制数
);
reg [3:0]pc1;
always @(posedge clk) begin
    if(rst) begin
        pc1 <= 4'b0101; 
        end     //复位即开机  指向prom第3位即11110000,即 CPU暂停
    if (reset&t3) begin   // 开始时将计数器清零
        pc1 <= 0;
    end 
    if (cp) begin   // 开始时将计数器清零
        pc1 <= pc1 + 1;
    end 
    if (po) begin
        pc1 <= 4'b0011;
    end
    if (inc) begin  // 如果加一信号为高电平，计数器加一    lp
        pc1 = pc1 + 1;
    end else begin     // 否则，程序计数器不变
        pc1 = pc1;
    end
end

assign pc = (ep)?pc1:4'hz;
endmodule

