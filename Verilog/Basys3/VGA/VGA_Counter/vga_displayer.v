`timescale 1ns / 1ps
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
// Description: To display an image on a display using VGA      NOTE : this one has a sample image of 128x64 pixels
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_displayer(
    input wire clk,
    input wire clk25,
    input wire [3:0] td,
    input wire [3:0] ud,
    input wire [9:0] hcount,
    input wire [9:0] vcount,
    output reg [11:0] rgb
    );
    
    `include "digitImages.vh"
    
    
    reg [13:0] max_count = 16_631;
    reg [13:0] count = 0;
    reg [1:0] digit = 0;
    
    always @(posedge clk)
    begin
        if(count == max_count)
        begin
            count <= 0;
            if((hcount <= 49) && (vcount <= 49)) digit <= 2;
            else if((hcount >= 100   && hcount <= 149) && (vcount <= 49)) digit <= 1;
            else digit <= 0;
        end
        else count <= count + 1;
    end
  
  
  always @(posedge clk25)
  begin
        if(digit == 2) decode(td,1);
        else if(digit == 1) decode(ud,0);
        else if(digit == 0)rgb <= 12'b0000_0000_0000;
  end
  
  task decode;
    input [3:0] d;
    input b;
      
    begin
    if(b==1)
    begin
    case (d)
        0   :   begin
                if(d0[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        1   :   begin
                if(d1[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end  
        2   :   begin
                if(d2[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        3   :   begin
                if(d3[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end  
        4   :   begin
                if(d4[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        5   :   begin
                if(d5[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end  
        6   :   begin
                if(d6[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        7   :   begin
                if(d7[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        8   :   begin
                if(d8[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        9   :   begin
                if(d9[vcount][hcount] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end                               
    endcase
    end
    
    else if(b==0)
    begin
    case (d)
        0   :   begin
                if(d0[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        1   :   begin
                if(d1[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end  
        2   :   begin
                if(d2[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        3   :   begin
                if(d3[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end  
        4   :   begin
                if(d4[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        5   :   begin
                if(d5[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end  
        6   :   begin
                if(d6[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        7   :   begin
                if(d7[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        8   :   begin
                if(d8[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end
        9   :   begin
                if(d9[vcount][hcount-100] == 1) rgb = 12'b1111_1111_1111;
                else rgb = 0;
                end                               
    endcase
    end
        
    end
    
  endtask
    

endmodule
