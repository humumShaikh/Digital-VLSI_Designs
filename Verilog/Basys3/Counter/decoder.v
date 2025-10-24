`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 10:39:04
// Design Name: 
// Module Name: decoder
// Project Name: 
// Target Devices: Basys3    (xc7a35tcpg236-1)
// Tool Versions: 
// Description: Converts the received bcd digits into 7-segment compatible code
// 
// Dependencies: 
// BOARD:   xc7a35tcpg236
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder(
    input wire [3:0]msb,lsb,
    output reg [7:0]TENS_DIGIT,UNITS_DIGIT
    );
    
    always @(*)
    begin
        decode(lsb,UNITS_DIGIT);
        decode(msb,TENS_DIGIT);
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
