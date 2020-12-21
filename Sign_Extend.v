`timescale 1ns / 1ps


module Sign_Extend(input [15:0] instruct_IN, output [31:0] instruct_OUT);   
    
    assign instruct_OUT = {{16{instruct_IN[15]}}, instruct_IN[15:0]}; 

endmodule
