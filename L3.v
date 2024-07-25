`timescale 1ns / 1ps

module L3(clk1, L2_B, L2_alu_out, L2_MemWrite, L2_MemRead, L2_MemtoReg, L2_RegWrite , L2_regwradd , l2m2out, Bout, alu_outout, memwriteout, memreadout, memtoregout, regwriteout ,regwradd , l3m2out);
    input [7:0] L2_B, L2_alu_out , l2m2out;
    input clk1;
    input L2_MemWrite,L2_MemRead,L2_MemtoReg, L2_RegWrite;
    input [2:0] L2_regwradd;
    
    output reg [7:0] Bout, alu_outout , l3m2out;
    output reg memwriteout, memreadout, memtoregout,  regwriteout;
    output reg [2:0] regwradd;

    reg [7:0] L3_B, L3_alu_out , blatch;
    reg L3_MemWrite,L3_MemRead,L3_MemtoReg ,L3_RegWrite;
    reg [2:0] L3_regwradd;
    
       always @(*)
    begin
        L3_B <=  L2_B;
        L3_alu_out <=  L2_alu_out;
        L3_MemWrite <=  L2_MemWrite;
        L3_MemRead <=  L2_MemRead;
        L3_MemtoReg <=  L2_MemtoReg;
        L3_RegWrite <=  L2_RegWrite;
        L3_regwradd <=  L2_regwradd;
        blatch <= l2m2out;
    end
    
    always @(posedge clk1)
    begin
        Bout <=  L3_B;
        alu_outout <=  L3_alu_out;
        memwriteout <=  L3_MemWrite;
        memreadout <=  L3_MemRead;
        memtoregout <=  L3_MemtoReg;
        regwriteout <=  L3_RegWrite;
        regwradd <=  L3_regwradd;
        l3m2out <= blatch;
    end
    
endmodule
