`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/18 11:44:04
// Design Name: 
// Module Name: control_unit
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
module control_uni(//operation_controller(
    input clr,
    input clk
        );
endmodule
*/

module control_unit(//operation_operate(
    input reset,
    input clk,
    input [3:0] opcode,    //control_word from  instruction register instr_out_h
    input t1, input t2, input t3, input t4, input t5, input t0, 
    output reg lp,
    output reg ep,
    output reg lm,
    output reg epr,
    output reg li,
    output reg ei,
    output reg la,
    output reg ea,
    output reg n,
    output reg ev,
    output reg lb,
    output reg lo,
    output reg co,
    output reg po
);

always @(posedge clk) //(posedge t0 or posedge t1 or posedge t2 or posedge t3 or posedge t4 or posedge t5)
begin
    if(reset) begin
    ep <= 1;
    co<=0;
    po<=0;
    end
          
    case (opcode)
         4'b0000: // MOV A,RX
            begin
                if(t0) begin
                    lp <= 0; ep <= 1; lm <= 1; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;  co=0;  po<=0;//lo=0
            
                end else if(t1) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 1; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
            
                end else if(t2) begin
                    lp <= 1; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
      
                end else if(t3) begin
                    lp <= 0; ep <= 0; lm <= 1; epr <=0 ;li <= 0; ei <= 1;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end else if(t4) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 0; ei <= 0;
                    la <= 1; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end else if(t5) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end 
            end
        4'b0011: // ADD A,RX
            begin
             if(t0) begin
                    lp <= 0; ep <= 1; lm <= 1; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co=0;  po<=0;//lo=0
            
                end else if(t1) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 1; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
            
                end else if(t2) begin
                    lp <= 1; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end else if(t3) begin
                    lp <= 0; ep <= 0; lm <= 1; epr <=0 ;li <= 0; ei <= 1;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end else if(t4) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 1; lo <= 0;
                end else if(t5) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 1; ea <= 0; n <=0 ; ev <= 1 ; lb <= 0; lo <= 0;  //la=1
                end
                
            end

        4'b1100: // SUB A,RX
            begin
                 if(t0) begin
                    lp <= 0; ep <= 1; lm <= 1; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co=0;  po<=0;//lo=0          
                end else if(t1) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 1; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;  
                end else if(t2) begin
                    lp <= 1; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;      
                end else if(t3) begin
                    lp <= 0; ep <= 0; lm <= 1; epr <=0 ;li <= 0; ei <= 1;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;

                end else if(t4) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=1 ; ev <= 0 ; lb <= 1; lo <= 0;
                end else if(t5) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 1; ea <= 0; n <=0 ; ev <= 1 ; lb <= 0; lo <= 0;
                end
            end
        4'b1110: // OUT(n),A
            begin
                if(t0) begin
                    lp <= 0; ep <= 1; lm <= 1; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co=0;  po<=0;//lo=0         
                end else if(t1) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 1; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;   
                end else if(t2) begin
                    lp <= 1; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
       
                end else if(t3) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 1; n <=0 ; ev <= 0 ; lb <= 0; lo <= 1;
                end 
            end
                4'b0110: // Jump if bigger
            begin
             if(t0) begin
                    lp <= 0; ep <= 1; lm <= 1; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co=0; po<=0;//lo=0
            
                end else if(t1) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 1; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
            
                end else if(t2) begin
                    lp <= 1; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end else if(t3) begin
                    lp <= 0; ep <= 0; lm <= 1; epr <=0 ;li <= 0; ei <= 1;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;    co<=0;
                end else if(t4) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 1; lo <= 0;     co<=0;
                end else if(t5) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 1 ; lb <= 0; lo <= 0;    co<=1;//la=1  
                end
                
            end
              4'b0111: // jump rx
            begin
             if(t0) begin
                    lp <= 0; ep <= 1; lm <= 1; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co=0;  po<=0;//lo=0
            
                end else if(t1) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 1; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
            
                end else if(t2) begin
                    lp <= 1; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co <=0; 
                end else if(t3) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co <=0; po<=1;
                end
            end
       4'b1111: // HALT
            begin
                if(t0) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co=0;  po<=0;
                end 
            end
       default:
            begin
                 if(t0) begin
                    lp <= 0; ep <= 1; lm <= 1; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0; co=0;  po<=0;//lo=0
            
                end else if(t1) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=1 ;li <= 1; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
            
                end else if(t2) begin
                    lp <= 1; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end else if(t3) begin
                    lp <= 0; ep <= 0; lm <= 0; epr <=0 ;li <= 0; ei <= 0;
                    la <= 0; ea <= 0; n <=0 ; ev <= 0 ; lb <= 0; lo <= 0;
                end
            end
    endcase
end

endmodule

