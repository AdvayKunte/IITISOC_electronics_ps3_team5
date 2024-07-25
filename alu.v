module alu ( Ra, Rb, alufn, alubeq, alu_out);
    input  [7:0] Ra;
    input  [7:0] Rb;
    input  [2:0] alufn;
    output reg  alubeq;
    output reg [7:0] alu_out;
    
//Based on the control signal alufn , the alu_out is computed from Ra, Rb values
always @(*) begin
    case (alufn)
        3'b000: begin
          alu_out <= Ra + Rb; alubeq <= 0;      //Addition
          end
        3'b001: begin
          alu_out <= Ra - Rb; alubeq <= 0;      //Subtraction
          end
        3'b010: begin
            alu_out <= Ra & Rb ; alubeq <= 0;   //AND
            end
        3'b011: begin
            alu_out <= Ra | Rb;alubeq <= 0;     //OR
            end
        3'b100: begin
            alu_out <= Ra + Rb; alubeq <= 0; // Addition (Useful for branching)
            end
        3'b101: begin
            alu_out <= Ra + Rb; alubeq <= 0; // Addition  (Useful for load word)
            end
        3'b110: begin
            alu_out <= Ra + Rb; alubeq <= 0; //Addition (Useful for store word)
            end
        3'b111: begin
           if (Ra==Rb) begin
            alubeq <= 0;                //Comparison , checks if A = B ?
           end
           else begin
            alubeq <= 1;
           end
            
        end
        default: ;
    endcase
    
end
    
endmodule


