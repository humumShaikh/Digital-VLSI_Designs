`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 15.11.2025 22:10:01
// Design Name: 
// Module Name: CU
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


module CU(
    input wire clk,
    
    input wire [7:0] read_data,
    output reg [7:0] read_address,
    output reg read_enable,
    
    output reg reset_n,
    output reg write_enable,
    output reg [7:0] write_address,
    output reg [7:0] write_data 
    );
    
    parameter [3:0] FETCH           = 0,
                    DECODE          = 1,
                    EXECUTE         = 2;
                    
    parameter [3:0] getLEDCtrl   = 3,
                    setLEDCtrl   = 4,
                    getLEDData01 = 5,
                    setLEDData01 = 6,
                    getLEDData02 = 7,
                    setLEDData02 = 8;
                    
    parameter [3:0] LED_CTRL = 9,
                    COUNTER  = 10;                          
                    
                    
    reg [3:0] state = FETCH;
    
    reg [3:0] LEDP_state = getLEDCtrl;
    
    reg [3:0] mode_state;
    
    
    reg [4:0] programCounter = 0;
    
    reg start = 0;
    reg finish = 0;
    
    
    always @(posedge clk)
    begin //
        
        if(start == 0) start <= 1;
    
        else if(programCounter != 32)
        begin //-//
            
            case (state)
            
            FETCH   :   begin //-//
                            read_enable <= 1;
                            read_address <= programCounter;
                            programCounter <= programCounter + 1;
                            state <= DECODE;
                        end //-//
                        
            DECODE  :   begin //-//
                            read_enable <= 0;
                            
                            case (read_data)
                            8'h11   :   state <= FETCH;
                            
                            8'h12   :   begin //-//-//
                                        state <= EXECUTE;
                                        mode_state <= LED_CTRL;
                                        reset_n <= 0;
                                        end //-//-//

                            endcase
                        end //-//
                        
            EXECUTE :   begin //-//
                            case (mode_state)
                            
                            LED_CTRL    :   begin //-//-//
                                            
                                            case (LEDP_state)
                                            
                                            getLEDCtrl  :   begin //-//-//-//
                                                            read_enable <= 1;
                                                            write_enable <= 0;
                                                            read_address <= programCounter;
                                                            programCounter <= programCounter + 1;
                                                            LEDP_state <= setLEDCtrl;
                                                            end //-//-//-//
                                            setLEDCtrl  :   begin //-//-//-//
                                                            read_enable <= 0;
                                                            write_enable <= 1;
                                                            write_address <= 8'h01;
                                                            write_data <= read_data;
                                                            LEDP_state <= getLEDData01;
                                                            end //-//-//-//            
                                            getLEDData01:  begin //-//-//-// 
                                                            read_enable <= 1;
                                                            write_enable <= 0;
                                                            read_address <= programCounter;
                                                            programCounter <= programCounter + 1;
                                                            LEDP_state <= setLEDData01;
                                                            end //-//-//-//  
                                            setLEDData01:   begin //-//-//-//
                                                            read_enable <= 0;
                                                            write_enable <= 1;
                                                            write_address <= 8'h02;
                                                            write_data <= read_data;
                                                            LEDP_state <= getLEDData02;
                                                            end //-//-//-//     
                                            getLEDData02:  begin //-//-//-// 
                                                            read_enable <= 1;
                                                            write_enable <= 0;
                                                            read_address <= programCounter;
                                                            programCounter <= programCounter + 1;
                                                            LEDP_state <= setLEDData02;
                                                            end //-//-//-//    
                                            setLEDData02:   begin //-//-//-//
                                                            read_enable <= 0;
                                                            write_enable <= 1;
                                                            write_address <= 8'h03;
                                                            write_data <= read_data;
                                                            LEDP_state <= getLEDCtrl;
                                                            state <= FETCH;
                                                            end //-//-//-//                                                                                                         
                                                            
                                            endcase
                                            end //-//-//
                                                     
                            endcase
                        end //-//                            
            
            endcase 
            
        end //-//
        
        else finish <= 1;
    
    end //
                 
    
endmodule
