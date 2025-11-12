`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 11.11.2025 21:03:51
// Design Name: 
// Module Name: distributor
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


module distributor(
    input wire clk,
    input wire [7:0] alpha,
    input wire [7:0] beta,
    input wire [7:0] gamma,
    input wire [7:0] delta,
    input wire [7:0] msb,
    input wire [7:0] lsb,
    output reg [7:0] o1,
    output reg [7:0] o2,
    output reg [7:0] o3,
    output reg [7:0] o4
    );
    
    
    parameter half_second = 50_000_000;
    reg [26:0] count = 0;
    reg flag = 0;
    
    
    
    always @(posedge clk)
    begin
        if(count == half_second)
        begin
            count <= 0;
            flag <= ~flag;
        end
        
        else if(count != half_second) count <= count + 1;
    end
    
    
    always @(*)
    begin
        if(flag == 0)
        begin
            o4 = alpha;
            o3 = beta;
            o2 = gamma;
            o1 = delta;
        end
        
        else if(flag == 1)
        begin
            o4 = 8'b1_111_1111;
            o3 = 8'b1_111_1111;
            o2 = msb;
            o1 = lsb;
        end
    end
    
    
    
    
    
endmodule
