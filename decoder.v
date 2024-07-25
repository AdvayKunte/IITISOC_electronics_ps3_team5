module decoder(inst,ra_i,rb_i, rd_i,immi,immj,opfn);
    input [15:0] inst;
    output [2:0] ra_i, rb_i , rd_i ;
    output [6:0] immi;
    output [7:0] immj;

    //Taking the instruction as the input and then taking various useful components out of the 16 bit instruction
    //relevant levant for further instructions

    output reg [4:0] opfn;
    assign ra_i = inst[5:3];
    assign rb_i = inst[2:0];
    assign rd_i = inst[8:6];
    assign immi = inst[12:6];
    assign immj = inst[7:0];

    //Assigning opfn signal based on the OpCode of instruction and ALUFn , which specifies task of instruction

    always @ (inst)
        begin
        opfn[4:2]=inst[15:13];  
        if(inst[15:13]==0)
            opfn[1:0]= inst[12:11];
        else 
            opfn[1:0]= 2'bxx;
        end
endmodule