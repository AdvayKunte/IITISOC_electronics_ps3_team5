`timescale 1ns / 1ns
module instreg(
    input [7:0] add,
    output [15:0] inst
);

    // Instruction register with function to assign instruction by locating in memory based on address
    reg [15:0] mem[255:0];
    assign inst = mem[add];

    //Mechanism for editing the sequence of instructions in instruction register based on the possibility of hazards and hence adding NOPs for countering them
    
    reg [2:0] r2wr;         //Register which stores the address register whose value will be edited
    reg isreg;              //Register storing whether or not any register is being updated
    integer i;
    integer j;


    initial begin
    // Detecting any data hazard bases on Write - Read type of situation for any particualr register
    for (i = 0; i < 256; i = i + 1) begin
        if (mem[i][15:13] == 3'b000) begin          //Arithmetic instruction using register to store result
            r2wr = mem[i][8:6];
            isreg = 1;
        end else if (mem[i][15:13] == 3'b001 || mem[i][15:13] == 3'b010) begin  //Load or Add Immediate instruction to store value on register
            r2wr = mem[i][2:0];
            isreg = 1;
        end else begin
            isreg = 0;
        end
        #1
        //Mitigating control hazard by inserting 2 NOP instruction till next instruction address finalised during branching
        if (mem[i][15:13] == 3'b100) begin
            for (j = 255; j > i+2; j = j - 1) begin         
                mem[j] = mem[j - 2];
            end
            mem[i + 1] = 16'b0000000000000000; // Insert NOP
            mem[i + 2] = 16'b0000000000000000; // Insert NOP
            i = i+3;
            end
        // Adding 3 NOP instructions between two instructions involving write and then read from same register
        if (isreg == 1) begin
            if (mem[i+1][15:13] == 3'b000) begin
                if (mem[i+1][2:0] == r2wr || mem[i+1][5:3] == r2wr) begin
                    for (j = 255; j > i+3; j = j - 1) begin
                        mem[j] = mem[j - 3];
                    end
                    mem[i + 1] = 16'b0000000000000000; // Insert NOP
                    mem[i + 2] = 16'b0000000000000000; // Insert NOP
                    mem[i + 3] = 16'b0000000000000000; // Insert NOP
                    i = i+3;
                end
            end else if (mem[i+1][15:13] == 3'b011) begin
                if (mem[i+1][2:0] == r2wr) begin
                    for (j = 255; j > i+3; j = j - 1) begin
                        mem[j] = mem[j - 3];
                    end
                    mem[i + 1] = 16'b0000000000000000; // Insert NOP
                    mem[i + 2] = 16'b0000000000000000; // Insert NOP
                    mem[i + 3] = 16'b0000000000000000; // Insert NOP
                    i = i+3;
                end
            end
        end
    end 
end  
endmodule
