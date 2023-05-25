`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/20 10:21:47
// Design Name: 
// Module Name: beat
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

module beat(
    input clk,      //clk _125Mhz  FPGA вт╢Ь
    output  t0,
    output  t1,
    output  t2,
    output  t3,
    output  t4,
    output  t5 );

reg [5:0] shift_reg;
initial begin
   shift_reg = 6'b100000;
end

always @(posedge clk ) begin
    shift_reg <= {shift_reg[4:0], shift_reg[5]};
end

assign {t5,t4,t3,t2,t1,t0}=shift_reg;

endmodule  

