`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.10.2025 10:30:59
// Design Name: 
// Module Name: BCD
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


module BCD(
    input wire clk,
    input wire [13:0]bin,
    output reg [3:0]ThD,HD,TD,UD
    );
    //1024
    reg [13:0] temp = 0;
    reg [3:0] count = 0;
    
    initial
    begin
        {ThD,HD,TD,UD} <= 0;
    end
    
    always @(posedge clk)
    begin
        case (count)
            0   :   begin
                    temp = bin;     //temp = 1024
                    count <= count + 1;
                    end
                    
            1   :   begin
                    UD  <=  temp % 10;      //UD = 4
                    temp <= temp/10;        //temp = 102
                    count <= count + 1;
                    end
                                    
            2   :   begin
                    TD <= temp % 10;        //TD = 2
                    temp <= temp/10;        //temp = 10
                    count <= count + 1;
                    end
   
            3   :   begin
                    HD <= temp % 10;        //HD = 0
                    temp <= temp/10;        //temp = 1
                    count <= count + 1;
                    end
                    
            4   :   begin
                    ThD <= temp;
                    count <= 0;
                    end             
                
        endcase    
    end
    
endmodule
