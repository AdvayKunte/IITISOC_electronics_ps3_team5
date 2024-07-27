`timescale 1ns / 1ns
`include "dpnew.v"


module clkgen(clk);
    output reg clk;
    initial clk = 0;
    always #0.5 clk = ~clk;
endmodule

module testbench();
    reg rst;
    wire clk;
    wire [4:0] OpFn;
    wire NIA, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg,RegDst;
    wire [2:0]ALUFn;
    clkgen c1(clk);
    // Instantiate the Datapath module
    Datapath d(
        .clk(clk), 
        .rst(rst)
    );
    
    // Instantiate the controlpath module
    integer i ;
    always @ (posedge clk)
        begin
            $display("Time: %0d , add = %b , inst=%b ",$time, d.tIR, d.tInst);
            $display("Time: %0d : RegA=%b , RegB=%b , RegC=%b, RegD=%b, RegE=%b ,Mem[22]=%b",$time,d.RF.RegFile[1],d.RF.RegFile[2],d.RF.RegFile[3], d.RF.RegFile[4], d.RF.RegFile[5],d.MEM.memory_array[22]);
        end 
    initial 
        begin

            d.IR.mem[0]= 16'b0010001100000001;  // Set A to 12
            d.IR.mem[1]= 16'b0010000111000010;  //Set B to 7 -> (addi RegB with Reg0) 
            d.IR.mem[2]= 16'b0000100100001010;  //D = A - B
            d.IR.mem[3]= 16'b0000000011001010;  //C = A + B
            d.IR.mem[4]= 16'b0000000101011100;  //E = C + D
            d.IR.mem[5]= 16'b0110010110000101;  // Store E on Mem[22]      
            d.IR.mem[6]= 16'b1000000011000010;  //Check if B == 0
            d.IR.mem[7]= 16'b0010000000000011;  //In case B is 0 set C to 0
            d.IR.mem[8]= 16'b0100010110000100;  //Retrieve Mem[22] and store in D
            d.IR.mem[9]= 16'b0001000001011010;  //A = B&C
        //    d.IR.mem[10]= 16'b1010000000000000; //Jump to 0 again

        // Instantiating memory with values corresponding to address
            for(i=0;i<256;i=i+1)
                begin
                d.MEM.memory_array[i] = i;
                end 
            $dumpfile("mp.vvp");
            $dumpvars(0,testbench);
            rst = 1;
            #4
            rst =0;
            #60
            $finish;
        end
endmodule
