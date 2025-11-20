`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 13:24:00
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
    input wire [15:0] led,
    output reg [7:0] o1,
    output reg [7:0] o2,
    output reg [7:0] o3,
    output reg [7:0] o4
    );
    
    always @(*)
    begin
        decode(led[3:0] , o1);
        decode(led[7:4] , o2);
        decode(led[11:8] , o3);
        decode(led[15:12] , o4);
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
            10   :   out = 8'b1000_1000;
            11   :   out = 8'b1000_0011;
            12   :   out = 8'b1010_0111;
            13   :   out = 8'b1010_0001;
            14   :   out = 8'b1000_0110;
            15   :   out = 8'b1000_1110;
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
