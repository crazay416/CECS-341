`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2020 03:18:06 PM
// Design Name: 
// Module Name: Four_Bit_tb
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


module Four_Bit_tb();

    reg[3:0] A_tb, B_tb; 
    reg k_tb;
    
    wire [3:0]sum_tb;
    wire cout_tb;
    
    Four_Bit_Adder_Subtractor uut(.A(A_tb), .B(B_tb), .k(k_tb), .c_out(cout_tb), .sum(sum_tb));
    
    
    initial begin
        $timeformat(-9, 1, " ns", 9);
        
        // Adding, results should come out to 0010 since 1 + 1 = 2
        A_tb = 4'b0001; B_tb = 4'b0001; k_tb = 1'b0;
        #5 $display("time = %time, A_tb = %b, B_tb = %b, k_tb = %b, || cout_tb = %b, sum_tb = %b", $time, A_tb, B_tb, k_tb, cout_tb, sum_tb);
        
        
        // Subtrating, results should come out as 0001 since 2 - 1 = 1
        A_tb = 4'b0010; B_tb = 4'b0001; k_tb = 1'b1;
        #5 $display("time = %time, A_tb = %b, B_tb = %b, k_tb = %b, || cout_tb = %b, sum_tb = %b", $time, A_tb, B_tb, k_tb, cout_tb, sum_tb);
        
        
        // Adding 8 and 8 together and comes out to 16
        // Since it only supports to 15, it overflows and cout is 1
        // The four bits in sum are all zeros
        A_tb = 4'b1000; B_tb = 4'b1000; k_tb = 1'b0;
        #5 $display("time = %time, A_tb = %b, B_tb = %b, k_tb = %b || cout_tb = %b, sum_tb = %b", $time, A_tb, B_tb, k_tb, cout_tb, sum_tb);
        
        
        $finish;
    end

endmodule
