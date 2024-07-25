module pc(in,clk,rst,out);
    //Register of 8 bit called program counter storing address of the instruction 
    input clk,rst;
    input [7:0] in;
    output reg [7:0] out;
    always @ (posedge clk or posedge rst)
        if(rst)
            out <= 0;
        else 
            out <= in;
endmodule
