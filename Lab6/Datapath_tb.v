`timescale 1ns / 1ps
module Datapath_tb();

    reg clk;
    reg reset;
    
    wire [31:0] D_out;
    
    integer i;
   
    Datapath uut(.clk(clk), .reset(reset), .D_out(D_out));
    
    
    always 
        #10 clk = ~clk;
    
    task Dump_DataMem; begin
        $timeformat(-9, 1, " ns", 9);
        $display("Initial Values:");
        for(i = 0; i < 17; i = i +4) begin
            @(posedge clk)
            $display("t = %t DataAddress = [%0d]: %h%h%h%h", $time, i, uut.data.dmem[i], uut.data.dmem[i + 1], uut.data.dmem[i + 2], uut.data.dmem[i + 3]);
            end
        $display("Final Values:");
        for(i = 20; i < 37; i = i + 4) begin
            @(posedge clk)
            $display("t = %t DataAddress = [%0d]: %h%h%h%h", $time, i, uut.data.dmem[i], uut.data.dmem[i + 1], uut.data.dmem[i + 2], uut.data.dmem[i + 3]);
            end
        end
    endtask
    
    
    initial begin
        clk = 0; reset = 1; #20;
        $readmemh("imem.dat", uut.inst.imem);
        $readmemh("DataMem.dat", uut.data.dmem);
        reset = 0; #900;
        Dump_DataMem;
        $finish;
    end

endmodule