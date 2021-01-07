module PC(input clk, 
          input reset, 
          input [31:0] D_in, 
          output reg[31:0] D_out
          );
    
    always@(posedge clk) begin
        if (reset == 1)
            D_out <= 32'b0;
        else
            D_out <= D_in;
    end
endmodule