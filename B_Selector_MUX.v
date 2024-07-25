 module MUX(inB,imm,sel,outB);
   // 2x1 MUX for 8 bit input - output 
    output [7:0] outB;
    input [7:0] inB,imm;
    input sel;
    assign out=sel?imm:inB;
 endmodule
