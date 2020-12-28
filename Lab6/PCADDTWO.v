`timescale 1ns / 1ps

module PCADDTWO(input [31:0] PC_in, input [31:0] instruction, output [31:0] PC_out);

assign PC_out = PC_in + instruction;

endmodule
