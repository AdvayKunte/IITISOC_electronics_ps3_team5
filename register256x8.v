 `timescale 1ns / 1ns

module register256x8 (clk, mem_read,mem_write, aluout_in,address_in, memtoreg_out);
    input wire clk;            
    input wire mem_read;        
    input wire mem_write;       
    input wire [7:0] aluout_in;   // Input from ALU
    input wire [7:0] address_in;   // Address input from Register File
    output reg [7:0] memtoreg_out;   // Output to Mux

    reg [7:0] memory_array [255:0];  // 256 registers of 8 bits 
    
    always @(posedge clk) 
    begin
        if (mem_write) 
        begin
            memory_array[address_in] <=  aluout_in;
        end
    end
    always @(*)
    begin
      if (mem_read) 
        begin
            memtoreg_out <=  memory_array[address_in];
        end
    end
endmodule