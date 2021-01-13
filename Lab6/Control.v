module Control (
    input [5:0] Op,
    input [5:0] Func,
    output reg [3:0] ALUCntl,
    output reg RegWrite,
    output reg RegDst,
    output reg [1:0] Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUSrc,
    output reg jump
    );
    
    always@(*) begin
        if (Op == 6'b0) begin
            RegWrite = 1'b1;
            RegDst = 1'b1;
            Branch = 2'b0;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            MemWrite = 1'b0;
            ALUSrc = 1'b0;
            jump = 1'b0;
            
            case(Func)
                6'h20: ALUCntl = 4'b1010;   //ADD
                6'h21: ALUCntl = 4'b0010;   //ADD UNSIGNED
                6'h22: ALUCntl = 4'b1110;   //SUB
                6'h23: ALUCntl = 4'b0110;   //SUB UNSIGNED
                6'h24: ALUCntl = 4'b0000;   //AND 
                6'h25: ALUCntl = 4'b0001;   //OR
                6'h26: ALUCntl = 4'b1001;   //XOR 
                6'h27: ALUCntl = 4'b1100;   //NOR
                6'h2A: ALUCntl = 4'b0101;   //SET LESS THAN 
                6'h2B: ALUCntl = 4'b1111;   //SET LESS THAN UNSIGNED 
                default: ALUCntl = 4'b0000;
            endcase
        end
        
        else begin
            case(Op)
            
                6'h08: begin                     // ADD IMMEDIATE
                            RegWrite = 1'b1;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b1010;   // ADD
                       end
                
                6'h09: begin                    // ADD IMMEDIATE UNSIGNED
                            RegWrite = 1'b1;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b0010;   //ADD UNSIGNED
                        end
                
                6'h0C: begin                    // AND IMMEDIATE
                            RegWrite = 1'b1;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b0000;   // AND
                        end
                     
                6'h0D: begin                    // OR IMMEDIATE
                            RegWrite = 1'b1;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b0001;  // OR
                        end
            
                6'h23: begin                    // LOAD WORD
                            RegWrite = 1'b1;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b1;
                            MemtoReg = 1'b1;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b1010;  // ADD
                        end
                
                6'h2B: begin                    // STORE WORD
                            RegWrite = 1'b0;    // Need help
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b1;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b1010;  // ADD
                       end
                            
                6'h04: begin                    // Branch On Equal
                            RegWrite = 1'b0;
                            RegDst   = 1'b0;
                            Branch   = 2'b01;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b0;
                            jump     = 1'b0;
                            ALUCntl  = 4'b1110;  // SUB
                        end
                   
                 6'h05: begin                  // Branch Not Equal             
                            RegWrite = 1'b0;    
                            RegDst   = 1'b0;
                            Branch   = 2'b10;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b0;
                            jump     = 1'b0;
                            ALUCntl  = 4'b1110;  // SUB
                        end
                  
                  6'h0A: begin                  // SET LESS THAN IMMEDIATE
                            RegWrite = 1'b1;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b0101;  // SET LESS THAN
                        end
                  
                  6'h0B: begin                  // SET LESS THAN IMMEDIATE UNSIGNED
                            RegWrite = 1'b1;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b1;
                            jump     = 1'b0;
                            ALUCntl  = 4'b1111;  // SET LESS THAN UNSIGNED
                        end
                        
                  6'h02: begin
                            RegWrite = 1'b0;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b0;
                            jump     = 1'b1;
                            ALUCntl  = 4'b0000; 
                         end 
                        
                  default: begin
                            RegWrite = 1'b0;
                            RegDst   = 1'b0;
                            Branch   = 2'b0;
                            MemRead  = 1'b0;
                            MemtoReg = 1'b0;
                            MemWrite = 1'b0;
                            ALUSrc   = 1'b0;
                            ALUCntl  = 4'bx;
                            end
              endcase
         end
     end         
endmodule