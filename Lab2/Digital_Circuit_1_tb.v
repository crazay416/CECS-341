`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2020 08:07:37 AM
// Design Name: 
// Module Name: Digital_Circuit_1_tb
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


module Digital_Circuit_1_tb();

    // input of UUT
    reg A_tb, B_tb, C_tb;
    
    // This will be for for loop
    integer i;
    
    wire F1_tb;
    
    // Instantiate UUT
    Digital_Circuit_1 uut(.A(A_tb), .B(B_tb), .C(C_tb), .F(F1_tb));
    
    // Initiate Test Beanch
   
    
    initial begin
       /*
        $timeformat(-9, 1, " ns", 9);
        A_tb = 1'b0; B_tb = 1'b0; C_tb = 1'b0;
        #5 $display("time = %t A_tb = %0b B_tb = %0b C_tb = %0b || F1 = %0b", $time, A_tb, B_tb, C_tb, F_tb);
        
        A_tb = 1'b0; B_tb = 1'b0; C_tb = 1'b1;
        #5 $display("time = %t A_tb = %0b B_tb = %0b C_tb = %0b || F1 = %0b", $time, A_tb, B_tb, C_tb, F_tb);
        
        A_tb = 1'b0; B_tb = 1'b1; C_tb = 1'b0;
        #5 $display("time = %t A_tb = %0b B_tb = %0b C_tb = %0b || F1 = %0b", $time, A_tb, B_tb, C_tb, F_tb);
        
        
        $finish;
        */
        
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        // Define Test Cases
        for(i = 0; i < 8; i = i + 1) begin
            {A_tb, B_tb, C_tb} = i;
            #5 $display("time = %t, A_tb = %0b, B_tb = %0b, C_tb = %0b || F1_tb = %0b", $time, A_tb, B_tb, C_tb, F1_tb);
        end
        
        $finish;
    end
    
endmodule
