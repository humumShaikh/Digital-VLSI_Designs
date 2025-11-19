`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2025 21:49:41
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
    input wire en,
    output reg reset_n,
    output reg read_enable,
    output reg [7:0] read_address,
    input wire [7:0] read_data,
    
    output reg write_enable,
    output reg [7:0] write_address,
    output reg [7:0] write_data,
    output wire [4:0] FSM_STATE
    );
    
    
    parameter [4:0] FETCH           =   0,
                    DECODE          =   1,
                    EXECUTE         =   2,
                    getLEDCtrl      =   3,
                    setLEDCtrl      =   4,
                    getLEDData01    =   5,
                    setLEDData01    =   6,
                    getLEDData02    =   7,
                    setLEDData02    =   8,
                    getCounterData  =   9,
                    setCounterData  =   10,
                    incCounter      =   11,
                    getCmpData      =   12,
                    setCmpData      =   13,
                    CJE             =   14,
                    getJmpAddress   =   15,
                    JMP             =   16,
                    END             =   17;
                    
    reg [4:0] state = FETCH;
    
    assign FSM_STATE = state;
    
    reg [7:0] programCounter = 0;
    reg [31:0] counter;
    reg [31:0] comparator;
    reg [3:0] temp = 0;
    
    
    always @(posedge clk)
    begin //
    
        if(en == 1)
        begin
            programCounter <= 0;
            write_enable <= 0;
            read_enable <= 0;
            temp <= 0;
            counter <= 0;
            state <= FETCH;
            write_address <= 0;
            read_address <= 0;
            write_data <= 0;
            reset_n <= 1;
            comparator <= 0;
        end
        
        else
        begin //-//
            case (state) //-//
            
            FETCH   :   begin //-//-//
                            write_enable <= 0;
                            read_enable <= 1;
                            read_address <= programCounter;
                            programCounter <= programCounter + 1;
                            state <= DECODE;
                        end //-//-//  
                        
            DECODE  :   begin //-//-//
                            write_enable <= 0;
                            read_enable <= 0;
                            
                            case (read_data) //-//-//-//
                            8'h11   :   begin //-//-//-//-//
                                            reset_n <= 0;
                                            state <= FETCH;
                                        end //-//-//-//-//
                            8'h12   :   state <= getLEDCtrl;           
                            8'h13   :   state <= getLEDData01;
                            8'h14   :   state <= getLEDData02;   
                            8'h15   :   begin
                                            state <= getCounterData;
                                            temp <= 0;
                                        end
                            8'h16   :   state <= incCounter;
                            8'h17   :   begin
                                            state <= getCmpData;
                                            temp <= 0;
                                        end
                            8'h18   :   state <= getJmpAddress;  
                            8'h19   :   state <= END;                               
                            default :   state <= FETCH;               
                            endcase //-//-//-//
                        end //-//-//             
                        
            getLEDCtrl  :   begin //-//-//
                                write_enable <= 0;
                                read_enable <= 1;
                                read_address <= programCounter;
                                programCounter <= programCounter + 1;
                                state <= setLEDCtrl;
                            end //-//-//             
                            
            setLEDCtrl  :   begin //-//-//
                                write_enable <= 1;
                                read_enable <= 0;
                                write_address <= 8'h01;
                                write_data <= read_data;
                                state <= FETCH;
                            end //-//-//         
                            
            getLEDData01    :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 1;
                                    read_address <= programCounter;
                                    programCounter <= programCounter + 1;
                                    state <= setLEDData01;
                                end //-//-//              
                                
            setLEDData01    :   begin //-//-//
                                    write_enable <= 1;
                                    read_enable <= 0;
                                    write_address <= 8'h02;
                                    write_data <= read_data;
                                    state <= FETCH;
                                end //-//-//       
                                
            getLEDData02    :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 1;
                                    read_address <= programCounter;
                                    programCounter <= programCounter + 1;
                                    state <= setLEDData02;
                                end //-//-//              
                                
            setLEDData02    :   begin //-//-//
                                    write_enable <= 1;
                                    read_enable <= 0;
                                    write_address <= 8'h03;
                                    write_data <= read_data;
                                    state <= FETCH;
                                end //-//-//
                                
            getCounterData  :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 1;
                                    read_address <= programCounter;
                                    programCounter <= programCounter + 1;
                                    state <= setCounterData;
                                end //-//-//                
                                
            setCounterData  :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 0;
                                    case (temp) //-//-//-//
                                    0   :   begin //-//-//-//-//
                                                counter[31:24] <= read_data;
                                                temp <= temp + 1;
                                                state <= getCounterData;
                                            end //-//-//-//-//
                                    1   :   begin //-//-//-//-//
                                                counter[23:16] <= read_data;
                                                temp <= temp + 1;
                                                state <= getCounterData;
                                            end //-//-//-//-//          
                                    2   :   begin //-//-//-//-//
                                                counter[15:8] <= read_data;
                                                temp <= temp + 1;
                                                state <= getCounterData;
                                            end //-//-//-//-//          
                                    3   :   begin //-//-//-//-//
                                                counter[7:0] <= read_data;
                                                temp <= 0;
                                                state <= FETCH;
                                            end //-//-//-//-//                                  
                                    endcase //-//-//-//
                                end //-//-//                 
            
            incCounter      :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 0;
                                    counter <= counter + 1;
                                    state <= FETCH;
                                end //-//-//   
                                
            getCmpData      :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 1;
                                    read_address <= programCounter;
                                    programCounter <= programCounter + 1;
                                    state <= setCmpData;
                                end //-//-//           
                                
            setCmpData      :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 0;
                                    
                                    case (temp) //-//-//-//
                                    0   :   begin
                                                comparator[31:24] <= read_data;
                                                temp <= temp + 1;
                                                state <= getCmpData;
                                            end
                                    1   :   begin //-//-//-//
                                                comparator[23:16] <= read_data;
                                                temp <= temp + 1;
                                                state <= getCmpData;
                                            end //-//-//-//         
                                    2   :   begin //-//-//-//
                                                comparator[15:8] <= read_data;
                                                temp <= temp + 1;
                                                state <= getCmpData;
                                            end //-//-//-//         
                                    3   :   begin //-//-//-//
                                                comparator[7:0] <= read_data;
                                                temp <= 0;
                                                state <= CJE;
                                            end //-//-//-//             
                                    endcase //-//-//-//
                                end //-//-//          
                                
            CJE             :   begin //-//-//
                                    if(counter == comparator) state <= getJmpAddress;
                                    else state <= FETCH;
                                end //-//-//          
                                
            getJmpAddress   :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 1;
                                    read_address <= programCounter;
                                    state <= JMP;
                                end //-//-// 
                                
            JMP             :   begin //-//-//
                                    write_enable <= 0;
                                    read_enable <= 0;
                                    programCounter <= read_data;
                                    state <= FETCH;
                                end //-//-//    
                                
            END             :   state <= END;                                                                                                                                                                                 
             
            endcase //-//
    end //
    end //             
    
    
endmodule
