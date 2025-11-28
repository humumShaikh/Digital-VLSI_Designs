`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 27.11.2025 19:06:51
// Design Name: 
// Module Name: spi_slave
// Project Name: 
// Target Devices: xc7a35tcpg236-1
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


module spi_slave(
    input wire clk,
    input wire SS,
    input wire MOSI,
    output wire MISO
    );
    
    reg [7:0] data = 8'h55;
    
    reg [3:0] counter = 8;
    
    reg miso = 0;
    
    reg flag = 0;
    reg flag2 = 0;
    
    assign MISO = miso;
    
    always @(posedge clk)
    begin
        if(~SS && ~flag)
        begin
            flag <= 1;
        end
        
        else if(flag)
        begin
            if(counter >= 1)
            begin
                miso <= data[7];
                data <= data << 1;
            end
            
            else if(counter == 0)
            begin
                flag <= 0;
            end
        end
    end
    
    always @(negedge clk)
    begin
        if(flag && ~flag2)
        begin
            flag2 <= 1;
        end
        
        else if(flag2)
        begin
            if(counter >= 1)
            begin
                data[0] <= MOSI;
                counter <= counter - 1;
            end
            
            else if(counter == 0)
            begin
                flag2 <= 0;
                counter <= 8;
            end
        end
    end
    
endmodule
