`timescale 1ns / 1ns

//Regfile with 8 , 8 bit registers 

module RegFile(RA, RB, RDo, RegWrite, A, B, clk, Mem_to_Reg);
    input [2:0] RA, RB, RDo;
    input RegWrite, clk;
    output reg [7:0] A, B;
    reg [7:0] RegFile [7:0];
    input [7:0] Mem_to_Reg;
    
    // Writing into the write port adress registers based on signal at positive edge of clock

    always @(posedge clk) begin
        if (RegWrite)
            RegFile[RDo] <=  Mem_to_Reg;
    end

    //Reading from register 

    always @(*) begin
        if (RA == 3'b000)
            A = 8'b00000000;        //Register at 000 address by default 0
        else if (RA == 3'b111)
            A = 8'b01111111;        //Register at 111 address by default 127
        else
            A = RegFile[RA];
        
        if (RB == 3'b000)
            B = 8'b00000000;
        else if (RB == 3'b111)
            B = 8'b01111111;
        else
            B = RegFile[RB];
    end
endmodule
