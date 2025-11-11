`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 11.11.2025 08:25:15
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
    input wire [4:0] sec,
    output reg [7:0] td,
    output reg [7:0] ud
    );
    
    
    always @(*)
    begin
        decode((sec/10) , td);
        decode((sec%10) , ud);
    end
    
    
    task decode;
        input [4:0] in;
        output [7:0] out;
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
    
    
    
endmodule
