`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 11.11.2025 11:49:53
// Design Name: 
// Module Name: tlc
// Project Name: 
// Target Devices:  xc7a35tcpg236-1 (Basys3)
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


module tlc(
    input wire clk,
    input wire reset,
    output reg [4:0] sec = 29, 
    output reg red,
    output reg yellow,
    output reg green,
    output reg [1:0] state = 0
    );
    
    
    parameter max_count = 100_000_000;
    reg [26:0] count = 0;
        
    initial
    begin
        state <= 0;
        {red , yellow , green} <= 3'b100;
    end
    
    always @(posedge clk)
    begin
    
    if(reset == 1)
    begin
        sec <= 29;
        state <= 0;
        count <= 0;
        {red , yellow , green} <= 3'b100;
    end
    
    else if(reset == 0)
    begin
        if(count == max_count)
        begin
        
            count <= 0;
            if(sec == 0)
            begin
            
                if(state == 0)
                begin
                {red , yellow , green} <= 3'b010;
                state <= 1;
                end //state == 0
                
                else if(state == 1)
                begin
                {red , yellow , green} <= 3'b001;
                state <= 2;
                end //state == 1
                
                else if(state == 2)
                begin
                {red , yellow , green} <= 3'b100;
                state <= 0;
                end //state == 2
                
            end //sec == 28
                         
            if(sec == 0) sec <= 29;
            else sec <= sec - 1;
        
        end //if
        
        else if(count != max_count) count <= count + 1;
    end 
    
    end //always
    
    
endmodule
