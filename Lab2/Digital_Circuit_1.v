`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2020 08:49:12 AM
// Design Name: 
// Module Name: Digital_Circuit_1
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


module Digital_Circuit_1(input A, B, C, output F);

    reg F;



    always @(A, B, C)
    begin
        F = (A&B) | (~A&C) + (A&~B&~C);
    end



endmodule
