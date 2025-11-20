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
        ROM[0]  <= 8'h11;
        ROM[1]  <= 8'h12;
        ROM[2]  <= 8'h01;
        ROM[3]  <= 8'h13;
        ROM[4]  <= 8'h12;
        ROM[5]  <= 8'h14;
        ROM[6]  <= 8'h34;
        ROM[7]  <= 8'h15;
        ROM[8]  <= 8'h00;
        ROM[9]  <= 8'h00;
        ROM[10] <= 8'h00;
        ROM[11] <= 8'h00;
        ROM[12] <= 8'h17;
        ROM[13] <= 8'h00;
        ROM[14] <= 8'hFF;
        ROM[15] <= 8'hFF;
        ROM[16] <= 8'hFF;
        ROM[17] <= 8'h15;
        ROM[18] <= 8'h16;
        ROM[19] <= 8'h18;
        ROM[20] <= 8'h0B;
        ROM[21] <= 8'h13;
        ROM[22] <= 8'h56;
        ROM[23] <= 8'h14;
        ROM[24] <= 8'h78;
        ROM[25] <= 8'h15;
        ROM[26] <= 8'h00;
        ROM[27] <= 8'h00;
        ROM[28] <= 8'h00;
        ROM[29] <= 8'h00;
        ROM[30] <= 8'h17;
        ROM[31] <= 8'h00;
        ROM[32] <= 8'hFF;
        ROM[33] <= 8'hFF;
        ROM[34] <= 8'hFF;
        ROM[35] <= 8'h03;
        ROM[36] <= 8'h16;
        ROM[37] <= 8'h18;
        ROM[38] <= 8'h1E;
        ROM[39] <= 8'h00;
    end
    
    always @(posedge clk)
    begin
        if(read_enable == 1)
        begin
            read_data <= ROM[read_address];
        end
    end
    
endmodule
