`timescale 1ns / 1ps


module shiftLeft(input [31:0] instruct_IN, output [31:0] instruct_OUT);

assign instruct_OUT = instruct_IN << 2;
    

endmodule
