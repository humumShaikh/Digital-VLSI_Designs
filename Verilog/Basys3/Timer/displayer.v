`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 09:37:14
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


module displayer
    (
        input wire clk,
        input wire done,
        input wire [7:0]hd,td,ud,
        output reg [3:0]segment,
        output reg [7:0]digit
    );
    
    reg [1:0] dcount = 0;
    
    reg [18:0] max_count = 10_000;
    reg [26:0] count = 0;
    reg flag = 0;
    
    always @(posedge clk)
    begin
    
    if(~done)
    begin
        if(count==max_count)
        begin
            count <= 0;
            case (dcount)
                0   :   begin
                        segment <= 4'b1110;
                        digit <= ud;
                        dcount <= dcount + 1;
                        end     
       
                1   :   begin
                        segment <= 4'b1101;
                        digit <= td;
                        dcount <= dcount + 1;
                        end    
                        
                2   :   begin
                        segment <= 4'b1011;
                        digit <= hd;
                        dcount <= 0;
                        end             
                        
            endcase
        end
        else count <= count + 1; 
    end
    
    else 
    begin
        if(count == 50_000_000)
        begin
            count <= 0;
            flag <= ~flag;
        end
        
        else
        begin
            if(flag)
            begin
                count <= count + 1;
                segment <= 4'b1000;
                digit <= 8'b1100_0000;
            end
            else 
            begin
                count <= count + 1;
                segment <= 4'b1111;
            end
        end
    end
        
    end
    
    
endmodule