`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 14.11.2025 19:38:16
// Design Name: 
// Module Name: LED_Peripheral
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


module controller(
    input wire clk,
    output wire reset,
    output wire write_enable,
    output reg [7:0] write_address,
    output reg [7:0] write_data
);

    reg [3:0] count = 0;

    always @(posedge clk)
    begin
        case (count)
        0   :   begin
                write_address <= 8'h01;
                write_data <= 8'h01;
                count <= count + 1;
                end
                
        1   :   begin
                write_address <= 8'h02;
                write_data <= 8'h12;
                count <= count + 1;
                end          
                
        2   :   begin
                write_address <= 8'h03;
                write_data <= 8'h34;
                count <= count + 1;
                end    
                
        3   :   begin
                write_address <= 8'h02;
                write_data <= 8'h69;
                count <= count + 1;
                end                  
                
        4   :   begin
                write_address <= 8'h03;
                write_data <= 8'h69;
                count <= count + 1;
                end
                
        5   :   begin
                write_address <= 8'h02;
                write_data <= 8'hFF;
                count <= count + 1;
                end                  
                
        6   :   begin
                write_address <= 8'h03;
                write_data <= 8'hFF;
                count <= 7;
                end                            
        endcase
    end
    
    assign write_enable = clk;
    assign reset = 1'b0;

endmodule