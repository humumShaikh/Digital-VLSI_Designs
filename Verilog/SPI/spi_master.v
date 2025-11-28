`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 27.11.2025 19:06:39
// Design Name: 
// Module Name: spi_master
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


module spi_master(
    input wire clk,
    input wire [7:0] in,
    input wire start,
    output wire SCLK,
    output wire SS,
    output wire MOSI,
    input wire MISO
    );
    
    reg [7:0] data = 0;
    reg sclk = 0;
    reg ss = 1;
    reg mosi = 0;
    reg miso = 0;
    
    reg flag = 0;
    reg flag2 = 0;
    reg [3:0] counter = 8;
    
    assign SCLK = sclk;
    assign SS = ss;
    assign MOSI = mosi;
    
    always @(*) miso <= MISO;
    
    always @(*) sclk <= clk;
    
    always @(posedge clk)
    begin
        if(start)
        begin
            ss <= 0;
            data <= in;
            flag <= 1;
        end
        
        else if(flag)
        begin
            if(counter >= 1)
            begin
              mosi <= data[7];
              data <= data << 1;  
            end
            
            else if(counter == 0)
            begin
                flag <= 0;
                ss <= 1;
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
        counter <= counter - 1;
        begin
            if(counter >= 1)
            begin
                data[0] <= miso;
            end
            
            else if(counter == 0)
            begin
                counter <= 8;
                flag2 <= 0;
            end
        end
    end
    
    
endmodule
