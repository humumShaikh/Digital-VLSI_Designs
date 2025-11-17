`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 16.11.2025 14:30:13
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
    
    output wire reset_n,
    
    output reg read_enable,
    output reg [7:0] read_address,
    input wire [7:0] read_data,
    
    output reg write_enable,
    output reg [7:0] write_address,
    output reg [7:0] write_data
    
    );
    
    parameter [4:0] FETCH          = 0,
                    DECODE         = 1,
                    EXECUTE        = 2,
                    getLEDCtrl     = 3,
                    setLEDCtrl     = 4,
                    getLEDData01   = 5,
                    setLEDData01   = 6,
                    getLEDData02   = 7,
                    setLEDData02   = 8,
                    getCounterData = 9,
                    setCounterData = 10,
                    incCounter     = 11,
                    cmpJmpCounter  = 12,
                    setCmpData     = 13,
                    JMP            = 14,
                    getJmpAddress  = 15,
                    jmpAddress     = 16; 
                    

    reg [7:0] programCounter = 0;
    
    reg [3:0] state = FETCH;
    
    reg [31:0] counter = 0;
    
    reg [31:0] comparator = 0;
    reg [2:0] temp = 0;
    reg finish = 0;
    
    always @(posedge clk)
    begin //
        
        if(programCounter != 64)
        begin //-//
            
            case (state) //-//-//
            
                FETCH       :       begin //-//-//-//
                                        write_enable <= 0;
                                        read_enable <= 1;
                                        read_address <= programCounter;
                                        programCounter <= programCounter + 1;
                                        state <= DECODE;
                                    end //-//-//-//
                                    
                DECODE      :       begin //-//-//-//
                                        read_enable <= 0;
                                        case (read_data) //-//-//-//-//
                                            8'h11   :   state <= FETCH;
                                            
                                            8'h12   :   state <= getLEDCtrl;
                                            
                                            8'h13   :   state <= getLEDData01;
                                            
                                            8'h14   :   state <= getLEDData02;
                                            
                                            8'h15   :   begin
                                                            state <= getCounterData;
                                                            temp <= 0;
                                                        end
                                                        
                                            8'h16   :   state <= incCounter;
                                            
                                            8'h17   :   begin
                                                            temp <= 0;
                                                            state <= cmpJmpCounter;
                                                        end 
                                                        
//                                            8'h18   :   begin
//                                                            state <= getJmpAddress;
//                                                        end                                                            
                                                        
                                        endcase //-//-//-//-//
                                    end //-//-//-//
                                    
                getLEDCtrl  :       begin //-//-//-//
                                        write_enable <= 0;
                                        read_enable <= 1;
                                        read_address <= programCounter;
                                        programCounter <= programCounter + 1;
                                        state <= setLEDCtrl;
                                    end //-//-//-//         
                                    
                setLEDCtrl  :       begin //-//-//-//
                                        write_enable <= 1;
                                        read_enable <= 0;
                                        write_address <= 8'h01;
                                        write_data <= read_data;
                                        state <= FETCH;
                                    end //-//-//-//
                                    
                getLEDData01:       begin //-//-//-//
                                        write_enable <= 0;
                                        read_enable <= 1;
                                        read_address <= programCounter;
                                        programCounter <= programCounter + 1;
                                        state <= setLEDData01;
                                    end //-//-//-//
                                    
                setLEDData01:       begin //-//-//-//
                                        write_enable <= 1;
                                        read_enable <= 0;
                                        write_address <= 8'h02;
                                        write_data <= read_data;
                                        state <= FETCH;
                                    end //-//-//-// 
                                    
                getLEDData02:       begin //-//-//-//
                                        write_enable <= 0;
                                        read_enable <= 1;
                                        read_address <= programCounter;
                                        programCounter <= programCounter + 1;
                                        state <= setLEDData02;
                                    end //-//-//-//           
                                    
                setLEDData02:       begin
                                        write_enable <= 1;
                                        read_enable <= 0;
                                        write_address <= 8'h03;
                                        write_data <= read_data;
                                        state <= FETCH;
                                    end                 
                                    
                getCounterData:     begin //-//-//-// 
                                        write_enable <= 0;
                                        read_enable <= 1;
                                        read_address <= programCounter;
                                        programCounter <= programCounter + 1;
                                        state <= setCounterData;  
                                    end //-//-//-//
                                    
                setCounterData:     begin //-//-//-//
                                         read_enable <= 0;
                                         case (temp)
                                         0  :   begin
                                                    counter[31:24] <= read_data;
                                                    temp <= temp + 1;
                                                    state <= getCounterData;     
                                                end
                                         1  :   begin
                                                    counter[23:16] <= read_data;
                                                    temp <= temp + 1;
                                                    state <= getCounterData;
                                                end                         
                                        2   :   begin
                                                    counter[15:8] <= read_data;
                                                    temp <= temp + 1;
                                                    state <= getCounterData;
                                                end                         
                                        3   :   begin
                                                    counter[7:0] <= read_data;
                                                    temp <= 0;
                                                    state <= FETCH;
                                                end                  
                                         endcase
                                    end //-//-//-//  
                                    
                incCounter    :     begin //-//-//-// 
                                        counter <= counter + 1;
                                        state <= FETCH;
                                    end //-//-//-//  
                                    
                cmpJmpCounter :     begin //-//-//-// 
                                        read_enable <= 1;
                                        write_enable <= 0;
                                        read_address <= programCounter;
                                        programCounter <= programCounter + 1;
                                        state <= setCmpData;
                                    end //-//-//-//       
                                    
                setCmpData    :     begin //-//-//-//
                                        read_enable <= 0;
                                        case (temp)
                                        0   :   begin
                                                    comparator[31:24] <= read_data;
                                                    temp <= temp + 1;
                                                    state <= cmpJmpCounter;
                                                end
                                        1   :   begin
                                                    comparator[23:16] <= read_data;
                                                    temp <= temp + 1;
                                                    state <= cmpJmpCounter;
                                                end                        
                                        2   :   begin
                                                    comparator[15:8] <= read_data;
                                                    temp <= temp + 1;
                                                    state <= cmpJmpCounter;
                                                end                
                                        3   :   begin
                                                    comparator[7:0] <= read_data;
                                                    temp <= temp + 1;
                                                    state <= cmpJmpCounter;
                                                end
                                        4   :   begin
                                                    temp <= 0;
                                                    if(counter == comparator)
                                                    begin
                                                        state <= JMP;
                                                    end
                                                    else state <= FETCH;
                                                end                                             
                                        endcase
                                    end //-//-//-//    
                                    
                JMP           :     begin
                                        programCounter <= read_data;
                                        state <= FETCH;
                                    end
                                    
//                getJmpAddress :     begin
//                                        write_enable <= 0;
//                                        read_enable <= 1;
//                                        read_address <= programCounter;
//                                        state <= jmpAddress;
//                                    end                     
                                    
//                jmpAddress    :     begin
//                                        read_enable <= 0;
//                                        programCounter <= read_data;
//                                        state <= FETCH;
//                                    end                                                   
            
            endcase //-//-//
            
        end //-//
        
        else finish <= 1;
        
    end //
    
    assign reset_n = 1'b0;
    
    
endmodule
