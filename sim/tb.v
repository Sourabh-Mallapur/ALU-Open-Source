`timescale 1ns / 1ps  

module tb_alu;
//Inputs
 reg[3:0] A,B;
 reg[1:0] ALU_Sel;

//Outputs
 wire[3:0] ALU_Out;
 // Verilog code for ALU
 integer i;
 alu dut( .A(A),.B(B),  // ALU 8-bit Inputs                 
          .ALU_Sel(ALU_Sel),// ALU Selection
          .ALU_Out(ALU_Out) // ALU 8-bit Output
      );
    initial begin
    
      $dumpfile("dump.vcd");
      $dumpvars(0, tb_alu);
      
      // hold reset state for 100 ns.
      A = 4'hA;
      B = 4'h2;
      ALU_Sel = 2'b00;
      
      for (i=0;i<=3;i=i+1)
      begin
       #10;
       ALU_Sel = ALU_Sel + 2'b01;
      end;      
    end
endmodule
