`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 08.11.2025 22:07:59
// Design Name: 
// Module Name: spi
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


module spi(
    input wire clk,
    input wire start,
    input wire [7:0] data_in,
    input wire miso,
    output reg mosi
    );
    
    reg [7:0] data;
    reg [2:0] count = 0;
    reg flag = 0;
    
    initial mosi <= 0;
    
    always @(posedge start)
    begin
    if(start)
    begin
        if(count == 0) flag <= 1;
    end
    end
    
    
    always @(posedge clk)
    begin
    
    if(flag == 1)
    begin
        if(count != 7)
        begin
        mosi <= data[7];
        data <= data << 1;
        end
        
        else if(count == 7)
        begin
        mosi <= data[7];
        data <= data << 1;
        end
    end
    
    end
    
    
    always @(negedge clk)
    begin
    
    if(flag == 1)
    begin
        if(count != 7) 
        begin
        data[0] <= miso;
        end
        
        else if(count == 7)
        begin
        data[0] <= miso;
        count <= 0;
        end
        
        count <= count + 1;
    end
    end
    
endmodule
