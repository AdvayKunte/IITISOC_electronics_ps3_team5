  `timescale 1ns / 1ps

module mux2x1(mem_in, alu_in, memtoreg_sel, mux_out);
    input wire [7:0] mem_in;
    input wire [7:0] alu_in;
    input wire memtoreg_sel;
    output wire [7:0] mux_out;
    
    assign mux_out = (memtoreg_sel) ? alu_in : mem_in;
endmodule
