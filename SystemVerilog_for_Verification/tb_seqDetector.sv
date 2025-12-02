`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2025 16:18:32
// Design Name: 
// Module Name: tb_seqDetector
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


module tb_seqDetector();
    
    logic clk;
    logic bin;
    wire out;
    
    longint unsigned i;
    reg [1:0] r = 0;
        
    seqDetector SD
    (
        .clk(clk),
        .bin(bin),
        .out(out)
    );
    
    always #5 clk <= ~clk;
    
    initial
    begin
        clk <= 0;   bin <= 0;
        
        for(i = 0; i < 100000; i++)
        begin
            @(posedge clk)
            begin
                r = $urandom_range(0,2);
                case (r)
                    0   :   bin <= 1'b0;
                    1   :   bin <= 1'b1;
                    2   :   bin <= 1'bx;
                endcase
            end
        end
        
    #1000; 
    $finish; 
    end
    
endmodule
