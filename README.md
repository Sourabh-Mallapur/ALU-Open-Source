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
| 0010    | ALU_Out = A * B;                            |
| 0011    | ALU_Out = A / B;                            |
| 0100    | ALU_Out = A << 1;                           |
| 0101    | ALU_Out = A >> 1;                           |
| 0110    | ALU_Out = A rotated left by 1;             |
| 0111    | ALU_Out = A rotated right by 1;            |
| 1000    | ALU_Out = A and B;                         |
| 1001    | ALU_Out = A or B;                          |
| 1010    | ALU_Out = A xor B;                         |
| 1011    | ALU_Out = A nor B;                         |
| 1100    | ALU_Out = A nand B;                        |
| 1101    | ALU_Out = A xnor B;                        |
| 1110    | ALU_Out = 1 if A > B else 0;               |
| 1111    | ALU_Out = 1 if A = B else 0;               |

## Steps For Design
- RTL level Code
- Gate level Schmatic
- Netlist
- Floor/Power Planning
- Placement
- Clock Tree Synthesis

## Tools Used
- [Yosys](https://github.com/YosysHQ/yosys): Yosys is a framework for RTL synthesis tools. It currently has extensive Verilog-2005 support
- [Tool2](link2): Description of the tool

## Synthesis
