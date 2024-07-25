`timescale 1ns / 1ps

module regfile_mux (RB, RDi, RegDst, RDo);
input [2:0] RB, RDi;
input RegDst;
output reg [2:0]RDo;
always @ (*)
        begin
        case(RegDst)
                1'b0: RDo <= #2 RB;
                1'b1: RDo <= #2 RDi;
                default: ;
        endcase
        end
endmodule