`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 06.11.2025 09:28:00
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input wire clk,
    input wire reset,
    input wire write_en,
    input wire read_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg full = 0,
    output wire empty
    );
    
    
    reg [7:0] RAM [1:16];
    reg [4:0] wrPtr = 1;
    reg [4:0] rdPtr = 1;
    
    
    
    always @(posedge clk)
    begin
    //////////////////////////////////////////////////////
    if(reset == 1)
    begin
        wrPtr <= 1;
        full <= 0;
    end
    //////////////////////////////////////////////////////
    else if((write_en == 1) && (read_en == 0))
    begin
        if(full == 0)
        begin
            if(wrPtr != 16)
            begin
                 RAM[wrPtr] <= data_in;
                 wrPtr <= wrPtr + 1;
            end
            
            else if(wrPtr == 16)
            begin
                RAM[wrPtr] <= data_in;
                wrPtr <= 1;
                full <= 1;
            end
        end
    end
    //////////////////////////////////////////////////////
    else if((write_en == 0) && (read_en == 1))
    begin
        if(rdPtr != 16)
        begin
            data_out <= RAM[rdPtr];
            rdPtr <= rdPtr + 1;
            full <= 0;
        end
        
        else if(rdPtr == 16)
        begin
            data_out <= RAM[rdPtr];
            rdPtr <= 1;
            full <= 0;
        end
    end
    //////////////////////////////////////////////////////
    else if((write_en == 1) && (read_en == 1))
    begin
        if(full == 0)
        begin
           if(wrPtr != 16)
           begin
                RAM[wrPtr] <= data_in;
                wrPtr <= wrPtr + 1;
           end
           else if(wrPtr == 16)
           begin
                RAM[wrPtr] <= data_in;
                wrPtr <= 1;
                full <= 1;
           end
           
           if(rdPtr != 16)
           begin
                data_out <= RAM[rdPtr];
                rdPtr <= rdPtr + 1;
                full <= 0;
           end
           else if(rdPtr == 16)
           begin
                data_out <= RAM[rdPtr];
                rdPtr <= 1;
                full <= 0;
           end
        end
        
        else if(full == 1)
        begin
            if(rdPtr != 16)
            begin
                data_out <= RAM[rdPtr];
                rdPtr <= rdPtr + 1;
                full <= 0;
            end
            else if(rdPtr == 16)
            begin
                data_out <= RAM[rdPtr];
                rdPtr <= 1;
                full <= 0;
            end
        end
    end
    //////////////////////////////////////////////////////
    end
    
    
    
    
    assign empty = ~full;
    
endmodule
