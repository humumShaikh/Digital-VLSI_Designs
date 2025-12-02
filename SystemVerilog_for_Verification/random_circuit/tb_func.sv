`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire 
// 
// Create Date: 02.12.2025 14:56:23
// Design Name: 
// Module Name: tb_func
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


module tb_func();

    logic A;
    logic B;
    logic S;
    wire F;
    
    func f1 (
        .A(A),
        .B(B),
        .S(S),
        .F(F)
    );
    
    initial 
    begin
        $monitor("A:%b  B:%b  S:%b  F:%b" , A , B , S , F);
        
        #5 A = 0; B = 0; S = 0;
        #5 A = 0; B = 0; S = 'bx;
        #5 A = 0; B = 'bx; S = 0;
        #5 A = 0; B = 'bx; S = 'bx;
        #5 A = 'bx; B = 0; S = 0;
        #5 A = 'bx; B = 0; S = 'bx;
        #5 A = 'bx; B = 'bx; S = 0;
        #5 A = 'bx; B = 'bx; S = 'bx;
        
        #5 A = 0; B = 0; S = 0;
        #5 A = 0; B = 0; S = 1;
        #5 A = 0; B = 1; S = 0;
        #5 A = 0; B = 1; S = 1;
        #5 A = 1; B = 0; S = 0;
        #5 A = 1; B = 0; S = 1;
        #5 A = 1; B = 1; S = 0;
        #5 A = 1; B = 1; S = 1;
        
        #5 A = 0; B = 0; S = 0;
        #5 A = 'bx; B = 'bx; S = 1;
        #5 A = 'bx; B = 1; S = 'bx;
        #5 A = 'bx; B = 1; S = 1;
        #5 A = 1; B = 'bx; S = 'bx;
        #5 A = 1; B = 'bx; S = 1;
        #5 A = 1; B = 1; S = 'bx;
        #5 A = 1; B = 1; S = 1;
        
        #5 A = 0; B = 0; S = 0;
        
        #5 A = 0; B = 'bx; S = 1;
        #5 A = 'bx; B = 0; S = 1;
        
        #5 A = 0; B = 1; S = 'bx;
        #5 A = 'bx; B = 1; S = 0;
        
        #5 A = 1; B = 0; S = 'bx;
        #5 A = 1; B = 'bx; S = 0;
        
    end

endmodule
