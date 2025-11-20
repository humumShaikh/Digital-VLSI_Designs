`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2025 09:59:46
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
  
    input wire [7:0] read_data,
    output reg [7:0] read_address,
    output reg read_enable,
    
    output reg write_enable,
    output reg [7:0] write_address,
    output reg [7:0] write_data,
    
    output reg reset_n
    );
    
    parameter [4:0] FETCH           =   0,
                    DECODE          =   1,
                    setLEDCtrl      =   2,
                    setLEDData01    =   3,
                    setLEDData02    =   4,
                    END             =   5,
                    JMP             =   6,
                    buffer          =   7;
    
    reg [4:0] state = FETCH;
    
    reg [7:0] PC = 0;
    reg jmpFlag = 0;
    
    always @(posedge clk)
    begin //
    
        if(en == 1)
        begin //-//
            PC <= 0;
            state <= FETCH;
        end //-//
        
        else
        begin //-//
            case (state) //-//-//
            
                FETCH       :       begin //-//-//-//
                                        read_enable <= 1;
                                        write_enable <= 0;
                                        read_address <= PC;
                                        PC <= PC + 1;
                                        write_enable <= 0;
                                        if(jmpFlag == 1)
                                        begin
                                            jmpFlag <= 0;
                                            state <= buffer;
                                        end
                                        else state <= DECODE;
                                    end //-//-//-//
                                    
                DECODE      :       begin //-//-//-//
                                        case (read_data) //-//-//-//-//
                                            8'h11   :   begin
                                                            state <= FETCH;
                                                        end
                                                        
                                            8'h12   :   begin
                                                            state <= setLEDCtrl;
                                                            read_enable <= 1;
                                                            read_address <= PC;
                                                            write_enable <= 0;
                                                            PC <= PC + 1;
                                                        end              
                                                        
                                            8'h13   :   begin
                                                            state <= setLEDData01;
                                                            read_enable <= 1;
                                                            read_address <= PC;
                                                            write_enable <= 0;
                                                            PC <= PC + 1;
                                                        end               
                                                        
                                            8'h14   :   begin
                                                            state <= setLEDData02;
                                                            read_enable <= 1;
                                                            read_address <= PC;
                                                            write_enable <= 0;
                                                            PC <= PC + 1;
                                                        end             
                                                        
                                            8'h18   :   begin
                                                            state <= JMP;
                                                            read_enable <= 1;
                                                            read_address <= PC;
                                                            write_enable <= 0;
                                                        end               
                                                        
                                            default :   state <= FETCH;                
                                        endcase //-//-//-//-//
                                    end //-//-//-//                 
                                    
                setLEDCtrl  :       begin //-//-//-//
                                        read_enable <= 0;
                                        write_enable <= 1;
                                        write_address <= 8'h01;
                                        write_data <= read_data;
                                        state <= FETCH;
                                    end //-//-//-//        
                                    
                setLEDData01    :   begin //-//-//-//
                                        read_enable <= 0;
                                        write_enable <= 1;
                                        write_address <= 8'h02;
                                        write_data <= read_data;
                                        state <= FETCH;
                                    end //-//-//-//  
                                    
                setLEDData02    :   begin //-//-//-//
                                        read_enable <= 0;
                                        write_enable <= 1;
                                        write_address <= 8'h03;
                                        write_data <= read_data;
                                        state <= FETCH;
                                    end //-//-//-//          
                                    
                JMP             :   begin //-//-//-//
                                        read_enable <= 0;
                                        PC <= read_data;
                                        state <= FETCH;
                                        jmpFlag <= 1;
                                    end //-//-//-//      
                                    
                buffer          :   state <= FETCH;                                                                             
                                    
            
            endcase //-//-//
        end //-//
        
        
    end //
    
endmodule
