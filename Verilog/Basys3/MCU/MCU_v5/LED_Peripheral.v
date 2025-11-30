`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 14.11.2025 19:38:16
// Design Name: 
// Module Name: LED_Peripheral
// Project Name: 
// Target Devices: xc7a35tcpg236-1    (Basys3)
// Tool Versions: 
// Description: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LED_Peripheral(
    input wire clock,
    
    input wire reset_n,
    input wire write_enable,
    input wire [7:0] write_address,
    input wire [7:0] write_data,
    output wire [15:0] led
    );
    
    reg [7:0] LED_control = 0;
    reg [7:0] LED_data_01 = 0;
    reg [7:0] LED_data_02 = 0;
    
    wire [15:0] temp;
    
    assign temp = {LED_data_01 , LED_data_02};
    
    always @(posedge clock)
    begin //
    
        if(reset_n == 1)
        begin //-//
            LED_control <= 0;
            LED_data_01 <= 0;
            LED_data_02 <= 0;
        end //-//
        
        else if(write_enable == 1)
        begin //-//
            case (write_address)
            1   :   LED_control <= write_data;
            2   :   LED_data_01 <= write_data;
            3   :   LED_data_02 <= write_data;
            endcase
        end //-//
                    
    end //
    
    assign led = (LED_control[0]) ? temp : 0;
    
    
endmodule
