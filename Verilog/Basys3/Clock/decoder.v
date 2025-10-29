//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 28.10.2025 19:40:18
// Design Name: 
// Module Name: vga_controller
// Project Name: 
// Target Devices: Basys3   (xc7a35tcpg236-1)
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
    input wire [3:0]thd,hd,td,ud,
    output reg [7:0]THOUSANDS_DIGIT,HUNDREDS_DIGIT,TENS_DIGIT,UNITS_DIGIT
    );
    
    always @(*)
    begin
        decode(ud,UNITS_DIGIT);
        decode(td,TENS_DIGIT);
        decodeHundred(hd,HUNDREDS_DIGIT);
        decode(thd,THOUSANDS_DIGIT);
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
    
    task decodeHundred;
        input [3:0]in;
        output [7:0]out;
        begin
        case (in)
            0   :   out = 8'b0100_0000;//s7 s6 s5 s4 s3 s2 s1 s0   sDP sG sF sE sD sC sB sA
            1   :   out = 8'b0111_1001;
            2   :   out = 8'b0010_0100;
            3   :   out = 8'b0011_0000;
            4   :   out = 8'b0001_1001;
            5   :   out = 8'b0001_0010;
            6   :   out = 8'b0000_0010;
            7   :   out = 8'b0111_1000;
            8   :   out = 8'b0000_0000;
            9   :   out = 8'b0001_0000;
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
