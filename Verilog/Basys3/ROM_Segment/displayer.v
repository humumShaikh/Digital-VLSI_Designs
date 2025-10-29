`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 29.10.2025 10:25:10
// Design Name: 
// Module Name: decoder
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

module displayer
    (
        input wire clk,
        input wire [7:0] Td,Ud,
        output reg [3:0] segment,
        output reg [7:0] digit
    );
    
    reg [1:0] dcount = 0;
    
    reg [18:0] max_count = 10_000;
    reg [18:0] count = 0;
    
    always @(posedge clk)
    begin
    
    if(count==max_count)
    begin
        count <= 0;
        case (dcount)
            0   :   begin
                    segment <= 4'b1110;
                    digit <= Ud;
                    dcount <= dcount + 1;
                    end     
   
            1   :   begin
                    segment <= 4'b1101;
                    digit <= Td;
                    dcount <= 0;
                    end                     
                
        endcase
    end
    
    else count <= count + 1; 
    
    end
    
    
endmodule
