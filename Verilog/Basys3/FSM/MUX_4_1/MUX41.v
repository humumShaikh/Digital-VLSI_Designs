`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 03.11.2025 11:26:27
// Design Name: 
// Module Name: MUX41
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


module MUX41(
    input wire clk,
    input wire reset,
    input wire valid_in,
    input wire [2:0] I3,
    input wire [2:0] I2,
    input wire [2:0] I1,
    input wire [2:0] I0,
    input wire [1:0] S,
    output reg [2:0] Y,
    output reg valid_out,
    output reg [1:0] state
    );
    
    parameter [1:0] IDLE = 0,
                    MUX = 1,
                    DONE = 2;
                    
   reg [3:0] temp;             
    
    
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
                    case (S)
                    0   :   temp <= I0;
                    1   :   temp <= I1;
                    2   :   temp <= I2;
                    3   :   temp <= I3;
                    endcase
                    state <= MUX;
                    end                 
                    end
                    
        MUX     :   begin
                    Y <= temp;
                    state <= DONE;
                    valid_out <= 1;                 
                    end            
                    
        DONE    :   begin
                    state <= IDLE;
                    valid_out <= 0;
                    end               
        endcase
        end
    end
    
    
endmodule
