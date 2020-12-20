`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2020 02:22:23 PM
// Design Name: 
// Module Name: Digital_Circuit_2A_tb
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


module Digital_Circuit_2A_tb();

    reg A_tb, B_tb;
    
    wire F2_tb;
    
    integer i;
    
    
    Digital_Circuit_2 uut (.A(A_tb), .B(B_tb), .F2(F2_tb));
    
    initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        // Define Test Cases
        for(i = 0; i < 4; i = i+1) begin
            {A_tb, B_tb} = i;
            #5 $display("time = %time, A_tb = %0b, B_tb = %0b || F2_tb = %0b", $time, A_tb, B_tb, F2_tb);
        end
        $finish;
        
     end
        
        
    
    


endmodule
