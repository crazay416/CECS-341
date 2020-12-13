`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2020 02:27:17 PM
// Design Name: 
// Module Name: Four_Bit_Adder_Subtractor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Four_Bit_Adder_Subtractor(input[3:0] A, 
input[3:0] B, 
input k, 
output c_out,
output [3:0]sum);

    wire c0, c1, c2, x_B_0, x_B_1, x_B_2, x_B_3;
    
    assign x_B_0 = B[0] ^ k;
    assign x_B_1 = B[1] ^ k;
    assign x_B_2 = B[2] ^ k;
    assign x_B_3 = B[3] ^ k;
    
    Full_Adder
        FA_0(.A(A[0]), .B(x_B_0), .c_in(k), .c_out(c0), .sum(sum[0])),
        FA_1(.A(A[1]), .B(x_B_1), .c_in(c0), .c_out(c1), .sum(sum[1])),
        FA_2(.A(A[2]), .B(x_B_2), .c_in(c1), .c_out(c2), .sum(sum[2])),
        FA_3(.A(A[3]), .B(x_B_3), .c_in(c2), .c_out(c_out), .sum(sum[3]));




endmodule
