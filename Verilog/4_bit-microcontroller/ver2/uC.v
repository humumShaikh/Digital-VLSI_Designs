`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: COPPERWIRE
// 
// Create Date: 15.10.2025 22:25:26
// Design Name: 
// Module Name: uC
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


module uC
    (
        input wire sin,
        input wire clk,
        input wire rst,
        input wire en,
        input wire [2:0]address,
        output wire [7:0]dataOut
    );
    
    wire [11:0]DIN;
    wire [7:0]DOUT;
    
    wire [2:0]progMemAdd;
    wire [15:0]progDataIn;
    wire [10:0]dataRAMOut;
            
    ALU alu (DIN , DOUT);
    
    CU cu (en,clk,rst,progMemAdd,progDataIn,DIN,DOUT,dataRAMOut);
    
    PROGRAM_MEMORY program_memory (sin,clk,en,progMemAdd,progDataIn);
    
    RAM ram (rst,dataRAMOut,address,dataOut);
    
endmodule
