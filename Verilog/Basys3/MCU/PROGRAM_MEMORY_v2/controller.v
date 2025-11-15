`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 15.11.2025 21:24:18
// Design Name: 
// Module Name: controller
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


module controller(
    input wire clk,
    
    output wire read_enable,
    output reg [7:0] read_address
    );
    
    reg [3:0] count = 0;
    
    always @(posedge clk)
    begin
        case (count)
        
        0   :   begin
                read_address <= 8'h00;
                count <= count + 1;
                end
                
        1   :   begin
                read_address <= 8'h01;
                count <= count + 1;
                end          
                
        2   :   begin
                read_address <= 8'h02;
                count <= count + 1;
                end         
                
        3   :   begin
                read_address <= 8'h03;
                count <= count + 1;
                end         
                
        4   :   begin
                read_address <= 8'h04;
                count <= count + 1;
                end         
                
        5   :   begin
                read_address <= 8'h05;
                count <= count + 1;
                end         
                
        6   :   begin
                read_address <= 8'h06;
                count <= count + 1;
                end         
                
        7   :   begin
                read_address <= 8'h07;
                count <= count + 1;
                end         
                
        8   :   begin
                read_address <= 8'h08;
                count <= count + 1;
                end         
        
        endcase
    end
    
    assign read_enable = clk;
    
endmodule
