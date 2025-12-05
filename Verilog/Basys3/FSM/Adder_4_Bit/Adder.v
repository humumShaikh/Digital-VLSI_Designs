`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 03.11.2025 09:49:13
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: xc7a35tcpg236-1
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Synthesize with the other modules provided as per the diagram to verify it on the FPGA
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder(
    input wire clk,
    input wire reset,
    input wire valid_in,
    input wire [3:0] A,
    input wire [3:0] B,
    output reg [4:0] C,
    output reg valid_out,
    output reg [1:0] state = IDLE
    );
    
    parameter [1:0] IDLE = 0,
                    ADD = 1,
                    DONE = 2;
        
    reg [7:0] a , b;
    
    always @(posedge clk)
    begin
    
    if(reset == 1)
    begin
        state <= IDLE;
        valid_out <= 0;
    end
    
    else if(reset == 0)
    begin
        case (state)
        
        IDLE    :   begin
                        if(valid_in == 1)
                        begin
                        a <= A;
                        b <= B;
                        state <= ADD;
                        end
                    end
                    
        ADD     :   begin
                        C <= a + b;
                        valid_out <= 1;
                        state <= DONE;
                    end          
                    
        DONE    :   begin
                        valid_out <= 0;
                        state <= IDLE;
                    end             
                       
        endcase
        
    end
    
    end
    
endmodule
