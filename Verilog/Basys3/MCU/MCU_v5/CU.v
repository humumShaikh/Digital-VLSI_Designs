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
                    buffer          =   7,
                    setCounter      =   8,
                    CJE             =   9;
    
    reg [4:0] state = FETCH;
    
    reg [7:0] PC = 0;
    reg jmpFlag = 0;
    reg [31:0] counter;
    reg [31:0] comparator;
    reg [3:0] temp = 0;
    
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
                                                        
                                            8'h15   :   begin
                                                            temp <= 0;
                                                            state <= setCounter;
                                                            read_enable <= 1;
                                                            read_address <= PC;
                                                            PC <= PC + 1;
                                                        end                  
                                                        
                                            8'h16   :   begin
                                                            counter <= counter + 1;
                                                            state <= FETCH;
                                                        end                   
                                                        
                                            8'h17   :   begin
                                                            temp <= 0;
                                                            state <= CJE;
                                                            read_enable <= 1;
                                                            read_address <= PC;
                                                            PC <= PC + 1;
                                                            write_enable <= 0;
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
                                    
                setCounter      :   begin //-//-//-//
                                        case (temp) //-//-//-//-//
                                                   0    :   begin
                                                                PC <= PC + 1;
                                                                read_address <= PC;
                                                                counter[31:24] <= read_data;
                                                                temp <= 1;
                                                            end
                                                   1    :   begin
                                                                read_address <= PC;
                                                                PC <= PC + 1;
                                                                counter[23:16] <= read_data;
                                                                temp <= 2;
                                                            end           
                                                   2    :   begin
                                                                read_address <= PC;
                                                                PC <= PC + 1;
                                                                counter[15:8] <= read_data;
                                                                temp <= 3;
                                                            end          
                                                   3    :   begin
                                                                counter[7:0] <= read_data;
                                                                temp <= 0;
                                                                state <= FETCH;
                                                            end               
                                        endcase //-//-//-//-//
                                    end //-//-//-//         
                                    
                CJE             :   begin //-//-//-//
                                        case (temp)
                                            0   :   begin
                                                        read_address <= PC;
                                                        comparator[31:24] <= read_data;
                                                        PC <= PC + 1;
                                                        temp <= 1;
                                                    end
                                            1   :   begin
                                                        read_address <= PC;
                                                        comparator[23:16] <= read_data;
                                                        PC <= PC + 1;
                                                        temp <= 2;
                                                    end           
                                            2   :   begin
                                                        read_address <= PC;
                                                        comparator[15:8] <= read_data;
                                                        PC <= PC + 1;
                                                        temp <= 3;
                                                    end         
                                            3   :   begin
                                                        read_enable <= 1;
                                                        read_address <= PC;
                                                        comparator[7:0] <= read_data;
                                                        temp <= 4;
                                                    end      
                                            4   :   begin
                                                        read_enable <= 0;
                                                        if(counter == comparator)
                                                        begin
                                                            jmpFlag <= 1;     
                                                            PC <= read_data;
                                                            state <= FETCH;
                                                        end
                                                        else
                                                        begin
                                                            PC <= PC + 1;
                                                            state <= FETCH;
                                                        end
                                                    end               
                                        endcase
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
