# ALU-Open-Source
This Repo contains details of designing and implementing a 8 bit ALU module using Open source ASIC/IC Design tools

## Overview
The primary goal of this project is to create a functional 8-bit ALU using open-source tools for ASIC/IC design. The ALU will perform arithmetic and logical operations on 8-bit binary inputs.
Source code for 8 bit ALU + tb Provided by [fpga4student](https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html)

## Operations


ALU Arithmetic and Logic Operations
| ALU_Sel | ALU Operation                             |
|--------|--------------------------------------------|
| 00    | ALU_Out = A + B;                            |
| 01    | ALU_Out = A - B;                            |
| 10    | ALU_Out = A << 1;                           |
| 11    | ALU_Out = A >> 1;                           |

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

```Verilog
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

```
## Testbench and Simulation

```Verilog
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
      
      for (i=0;i<=5;i=i+1)
      begin
       #10;
       ALU_Sel = ALU_Sel + 2'b01;
      end;      
    end
endmodule
```

## Simualtion
Simulation of the HDL Code was done using Icarus Verilog and Waveforms was obtained using GTKwave

![Sim](https://github.com/Sourabh-Mallapur/ALU-Open-Source/blob/main/sim/sim.PNG)

## Synthesis
S
