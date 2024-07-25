module adder(in1,in2,out);
    //Basic adder module for two inputs and one output
    input [7:0] in1,in2;
    output [7:0] out;
    assign out = in1 + in2;
endmodule