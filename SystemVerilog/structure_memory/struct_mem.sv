`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2025 12:42:24
// Design Name: 
// Module Name: struct_mem
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

typedef struct {
    logic [7:0] MEM [0:15];
}memory;

module struct_mem(
    input logic clk,
    input logic write,
    input logic read,
    input logic [7:0] write_data,
    input logic [3:0] address,
    output logic [7:0] read_data
    );
    
    memory RAM;                   //instance of structure memory
    
    always_ff @(posedge clk)
    begin
        if(write)
        begin
            RAM.MEM[address] <= write_data;
        end
        
        else if(read)
        begin
            read_data <= RAM.MEM[address];
        end
    end
    
endmodule
