# ALU-Open-Source
This Repo contains details of designing and implementing a 8 bit ALU module using Open source ASIC/IC Design tools

## Overview
The primary goal of this project is to create a functional 8-bit ALU using open-source tools for ASIC/IC design. The ALU will perform arithmetic and logical operations on 8-bit binary inputs.

## Operations


ALU Arithmetic and Logic Operations
| ALU_Sel | ALU Operation                               |
|---------|--------------------------------------------|
| 0000    | ALU_Out = A + B;                            |
| 0001    | ALU_Out = A - B;                            |
| 0010    | ALU_Out = A << 1;                           |
| 0011    | ALU_Out = A >> 1;                           |
| 0100    | ALU_Out = A rotated left by 1;             |
| 0101    | ALU_Out = A rotated right by 1;            |
| 0110    | ALU_Out = A and B;                         |
| 0111    | ALU_Out = A or B;                          |
| 1000    | ALU_Out = A xor B;                         |
| 1001   | ALU_Out = 1 if A > B else 0;               |
| 1010    | ALU_Out = 1 if A = B else 0;               |

## Steps For Design
- RTL level Code
- Gate level Schmatic
- Netlist
- Floor/Power Planning
- Placement
- Clock Tree Synthesis

## Tools Used
- [Icarus Verilog](https://bleyer.org/icarus/): A free compiler implementation for the IEEE-1364 Verilog hardware description language
- [Yosys](https://github.com/YosysHQ/yosys): A framework for RTL synthesis tools. It currently has extensive Verilog-2005 support
- [GTKWave](https://gtkwave.sourceforge.net/): GTKWave is a fully featured GTK+ based wave viewer

## RTL level Code

Source code for 8 bit ALU Provided by [fpga4student]
```
module alu(
           input [7:0] A,B,  // ALU 8-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [7:0] ALU_Out, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
    wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0001: // Subtraction
           ALU_Result = A - B ;
        4'b0010: // Multiplication
           ALU_Result = A * B;
        4'b0011: // Division
           ALU_Result = A/B;
        4'b0100: // Logical shift left
           ALU_Result = A<<1;
         4'b0101: // Logical shift right
           ALU_Result = A>>1;
         4'b0110: // Rotate left
           ALU_Result = {A[6:0],A[7]};
         4'b0111: // Rotate right
           ALU_Result = {A[0],A[7:1]};
          4'b1000: //  Logical and 
           ALU_Result = A & B;
          4'b1001: //  Logical or
           ALU_Result = A | B;
          4'b1010: //  Logical xor 
           ALU_Result = A ^ B;
          4'b1011: //  Logical nor
           ALU_Result = ~(A | B);
          4'b1100: // Logical nand 
           ALU_Result = ~(A & B);
          4'b1101: // Logical xnor
           ALU_Result = ~(A ^ B);
          4'b1110: // Greater comparison
           ALU_Result = (A>B)?8'd1:8'd0 ;
          4'b1111: // Equal comparison   
            ALU_Result = (A==B)?8'd1:8'd0 ;
          default: ALU_Result = A + B ; 
        endcase
    end

endmodule

```
## Testbench and Simulation
testbench code for ALU provided by [fpga4student]

```
`timescale 1ns / 1ps  

module tb_alu;
//Inputs
 reg[7:0] A,B;
 reg[3:0] ALU_Sel;

//Outputs
 wire[7:0] ALU_Out;
 wire CarryOut;
 // Verilog code for ALU
 integer i;
 alu dut( .A(A),.B(B),  // ALU 8-bit Inputs                 
          .ALU_Sel(ALU_Sel),// ALU Selection
          .ALU_Out(ALU_Out), // ALU 8-bit Output
          .CarryOut(CarryOut) // Carry Out Flag
     );
    initial begin
    
      $dumpfile("dump.vcd");
      $dumpvars(0, tb_alu);
      
      // hold reset state for 100 ns.
      A = 8'h0A;
      B = 8'h02;
      ALU_Sel = 4'h0;
      
      for (i=0;i<=15;i=i+1)
      begin
       ALU_Sel = ALU_Sel + 8'h01;
       #10;
      end;
      
      A = 8'hF6;
      B = 8'h0A;
      
    end
endmodule
```

## Simualtion
Simulation of the HDL Code was done using Icarus Verilog and Waveforms was obtained using GTKwave

![Sim](https://github.com/Sourabh-Mallapur/ALU-Open-Source/blob/main/sim/Simuation.PNG)

## Synthesis
S
