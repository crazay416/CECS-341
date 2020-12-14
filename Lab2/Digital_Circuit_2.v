`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2020 09:22:42 AM
// Design Name: 
// Module Name: Digital_Circuit_2
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


module Digital_Circuit_2(input A, B, C, output F2);

    reg F2;
    
    always @(A, B)
    begin
        F2 = (~A | B) & (A | ~B);
    end


endmodule
