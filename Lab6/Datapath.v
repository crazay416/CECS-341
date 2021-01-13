`timescale 1ns / 1ps

module Datapath(
    input clk,
    input reset,
    output [31:0] D_out
    );

    
    wire[3:0] Cntl_out;
    wire[31:0] PC_out;
    wire[31:0] PCAdder_out;
    wire [31:0] r_s, r_t;
    wire[31:0] Inst_out;
    wire[31:0] ALU_out;
    wire  zero, overflow, carry,negative, regWrite;
    
    // WIRES ADDED FROM LAB 5
    wire [31:0] sign_OUT;
    wire [31:0] shift_OUT;
    wire [31:0] adder2_OUT;
    wire [31:0] read_d_out;
    
    
    // NEW WIRES FROM LAB 6
    wire [31:0] jumpAddr;
    

    
    // Tester
    wire to_mux;
    
    //  NEW MUX FROM LAB 6
    wire [31:0] jumpMux;
    
    // MUXES ADDED FROM LAB 5
    wire[31:0] branch_mux;      // Adder MUX
    wire[4:0] regDST_mux;       // Control RegDST MUX
    wire[31:0] mem_mux;         // Data Memory Mux
    wire[31:0] ALUSrc_mux;      // Mux for ALU
    
    
    // CONTROL UNIT FROM LAB 5
    wire regDst;
    wire[1:0] branch;
    wire memRead;
    wire memToReg;
    wire memWrite;
    wire ALUSrc;
    
    
    // NEW CONTROL UNIT FROM LAB 6
    wire jump;
 
    
    // WIRE FOR BRANCH MUX FROM LAB 5
    assign to_mux = (branch[0] & zero) ^ ((~zero) & branch[1]);
    
    // MUXES ASSIGNED FROM LAB 5
    assign regDST_mux = regDst ? Inst_out[15:11] : Inst_out[20:16];
    assign mem_mux = memToReg ? read_d_out : ALU_out;
    assign ALUSrc_mux = ALUSrc ? sign_OUT : r_t;
    assign branch_mux = to_mux ? adder2_OUT : PCAdder_out;
    
    
    // ASSIGN NEW WIRE FROM LAB 6
    assign jumpAddr = {PCAdder_out[31:28], Inst_out[25:0], 2'b0};
    
    // NEW MUX FROM LAB 6
    assign jumpMux = (jump) ? jumpAddr : branch_mux;
    
    assign D_out = ALU_out;
    
    
    PC pc(.clk(clk),
          .reset(reset),
          .D_in(jumpMux),
          .D_out(PC_out));
    
          
    PCADD pca(.PC_in (PC_out),
           .PC_out(PCAdder_out));
    
           
    PCADDTWO pca2(.PC_in(PCAdder_out),
                  .instruction(shift_OUT),
                  .PC_out(adder2_OUT));
    
    
    Sign_Extend sd(.instruct_IN(Inst_out[15:0]),
                   .instruct_OUT(sign_OUT));
                   
    
    shiftLeft sl(.instruct_IN(sign_OUT),
                 .instruct_OUT(shift_OUT));
    
           
    Instruction_Memory inst(.Addr(PC_out),
                            .Inst_out(Inst_out));
                            
    
    Control cntl(.Op(Inst_out[31:26]),
                 .Func(Inst_out[5:0]),
                 .ALUCntl(Cntl_out),
                 .RegWrite(regWrite),
                 .RegDst(regDst),
                 .Branch(branch),
                 .MemRead(memRead),
                 .MemtoReg(memToReg),
                 .MemWrite(memWrite),
                 .ALUSrc(ALUSrc),
                 .jump(jump));
    
    
    
    DataMem data(.clk(clk),
                 .mem_wr(memWrite),
                 .mem_rd(memRead),
                 .addr(ALU_out),
                 .wr_data(r_t),
                 .rd_data(read_d_out));
                                  
                 
    regfile32 regfile(.clk(clk),
                      .reset(reset),
                      .D_En(regWrite),
                      .D_Addr(regDST_mux),
                      .S_Addr(Inst_out[25:21]),
                      .T_Addr(Inst_out[20:16]),
                      .D(mem_mux), .S(r_s), .T(r_t));
                      
                      
    ALU alu(.A(r_s),
            .B(ALUSrc_mux),
            .ALUCntl(Cntl_out),
            .ALUout(ALU_out),
            .C(carry),
            .N(negative),
            .Z(zero),
            .V(overflow));
    
endmodule
