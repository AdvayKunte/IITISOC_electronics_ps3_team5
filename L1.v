`timescale 1ns / 1ps

module L1(clk1, Ra, Rb, Rd, SignExtendedImm, m1, m2, RegDst,RegWrite,ALUSrc,ALUFn,MemWrite,MemRead,MemtoReg, Raout, Rbout, Rdout, immout, m1out, m2out, regdstout, regwriteout, alusrcout, alufnout, memwriteout, memreadout, memtoregout);
    input [2:0] Ra,Rb,Rd;
    input [7:0] SignExtendedImm,m1,m2;
    input clk1;
    input RegDst,RegWrite,ALUSrc,MemWrite,MemRead,MemtoReg;
    input [2:0] ALUFn ;
    
    output reg [2:0] Raout, Rbout, Rdout;
    output reg [7:0] immout, m1out, m2out;
    output reg regdstout, regwriteout, alusrcout, memwriteout, memreadout, memtoregout; 
    output reg [2:0] alufnout;
    
    reg [2:0] L1_Ra, L1_Rb, L1_Rd;
    reg [7:0] L1_SignExtendedImm, L1_m1, L1_m2;
    reg L1_RegDst,L1_RegWrite,L1_ALUSrc,L1_MemWrite,L1_MemRead,L1_MemtoReg; 
    reg [2:0] L1_ALUFn;

    always @(*)
    begin
        L1_Ra <=  Ra;
        L1_Rb <=  Rb;
        L1_Rd <=  Rd;
        L1_SignExtendedImm <=  SignExtendedImm;
        L1_m1 <=  m1;
        L1_m2 <=  m2;
        L1_RegDst <=  RegDst;
        L1_RegWrite <=  RegWrite;
        L1_ALUSrc <=  ALUSrc;
        L1_ALUFn <=  ALUFn;
        L1_MemWrite <=  MemWrite;
        L1_MemRead <=  MemRead;
        L1_MemtoReg <=  MemtoReg;
    end
    
    always @(posedge clk1)
    begin
        Raout <=  L1_Ra;
        Rbout <=  L1_Rb;
        Rdout <=  L1_Rd;
        immout <=  L1_SignExtendedImm;
        m1out <=  L1_m1;
        m2out <=  L1_m2;
        regdstout <=  L1_RegDst;
        regwriteout <=  L1_RegWrite;
        alusrcout <=  L1_ALUSrc;
        alufnout <=  L1_ALUFn;
        memwriteout <=  L1_MemWrite;
        memreadout <=  L1_MemRead;
        memtoregout <=  L1_MemtoReg;
    end
endmodule
