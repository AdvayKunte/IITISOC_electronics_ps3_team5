module controlpath(OpFn,clk,NIA,RegDst,RegWrite,ALUSrc,ALUFn,MemWrite,MemRead,MemToReg);

    //Defining all the control signals as output , and the OpFn signal and clk signal as input

    input clk;
    output reg NIA,RegWrite,ALUSrc,MemWrite,MemRead,MemToReg,RegDst;
    output reg [2:0] ALUFn;
    input [4:0] OpFn;

    //Based on the OpFn part of the instruction , given by the decoder , control unit assigns values to all the signals

    always @ ( OpFn)
        case(OpFn[4:2])
            3'b000: begin
                    case(OpFn[1:0])
                        2'b00: begin
                                MemToReg<=1;RegDst <= 1;RegWrite <=1 ;ALUFn <=3'b000 ;
                                MemRead<=0;MemWrite<=0;  ALUSrc <= 0; NIA <=1;                             
                               end
                        2'b01: begin
                                MemToReg<=1;RegDst <= 1;RegWrite <=1 ;ALUFn <=3'b001 ;
                                MemRead<=0;MemWrite<=0;  ALUSrc <= 0; NIA <=1;   
                               end
                        2'b10: begin
                                MemToReg<=1;RegDst <= 1;RegWrite <=1 ;ALUFn <=3'b010 ;
                                MemRead<=0;MemWrite<=0;  ALUSrc <= 0; NIA <=1;  
                               end
                        2'b11: begin
                                MemToReg<=1;RegDst <= 1;RegWrite <=1 ;ALUFn <=3'b011 ;
                                MemRead<=0;MemWrite<=0;  ALUSrc <= 0; NIA <=1; 
                               end
                    endcase
                    end
            3'b001: begin
                    MemToReg<=1;RegDst <= 0;RegWrite <=1 ;ALUFn <=3'b100 ;
                    MemRead<=0;MemWrite<=0;  ALUSrc <= 1; NIA <=1;                                
                    end
            3'b010: begin
                    MemToReg<=0;RegDst <= 0;RegWrite <=1 ;ALUFn <=3'b101 ;
                    MemRead<=1;MemWrite<=0;  ALUSrc <= 1; NIA <=1;                            
                    end
            3'b011: begin
                    MemToReg<=0;RegDst <= 0;RegWrite <=0 ;ALUFn <=3'b110 ;
                    MemRead<=0;MemWrite<=1;  ALUSrc <= 1; NIA <=1;                               
                    end
            3'b100: begin
                    MemToReg<=0;RegDst <= 0;RegWrite <=0 ;ALUFn <=3'b111 ;
                    MemRead<=0;MemWrite<=0;  ALUSrc <= 0; NIA <=1;                               
                    end
            3'b101: begin
                    MemToReg<=0;RegDst <= 0;RegWrite <=0 ;ALUFn <=3'b000 ;
                    MemRead<=0;MemWrite<=0;  ALUSrc <= 0; NIA <=0;                              
                    end
        endcase
endmodule

