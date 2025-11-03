`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 03.11.2025 11:37:14
// Design Name: 
// Module Name: decoder2
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


module decoder2(
    input wire clk,
    input wire [1:0] state,
    output reg [7:0] D3,
    output reg [7:0] D2,
    output reg [7:0] D1,
    output reg [7:0] D0
    );
    
    
    always @(*)
    begin
        if(state == 0)              //IdLE
        begin
        D3 <= 8'b1_111_1001;        //I
        D2 <= 8'b1_010_0001;        //d
        D1 <= 8'b1_100_0111;        //L
        D0 <= {{~clk} , {7'b000_0110}};        //E       //the decimal point of the lsb will show the clk
        end
        
        else if(state == 1)         //huX
        begin
        D3 <= 8'b1_111_1111;        //NULL
        D2 <= 8'b1_000_1011;        //h
        D1 <= 8'b1_110_0011;        //u
        D0 <= {{~clk} , {7'b000_1001}};        //x       //the decimal point of the lsb will show the clk
        end
        
        else if(state == 2)         //donE
        begin
        D3 <= 8'b1_010_0001;        //d
        D2 <= 8'b1_010_0011;        //o
        D1 <= 8'b1_010_1011;        //n
        D0 <= {{~clk} , {7'b000_0110}};        //E       //the decimal point of the lsb will show the clk
        end
    end
    
    
    /////0/////
    //       //
    //5      //1
    //       //
    /////6/////
    //       //
    //4      //2
    //       //
    /////3/////     //DP
    
endmodule
