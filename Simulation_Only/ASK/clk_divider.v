`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 24.03.2026 15:38:21
// Module Name: clk_divider
// Project Name: Amplitude Shift Keying (ASK) / On Off Keying (OOK)
// Target Devices: xc7a35tcpg236-1 (Artix-7 Basys 3 Board)
// Tool Versions: Vivado 2018.2
// Description: 
// 
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Basic Clock Divider module, max_count = inbuilt_frequency / (2 * desired_output_frequency)
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
