`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2026 15:38:21
// Design Name: 
// Module Name: clk_divider
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


module clk_divider
(
    input   wire    clkin,
    output  reg     clkout
);
    reg [15:0]  maxCount;
    initial 
    begin
        clkout <= 0; 
        maxCount = 0;
    end
    always @(posedge clkin)
    begin
        if(maxCount == 50_000)
        begin
            maxCount <= 0;
            clkout <= ~clkout;
        end
        
        else 
        begin
            maxCount <= maxCount + 1;
        end
    end
endmodule
