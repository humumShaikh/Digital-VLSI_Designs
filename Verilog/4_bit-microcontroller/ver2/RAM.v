`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: COPPERWIRE
// 
// Create Date: 13.10.2025 21:40:24
// Design Name: 
// Module Name: RAM
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


module RAM
    (
        input wire rst,
        input wire [10:0]dataIn,
        input wire [2:0]address,
        output reg [7:0]dataOut
    );
    
    reg [7:0] MEMORY [0:7];
    
    always @(*)
    begin
    
    if(rst)
    begin
        MEMORY[0] <= 0;
        MEMORY[1] <= 0;
        MEMORY[2] <= 0;
        MEMORY[3] <= 0;
        MEMORY[4] <= 0;
        MEMORY[5] <= 0;
        MEMORY[6] <= 0;
        MEMORY[7] <= 0;
        dataOut <= 0;
    end
    
    else 
    begin
        case (dataIn[2:0])
            0   :   MEMORY[0] <= dataIn[10:3];
            1   :   MEMORY[1] <= dataIn[10:3];
            2   :   MEMORY[2] <= dataIn[10:3];
            3   :   MEMORY[3] <= dataIn[10:3];
            4   :   MEMORY[4] <= dataIn[10:3];
            5   :   MEMORY[5] <= dataIn[10:3];
            6   :   MEMORY[6] <= dataIn[10:3];
            7   :   MEMORY[7] <= dataIn[10:3];
        endcase
        
        case (address)
            0   :   dataOut <= MEMORY[0];
            1   :   dataOut <= MEMORY[1];
            2   :   dataOut <= MEMORY[2];
            3   :   dataOut <= MEMORY[3];
            4   :   dataOut <= MEMORY[4];
            5   :   dataOut <= MEMORY[5];
            6   :   dataOut <= MEMORY[6];
            7   :   dataOut <= MEMORY[7];
        endcase
    end
    end
endmodule
