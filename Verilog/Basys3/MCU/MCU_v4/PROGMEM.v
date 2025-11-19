`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 14.11.2025 22:46:38
// Design Name: 
// Module Name: PROGMEM
// Project Name: 
// Target Devices: xc7a35tcpg236-1    (Basys3)
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
    input wire read_enable,
    input wire [7:0] read_address,
    output reg [7:0] read_data
    );
    
    reg [7:0] PROM [0:63];

    
    initial
    begin
        PROM[0]  <= 8'h11;
        PROM[1]  <= 8'h12;
        PROM[2]  <= 8'h01;
        PROM[3]  <= 8'h13;
        PROM[4]  <= 8'h07;
        PROM[5]  <= 8'h14;
        PROM[6]  <= 8'h86;
        PROM[7]  <= 8'h13;
        PROM[8]  <= 8'hF1;
        PROM[9]  <= 8'h14;
        PROM[10] <= 8'hF1;
        PROM[11] <= 8'h13;
        PROM[12] <= 8'hF6;
        PROM[13] <= 8'h14;
        PROM[14] <= 8'hC8;
        PROM[15] <= 8'h15;
        PROM[16] <= 8'h99;
        PROM[17] <= 8'hAB;
        PROM[18] <= 8'hCD;
        PROM[19] <= 8'hEF;
        PROM[20] <= 8'h16;
        PROM[21] <= 8'h17;
        PROM[22] <= 8'h99;
        PROM[23] <= 8'hAB;
        PROM[24] <= 8'hCD;
        PROM[25] <= 8'hEF;
        PROM[26] <= 8'h03;
        PROM[27] <= 8'h13;
        PROM[28] <= 8'h69;
        PROM[29] <= 8'h14;
        PROM[30] <= 8'h69;
        PROM[31] <= 8'h18;
        PROM[32] <= 8'h03;
        PROM[33] <= 8'h19;
        PROM[34] <= 8'h00;
        PROM[35] <= 8'h00;
        PROM[36] <= 8'h00;
        PROM[37] <= 8'h00;
    end
    
    
    always @(posedge clk)
    begin //
        if(read_enable == 1)
        begin //-//
            read_data <= PROM[read_address];
        end //-//
        
        else read_data <= read_data;
    end //
    
    
endmodule
