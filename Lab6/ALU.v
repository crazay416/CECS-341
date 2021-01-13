module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUCntl,
    output reg [31:0] ALUout,
    output reg C,       //Carryout
    output reg N,       //Negative
    output Z,           //Zero
    output reg V        //Overflow
    );
    
    reg signed [31:0] A_s, B_s;
    assign Z = (ALUout == 32'b0) ? 1'b1 : 1'b0;
    
    always@(*) begin
        A_s = A;
        B_s = B;
        case(ALUCntl)  
            4'b0000: begin      //AND                                 
                        {V,C,ALUout} = {2'bx, (A & B)};     //Assign x to V & C since they're not important. A & B are assigned to ALUout
                        N = ALUout[31];                     
                     end  
            4'b0001: begin      //OR                                        
                        {V,C,ALUout} = {2'bx, (A | B)};
                        N = ALUout[31];
                     end  
            4'b0011: begin      //XOR                                        
                        {V,C,ALUout} = {2'bx, (A ^ B)};
                        N = ALUout[31];
                     end                                         
            4'b0010: begin      //ADD UNSIGNED                                       
                        {C,ALUout} = A + B;
                        V = C;
                        N = 1'b0;        
                     end  
            4'b0110: begin      //SUB UNSIGNED                                      
                        {C,ALUout} = A - B;
                        V = C;
                        N = 1'b0;
                     end  
            4'b1100: begin      //NOR                                        
                        {V,C,ALUout} = {2'bx, ~(A | B)};
                        N = ALUout[31];
                     end  
            4'b0111: begin      //NOT                                        
                        {V,C,ALUout} = {2'bx, ~A};
                        N = ALUout[31];
                     end  
            4'b1101: begin      //SHIFT LEFT LOGICAL                                        
                        {C,ALUout} =  A<<1 ;
                        N = ALUout[31];
                     end     
            4'b1010: begin      //ADD SIGNED                 
                        {C, ALUout} = A_s + B_s;    //Cocatenate C & ALOut and asignning it
                        if((A_s[31] & B_s[31] & ~ALUout[31]) || (~A_s[31] & ~B_s[31] & ALUout[31]))
                            V = 1'b1;       //Assign 1 to overflow
                        else
                            V = 1'b0;       //Assign 0 to overflow
                        N = ALUout[31];
                     end
            4'b1110: begin      //SUB SIGNED                                        
                        {C, ALUout} = A_s - B_s;   
                        if((A_s[31] & ~B_s[31] & ~ALUout[31])  || (A_s[31] & B_s[31] & ~ALUout[31]) ||
                           (~A_s[31] & B_s[31] & ALUout[31]) || (~A_s[31] & ~B_s[31] & ALUout[31]))
                            V = 1'b0;       
                        else
                            V = 1'b1;      
                        N = ALUout[31];
                     end               
            4'b1001: begin      //XOR                                        
                        {V,C,ALUout} = {2'bx, (A ^ B)};
                        N = ALUout[31];
                     end    
            4'b0101: begin      //SET LESS THAN                                      
                        if (A_s < B_s)
                            ALUout = 1'b1;
                        else
                            ALUout = 1'b0;
                      
                        {V,C} = {2'bx};
                        N = ALUout[31];
                     end 
            4'b1111: begin      //SET LESS THAN UNSIGNED                                       
                        if (A < B)
                            ALUout = 1'b1;
                        else
                            ALUout = 1'b0;
                      
                        {V,C} = {2'bx};
                        N = ALUout[31];   
                     end     
        endcase                
    end
endmodule
