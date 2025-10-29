`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2025 10:25:10
// Design Name: 
// Module Name: decoder
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


module decoder(
    input wire [6:0] data,
    output reg [7:0] Td,
    output reg [7:0] Ud
    );
    
    wire [3:0] td , ud;
    
    assign td = data / 10;
    assign ud = data % 10;
    
    always @(*)
    begin
        decode(ud,Ud);
        decode(td,Td);
    end
    
    task decode;
        input [3:0]in;
        output [7:0]out;
        begin
        case (in)
            0   :   out = 8'b1100_0000;//s7 s6 s5 s4 s3 s2 s1 s0   sDP sG sF sE sD sC sB sA
            1   :   out = 8'b1111_1001;
            2   :   out = 8'b1010_0100;
            3   :   out = 8'b1011_0000;
            4   :   out = 8'b1001_1001;
            5   :   out = 8'b1001_0010;
            6   :   out = 8'b1000_0010;
            7   :   out = 8'b1111_1000;
            8   :   out = 8'b1000_0000;
            9   :   out = 8'b1001_0000;
        endcase
        end
    endtask
    
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
