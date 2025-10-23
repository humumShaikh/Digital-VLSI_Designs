`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3 
// Engineer: COPPERWIRE
// 
// Create Date: 13.10.2025 22:17:49
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


module CU
    (
        input wire en,
        input wire clk,
        input wire rst,
        output reg [2:0]progMemAdd,
        input wire [15:0]progDataIn,
        output reg [11:0]dataOutAB,
        input wire [7:0]dataInAB,
        output reg [10:0]dataRAMOut
    );
    
    reg [2:0]count = 0;
    reg [2:0]cycle = 0;
    
    always @(posedge clk)
    begin
        
        
        if(rst | en)
        begin
            count <= 0;
            cycle <= 0;
        end
        
        else 
        begin
        case (cycle)
            0   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            1   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            2   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            3   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            4   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            5   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            6   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            7   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
        endcase
        end
    end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
endmodule