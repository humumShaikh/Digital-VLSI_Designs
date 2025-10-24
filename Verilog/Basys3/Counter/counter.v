`timescale 1s / 1s
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 09:37:14
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: Basys3    (xc7a35tcpg236-1)
// Tool Versions: 
// Description: Counts seconds from 0 to 59
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input wire bClk,
    input wire reset,
    output reg [5:0]sec
    );
    
    reg [26:0]maxCount = 100_000_000;
    reg [26:0]count = 0;
        
    initial
    begin
        sec <= 0;
    end
    
    always @(negedge bClk)
    begin
        if(~reset)
        begin
            if(count == maxCount)
            begin
                if(sec == 59)
                begin
                    sec <= 0;
                end
                else
                begin
                    sec <= sec + 1;
                end
                
                count <= 0;
            end
            
            else
            begin
                count <= count + 1;
            end
        end
        
        else if(reset)
        begin
            count <= 0;
            sec <= 0;
        end
    end

endmodule
