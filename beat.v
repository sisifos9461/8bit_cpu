`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 11:44:04
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

/*
module beat(
    input clk,      //clk _125Mhz  FPGA 自带
    output reg t0,output reg t1,output reg t2, output reg t3,output reg t4,output reg t5 );  
reg [2:0]a=0;
initial t5 = 0;
always@(posedge  clk)
begin
    a=a+1;
    if(a>5) begin
      a=0;
    end
    begin
        case(a)
            3'b000:begin   t5 <=~t5;   t0 <= 1;
                   end
            3'b001:begin   t0 <=~t0;   t1 <= 1;
                   end                 
            3'b010:begin   t1 <=~t1;    t2 <= 1;
                   end    
            3'b011:begin   t2 <=~t2;    t3 <= 1;
                   end    
            3'b100:begin   t3 <=~t3;    t4 <= 1;
                   end    
            3'b101:begin   t4 <=~t4;    t5 <= ~t5;
                   end                                                               
        endcase
    end
end
endmodule

*/
module beat(
    input clk,      //clk _125Mhz  FPGA 自带
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
