`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 20.11.2025 07:36:16
// Design Name: 
// Module Name: counter
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


module counter(
    input wire clk,
    input wire write_enable,      //1 for write , 0 for read
    input wire [7:0] address,
    input wire [7:0] write_data,
    output reg [7:0] read_data
    );
    
    reg [7:0] C3;
    reg [7:0] C2;
    reg [7:0] C1;
    reg [7:0] C0;
    reg [7:0] misc;
    
    always @(posedge clk)
    begin
        if(misc[0] == 1) {C3,C2,C1,C0} <= {C3,C2,C1,C0} + 1;
        
        if(write_enable == 1)
        begin
            case (address)
            8'h04   :   C3 <= write_data;
            8'h05   :   C2 <= write_data;
            8'h06   :   C1 <= write_data;
            8'h07   :   C0 <= write_data;
            8'h08   :   misc <= write_data;
            endcase
        end
        
        else
        begin
            case (address)
            8'h04   :   read_data <= C3;
            8'h05   :   read_data <= C2;
            8'h06   :   read_data <= C1;
            8'h07   :   read_data <= C0;
            endcase
        end
    end 
    
    
endmodule
