`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 30.10.2025 09:18:03
// Design Name: 
// Module Name: dancer
// Project Name: 
// Target Devices: Basys3    (xc7a35tcpg236-1)
// Tool Versions: 
// Description: Ring counter on the LEDs of the board
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dancer(
    input wire clk,
    input wire reset,
    input wire direction,                               // left - 0 // right - 1
    input wire [1:0] delay,                             // 50ms - 00   100ms - 01  200ms - 10  400ms - 11
    output reg [15:0] LED = 16'b0000_0000_0000_0001     //to initialize the LED with a starting position
    );
    
    reg [26:0] max_count;       //max_count = board_clk / (2*desired_frequency)
    reg [26:0] count = 0;
    
    
    
    always @(*)             //to change the delay time period 
    begin
        case (delay)
        0   :   max_count <= 2_500_000; 
        1   :   max_count <= 5_000_000;   
        2   :   max_count <= 10_000_000;    
        3   :   max_count <= 20_000_000;   
        endcase
    end
    
    
    
    always @(posedge clk)
    begin
    ///////////////////////////////////////////////
    if(reset)                               //for resetting the position                                                   
    begin
    LED <= 16'b0000_0000_0000_0001;
    count <= 0;
    end
    ///////////////////////////////////////////////
    else if(count == max_count)
    begin
        count <= 0;
        
        if(~direction)                      //for circular left shift
        begin
            if(LED[15] == 1)
            begin
            LED[15] <= 0;
            LED[0] <= 1;
            end
            
            else LED <= LED << 1;
        end
        
        else if(direction)                  //for circular right shift
        begin
            if(LED[0] == 1)
            begin
            LED[0] <= 0;
            LED[15] <= 1;
            end
            
            else LED <= LED >> 1;
        end    
           
    end
    ///////////////////////////////////////////////
    else count <= count + 1;
    ///////////////////////////////////////////////
    end
    
    
endmodule
