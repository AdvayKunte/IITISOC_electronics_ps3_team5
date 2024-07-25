`timescale 1ns / 1ps

module L2(clk2, L1_m1, L1_m2, L1_SignExtendedImm, L1_A, L1_B, L1_ALUSrc,L1_ALUFn,L1_MemWrite,L1_MemRead,L1_MemtoReg ,L1_RegWrite, L1_regwradd, ALUSrcout, ALUFnout, memwriteout, memreadout, memtoregout,regwriteout, regwradd, immout, Aout, Bout, m1out, m2out);

    input [7:0] L1_SignExtendedImm, L1_A, L1_B, L1_m1, L1_m2;
    input clk2;
    input L1_ALUSrc,L1_MemWrite,L1_MemRead,L1_MemtoReg , L1_RegWrite;
    input [2:0] L1_ALUFn;
    input [2:0] L1_regwradd;

    output reg [7:0] immout, Aout, Bout, m1out, m2out;
    output reg ALUSrcout, memwriteout, memreadout, memtoregout , regwriteout;
    output reg [2:0] ALUFnout;
    output reg [2:0] regwradd;

    reg [7:0] L2_SignExtendedImm, L2_A, L2_B, L2_m1, L2_m2;
    reg L2_ALUSrc,L2_MemWrite,L2_MemRead,L2_MemtoReg, L2_RegWrite;
    reg [2:0] L2_ALUFn;
    reg  [2:0]L2_regwradd;

    always @(*)
    begin
        L2_SignExtendedImm <=  L1_SignExtendedImm;
        L2_A <=  L1_A;
        L2_B <=  L1_B;
        L2_m1 <=  L1_m1;
        L2_m2 <=  L1_m2;
        L2_ALUSrc <=  L1_ALUSrc;
        L2_ALUFn <=  L1_ALUFn;
        L2_MemWrite <=  L1_MemWrite;
        L2_MemRead <=  L1_MemRead;
        L2_MemtoReg <=  L1_MemtoReg;
        L2_RegWrite <=  L1_RegWrite;
        L2_regwradd <=  L1_regwradd;
    end
    
    always @(posedge clk2)
    begin
        immout <=  L2_SignExtendedImm;
        Aout <=  L2_A;
        Bout <=  L2_B;
        m1out <=  L2_m1;
        m2out <=  L2_m2;
        ALUSrcout <=  L2_ALUSrc;
        ALUFnout <=  L2_ALUFn;
        memwriteout <=  L2_MemWrite;
        memreadout <=  L2_MemRead;
        memtoregout <=  L2_MemtoReg;
        regwriteout <=  L2_RegWrite;
        regwradd <=  L2_regwradd;
    end
endmodule
