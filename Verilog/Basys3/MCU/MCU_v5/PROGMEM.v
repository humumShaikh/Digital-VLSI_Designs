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
        ROM[1] <= 8'h15;
        ROM[2] <= 8'h99;
        ROM[3] <= 8'hAB;
        ROM[4] <= 8'hCD;
        ROM[5] <= 8'hEF;
        ROM[6] <= 8'h15;
        ROM[7] <= 8'h12;
        ROM[8] <= 8'h34;
        ROM[9] <= 8'h56;
        ROM[10] <= 8'h78;
        ROM[11] <= 8'h17;
        ROM[12] <= 8'h12;
        ROM[13] <= 8'h34;
        ROM[14] <= 8'h56;
        ROM[15] <= 8'h78;
        ROM[16] <= 8'h01;
        ROM[17] <= 8'h00;
        ROM[18] <= 8'h00;
        ROM[19] <= 8'h00;
        ROM[20] <= 8'h00;
        ROM[21] <= 8'h00;
        ROM[22] <= 8'h00;
        ROM[23] <= 8'h00;
        ROM[24] <= 8'h00;
        ROM[25] <= 8'h00;
    end
    
    always @(posedge clk)
    begin
        if(read_enable == 1)
        begin
            read_data <= ROM[read_address];
        end
    end
    
endmodule
