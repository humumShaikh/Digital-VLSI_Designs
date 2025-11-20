`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 09:57:24
// Design Name: 
// Module Name: PROGMEM
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


module PROGMEM(
    input wire clk,
    input wire [7:0] read_address,
    input wire read_enable,
    
    output reg [7:0] read_data
    );
    
    reg [7:0] ROM [0:127];
    
    initial begin
        ROM[0] <= 8'h11;
        ROM[1] <= 8'h18;
        ROM[2] <= 8'h0E;
        ROM[3] <= 8'h18;
        ROM[4] <= 8'h0C;
        ROM[5] <= 8'h18;
        ROM[6] <= 8'h0A;
        ROM[7] <= 8'h18;
        ROM[8] <= 8'h11;
        ROM[9] <= 8'h00;
        ROM[10] <= 8'h18;
        ROM[11] <= 8'h07;
        ROM[12] <= 8'h18;
        ROM[13] <= 8'h05;
        ROM[14] <= 8'h18;
        ROM[15] <= 8'h03;
        ROM[17] <= 8'h12;
        ROM[18] <= 8'h01;
        ROM[19] <= 8'h13;
        ROM[20] <= 8'h07;
        ROM[21] <= 8'h14;
        ROM[22] <= 8'h86;
        ROM[23] <= 8'h00;
        ROM[24] <= 8'h00;
        ROM[25] <= 8'h00;
        ROM[26] <= 8'h00;
    end
    
    always @(posedge clk)
    begin
        if(read_enable == 1)
        begin
            read_data <= ROM[read_address];
        end
    end
    
endmodule
