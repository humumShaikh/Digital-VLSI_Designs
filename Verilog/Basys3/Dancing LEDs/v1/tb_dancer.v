`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2025 10:47:54
// Design Name: 
// Module Name: tb_dancer
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


module tb_dancer();

    reg clk;
    reg reset;
    reg direction;                               // left - 0 // right - 1
    reg [1:0] delay;                             // 50ms - 00   100ms - 01  200ms - 10  400ms - 11
    wire [15:0] LED = 16'b0000_0000_0000_0001;
    
    dancer D (
        .clk(clk),
        .reset(reset),
        .direction(direction),
        .delay(delay),
        .LED(LED)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        $display("Dancing LED's");
        clk = 0;    reset = 0;  direction = 0;
        //your code here
    end

endmodule
