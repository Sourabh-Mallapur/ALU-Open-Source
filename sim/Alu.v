module alu(
           input [3:0] A,B,  // ALU 8-bit Inputs
           input [1:0] ALU_Sel,// ALU Selection
           output [3:0] ALU_Out // ALU 8-bit Output
    );
    reg [3:0] ALU_Result;
    assign ALU_Out = ALU_Result; // ALU out
    always @(*)
    begin
        case(ALU_Sel)
        2'b00: // Addition
           ALU_Result = A + B ;
        2'b01: // Subtraction
           ALU_Result = A - B ;
        2'b10: // Logical shift left
           ALU_Result = A<<1;
        2'b11: // Logical shift right
           ALU_Result = A>>1;
        endcase
    end

endmodule
