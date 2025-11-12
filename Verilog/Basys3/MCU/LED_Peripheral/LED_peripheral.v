`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 12.11.2025 08:27:44
// Design Name: 
// Module Name: LED_peripheral
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


module LED_peripheral(
    input wire clock,
    input wire reset_n,
    
    input wire write_enable,
    input wire [7:0] write_address,
    input wire [7:0] write_data,
    
    output reg [15:0] led
    );
    
    
    reg [7:0] LED_RAM [1:256];
    //LED_control = 0x01;
    //LED_data_01 = 0x02;
    //LED_data_02 = 0x03;
    
    parameter [2:0] IDLE = 0,
                    getCtrl = 1,
                    getLSB = 2,
                    getMSB = 3,
                    display = 4;
                    
    reg [2:0] state = IDLE;
    
    
    always @(posedge clock)
    begin //
    
    if(reset_n == 0)
    begin //-//
        led <= 2'h00;
        state <= IDLE;
    end //-//
    
    
    else if(reset_n == 1)
    begin //-//
        case (state)
            IDLE    :   if(write_enable == 1) state <= getCtrl;  
            
            getCtrl :   begin //-//-//
                        LED_RAM[write_address] <= write_data;
                        state <= getLSB;
                        end //-//-//
                        
            getLSB  :   begin //-//-//
                        LED_RAM[write_address] <= write_data;
                        state <= getMSB;
                        end //-//-//    
                        
            getMSB  :   begin //-//-//
                        LED_RAM[write_address] <= write_data;
                        state <= display;
                        end //-//-//     
                        
            display :   begin //-//-//
                        if(LED_RAM[01][7] == 1) led <= {LED_RAM[03] , LED_RAM[02]};
                        else led <= 2'h00;
                        state <= IDLE;                   
                        end //-//-//                              
        endcase
    end //-//
        
    end //
    
    
    
endmodule
