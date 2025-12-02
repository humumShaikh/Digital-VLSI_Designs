`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 02.12.2025 15:52:10
// Design Name: 
// Module Name: seqDetector
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


module seqDetector  //11010 NON-OVERLAPPING
(
    input wire clk,
    input wire bin,
    output wire out
);

    localparam [2:0]    IDLE      = 0,
                        GOT1      = 1,
                        GOT11     = 2,
                        GOT110    = 3,
                        GOT1101   = 4,
                        GOT11010  = 5,
                        BINGO     = 6;
                    
                    
    reg [2:0] state = IDLE;
    

    always_ff @(posedge clk)
    begin
        case (state)
            IDLE        :   if(bin==0) state <= IDLE;   else state <= GOT1;
           
            GOT1        :   if(bin==0) state <= IDLE;   else state <= GOT11;
           
            GOT11       :   if(bin==0) state <= GOT110; else state <= IDLE;
           
            GOT110      :   if(bin==0) state <= IDLE;   else state <= GOT1101;
           
            GOT1101     :   if(bin==0) state <= BINGO;  else state <= IDLE;
           
            BINGO       :   state <= IDLE;
        endcase
    end
    
    
    assign out = (state == BINGO) ? 1'b1 : 1'b0;


endmodule
