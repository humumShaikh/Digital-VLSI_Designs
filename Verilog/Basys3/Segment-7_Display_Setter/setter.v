`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 24.10.2025 22:54:46
// Design Name: 
// Module Name: setter
// Project Name: 
// Target Devices: Basys3   (xc7a35tcpg236-1)
// Tool Versions: 
// Description: BCD convert the value as per the switch configuration
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module setter(
    input wire clk,
    input wire [7:0] start_val,
    output reg [3:0] HD,TD,UD
    );
    
    reg [7:0] temp = 0;
    reg [1:0] count = 0;
    
    always @(posedge clk)
    begin
    
        case (count)
        
            0   :   begin
                    temp <= start_val;
                    count <= count + 1;
                    end
                    
            1   :   begin
                    UD <= temp % 10;
                    temp <= temp / 10;
                    count <= count + 1;
                    end
                    
            2   :   begin
                    TD <= temp % 10;
                    temp <= temp / 10;
                    count <= count + 1;
                    end         
                    
            3   :   begin
                    HD <= temp;
                    count <= 0;
                    end             
                
        endcase
    
    end
    
    
endmodule
