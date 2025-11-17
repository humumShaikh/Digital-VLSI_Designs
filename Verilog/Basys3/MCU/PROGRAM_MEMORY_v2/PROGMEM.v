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
// Description: This is the program memory that is supposed to hold all the opcodes i.e. the program instructions for the control unit to read from
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
    
    reg [7:0] PROM [0:31];

    
    initial
    begin
        PROM[0]  <= 8'h11;
        PROM[1]  <= 8'h12;
        PROM[2]  <= 8'h01;
        PROM[3]  <= 8'h13;
        PROM[4]  <= 8'h07;
        PROM[5]  <= 8'h14;
        PROM[6]  <= 8'h86;
        PROM[7]  <= 8'h00;
        PROM[8]  <= 8'h00;
        PROM[9]  <= 8'h00;
        PROM[10] <= 8'h00;
        PROM[11] <= 8'h00;
        PROM[12] <= 8'h00;
        PROM[13] <= 8'h00;
        PROM[14] <= 8'h00;
        PROM[15] <= 8'h00;
        PROM[16] <= 8'h00;
        PROM[17] <= 8'h00;
        PROM[18] <= 8'h00;
        PROM[19] <= 8'h00;
        PROM[20] <= 8'h00;
        PROM[21] <= 8'h00;
        PROM[22] <= 8'h00;
        PROM[23] <= 8'h00;
        PROM[24] <= 8'h00;
        PROM[25] <= 8'h00;
        PROM[26] <= 8'h00;
        PROM[27] <= 8'h00;
        PROM[28] <= 8'h00;
        PROM[29] <= 8'h00;
        PROM[30] <= 8'h00;
        PROM[31] <= 8'h00;
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
