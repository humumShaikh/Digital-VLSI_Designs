`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 20.11.2025 16:48:23
// Design Name: 
// Module Name: seven_segment_display
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


module seven_segment_display(
    input wire clk,
    
    input wire write_enable,
    input wire [7:0] write_address,
    input wire [7:0] write_data,
    
    output reg [3:0] digit,
    output reg [7:0] segment
    );
    
    parameter max_count = 9_999;
    reg [15:0] counter = 0;
    reg [1:0] dcount = 0;
    
    reg [7:0] display_control;
    reg [3:0] digit1;
    reg [3:0] digit2;
    reg [3:0] digit3;
    reg [3:0] digit4;
    
    always @(posedge clk)
    begin
        if(write_enable == 1)
        begin
            case (write_address)
                8'h04   :   display_control <= write_data;
                8'h05   :   {digit4 , digit3}  <=  write_data;
                8'h06   :   {digit2 , digit1}  <=  write_data;
            endcase
        end
    end
    
    
    always @(posedge clk)
    begin
        if(counter == max_count)
        begin
            counter <= 0;
            case (dcount)
            0   :   begin
                        digit <= 4'b1110;
                        if(display_control[0] == 1) segment <= decode(digit1);
                        else segment <= 8'hFF;
                        dcount <= dcount + 1;
                    end   
            1   :   begin
                        digit <= 4'b1101;
                        if(display_control[0] == 1) segment <= decode(digit2);
                        else segment <= 8'hFF;
                        dcount <= dcount + 1;
                    end                
            2   :   begin
                        digit <= 4'b1011;
                        if(display_control[0] == 1) segment <= decode(digit3);
                        else segment <= 8'hFF;
                        dcount <= dcount + 1;
                    end          
            3   :   begin
                        digit <= 4'b0111;
                        if(display_control[0] == 1) segment <= decode(digit4);
                        else segment <= 8'hFF;
                        dcount <= 0;
                    end            
            endcase
        end
        
        else counter <= counter + 1;
    end
    
    
    function [7:0] decode;
        input [3:0] in;
        
        begin
            case (in)
            0    :   decode = 8'b1100_0000;//s7 s6 s5 s4 s3 s2 s1 s0   sDP sG sF sE sD sC sB sA
            1    :   decode = 8'b1111_1001;
            2    :   decode = 8'b1010_0100;
            3    :   decode = 8'b1011_0000;
            4    :   decode = 8'b1001_1001;
            5    :   decode = 8'b1001_0010;
            6    :   decode = 8'b1000_0010;
            7    :   decode = 8'b1111_1000;
            8    :   decode = 8'b1000_0000;
            9    :   decode = 8'b1001_0000;
            10   :   decode = 8'b1000_1000;
            11   :   decode = 8'b1000_0011;
            12   :   decode = 8'b1010_0111;
            13   :   decode = 8'b1010_0001;
            14   :   decode = 8'b1000_0110;
            15   :   decode = 8'b1000_1110;
            endcase
        end
    endfunction
    
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
