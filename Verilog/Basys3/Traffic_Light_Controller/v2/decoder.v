`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 11.11.2025 20:09:40
// Design Name: 
// Module Name: decoder
// Project Name: 
// Target Devices:  xc7a35tcpg236-1     (Basys3)
// Tool Versions: 
// Description: Takes 4 8 bit outputs as alpha , beta , gamma , delta - representing the four alphabetic symbols that can be displayed on the 4 digit 7-segment display
// for e.g - StoP , SEE- , Go--    
// The four alphabetic characters are registered constantly but the chars change as per the state received from the previous module,
// apart from this, the msb and lsb of the seconds counted are also sent to the output
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder(
    input wire [4:0] sec,
    input wire [1:0] state,
    output reg [7:0] alpha,
    output reg [7:0] beta,
    output reg [7:0] gamma,
    output reg [7:0] delta,
    output reg [7:0] msb,
    output reg [7:0] lsb
    );
    
    wire [3:0] td;
    wire [3:0] ud;
    
    assign td = sec/10;
    assign ud = sec%10;
    
    
    always @(*)
    begin
        case (state)
        0   :   begin
                alpha <= 8'b1_001_0010;     //65320     //S
                beta  <= 8'b1_000_0111;     //6543      //t
                gamma <= 8'b1_010_0011;     //6432      //o
                delta <= 8'b1_000_1100;     //65410     //P
                end
                
        1   :   begin
                alpha <= 8'b1_001_0010;     //          //S
                beta  <= 8'b1_000_0110;     //65430     //E 
                gamma <= 8'b1_000_0110;     //          //E          
                delta <= 8'b1_011_1111;     //6         //-                
                end         
                
        2   :   begin
                alpha <= 8'b1_100_0010;     //654320    //G
                beta  <= 8'b1_010_0011;                 //o
                gamma <= 8'b1_011_1111;                 //-
                delta <= 8'b1_011_1111;                 //-
                end             
        endcase
        
        decode(td , msb);
        decode(ud , lsb);
        
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
