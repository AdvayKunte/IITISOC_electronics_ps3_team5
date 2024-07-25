`timescale 1ns/1ns

module L4 (alu_in, mem_in, MemToRegmux,L3_Regwrite, L3_regwradd, alu_out, mem_out, MemToReg, RegWrite , regwradd,clk2);

input [7:0] alu_out, mem_out;
input MemToReg, L3_Regwrite, clk2;
input [2:0] L3_regwradd;

output reg [7:0] alu_in, mem_in;
output reg MemToRegmux , RegWrite ;
output reg [2:0] regwradd;

reg [7:0] L4_alu_out, L4_mem_out;
reg L4_MemToReg ,L4_RegWrite;
reg [2:0] L4_regwradd;

always @(*) begin
    L4_alu_out <= alu_out;
    L4_mem_out <= mem_out;
    L4_MemToReg <= MemToReg;
    L4_RegWrite <= L3_Regwrite;
    L4_regwradd <= L3_regwradd;
end

always @(posedge clk2) begin
    alu_in <= L4_alu_out;
    mem_in <= L4_mem_out;
    MemToRegmux <= L4_MemToReg;
    RegWrite <= L4_RegWrite;
    regwradd = L4_regwradd;
end
    
endmodule
