`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 11:18:14
// Design Name: 
// Module Name: store_uni
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

module store_unit(
    input lm,
    input clk,
    input epr,
    inout [7:0]w
    );
wire [15:0]addr;
mar mar(w[3:0],lm,clk,addr);
prom prom(clk,addr,w,epr);
 
endmodule



module mar(
    input [3:0]win,   //[3:0]w
    input lm,
    input clk,
    output [15:0]out    //prom入口
    );
//译码
reg [15:0] res;
reg [3:0]in;
always @ (*)
  if(lm) begin
      in = win;
      case(in)
        4'b0000: res = 16'b0000000000000001;
        4'b0001: res = 16'b0000000000000010;
        4'b0010: res = 16'b0000000000000100;
        4'b0011: res = 16'b0000000000001000;
        4'b0100: res = 16'b0000000000010000;
        4'b0101: res = 16'b0000000000100000;
        4'b0110: res = 16'b0000000001000000;
        4'b0111: res = 16'b0000000010000000;
        4'b1000: res = 16'b0000000100000000;
        4'b1001: res = 16'b0000001000000000;
        4'b1010: res = 16'b0000010000000000;
        4'b1011: res = 16'b0000100000000000;
        4'b1100: res = 16'b0001000000000000;
        4'b1101: res = 16'b0010000000000000;
        4'b1110: res = 16'b0100000000000000;
        4'b1111: res = 16'b1000000000000000;
    endcase/*
      res[0] = (in == 4'b0000) ? 1'b1 : 1'b0; // 当输入为 0000 时，输出第 0 位为高电平，其他位为低电平
      res[1] = (in == 4'b0001) ? 1'b1 : 1'b0; // 当输入为 0001 时，输出第 1 位为高电平，其他位为低电平
      res[2] = (in == 4'b0010) ? 1'b1 : 1'b0; // 当输入为 0010 时，输出第 2 位为高电平，其他位为低电平
      res[3] = (in == 4'b0011) ? 1'b1 : 1'b0; // 当输入为 0011 时，输出第 3 位为高电平，其他位为低电平
      res[4] = (in == 4'b0100) ? 1'b1 : 1'b0; // 当输入为 0100 时，输出第 4 位为高电平，其他位为低电平
      res[5] = (in == 4'b0101) ? 1'b1 : 1'b0; // 当输入为 0101 时，输出第 5 位为高电平，其他位为低电平
      res[6] = (in == 4'b0110) ? 1'b1 : 1'b0; // 当输入为 0110 时，输出第 6 位为高电平，其他位为低电平
      res[7] = (in == 4'b0111) ? 1'b1 : 1'b0; // 当输入为 0111 时，输出第 7 位为高电平，其他位为低电平
      res[8] = (in == 4'b1000) ? 1'b1 : 1'b0; // 当输入为 1000 时，输出第 8 位为高电平，其他位为低电平
      res[9] = (in == 4'b1001) ? 1'b1 : 1'b0; // 当输入为 1001 时，输出第 9 位为高电平，其他位为低电平
      res[10] = (in == 4'b1010) ? 1'b1 : 1'b0; // 当输入为 1010 时，输出第 10 位为高电平，其他位为低电平
      res[11] = (in == 4'b1011) ? 1'b1 : 1'b0; // 当输入为 1011 时，输出第 11 位为高电平，其他位为低电平
      res[12] = (in == 4'b1100) ? 1'b1 : 1'b0; // 当输入为 1100 时，输出第 12 位为高电平，其他位为低电平
      res[13] = (in == 4'b1101) ? 1'b1 : 1'b0; // 当输入为 1101 时，输出第 13 位为高电平，其他位为低电平
      res[14] = (in == 4'b1110) ? 1'b1 : 1'b0; // 当输入为 1110 时，输出第 14 位为高电平，其他位为低电平
      res[15] = (in == 4'b1111) ? 1'b1 : 1'b0; // 当输入为 1111 时，输出第 15 位为高电平，其他位为低电平
  */end  
  else begin
     in = 4'hz;
     res = 16'hzzzz;
  end

assign out = res;
endmodule

module prom (
    input clk,         // 时钟信号
    input [15:0]addr,  // 地址信号，16 位二进制数
    output[7:0]inst,  // 存储器中指令的输出，8 位二进制数  进入总线w
    input epr
);

reg [7:0]reinst;
//reg [7:0] mem [0:255]; // 声明一个 256 个 8 位元素的存储器
reg [7:0]mem[0:15];
integer j;
integer i;

always @(posedge clk)
   case(addr)
        16'b0000000000000001: reinst =8'b00001111;  //0
        16'b0000000000000010: reinst= 8'b11100000;  //e
        16'b0000000000000100: reinst= 8'b00001111;   //0
        16'b0000000000001000: reinst= 8'b00111110;   //3
        16'b0000000000010000: reinst= 8'b11100000;  //e
        16'b0000000000100000: reinst= 8'b01101101;  //6
        16'b0000000001000000: reinst= 8'b01110011; //7
        16'b0000000010000000: reinst= 8'b11110000;   //f
        16'b0000000100000000: reinst= 8'b00000000;
        16'b0000001000000000: reinst= 8'b00000000;
        16'b0000010000000000: reinst= 8'b00000000;
        16'b0000100000000000: reinst= 8'b00000000;
        16'b0001000000000000: reinst= 8'b00000000;
        16'b0010000000000000: reinst= 8'b00010000;  //16
        16'b0100000000000000: reinst= 8'b00000010; //2
        16'b1000000000000000: reinst= 8'b00000001; //1
    endcase     
assign inst = (epr)?reinst: 8'hzz;
        
        
/*
initial begin
    mem[0] = 8'b00001111;  // MOV Ａ,(RF)
    mem[1] = 8'b00111110;  // ADD A, (RE)
    mem[2] = 8'b1110xxxx;  // OUT(n),A
    mem[3] = 8'b1111xxxx;  //CPU暂停
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
            reinst = mem[i]; // 将存储器中对应地址的指令输出
        end
    end


assign inst = (epr)?reinst: 8'hzz;
*/
endmodule

