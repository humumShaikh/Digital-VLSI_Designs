`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: COPPERWIRE
// 
// Create Date: 13.10.2025 21:44:58
// Design Name: 
// Module Name: PROGRAM_MEMORY
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


module PROGRAM_MEMORY
    (
    input wire sin,
    input wire clk,
    input wire en,
    input wire [2:0]address,
    output reg [15:0]dout
    );
    
    reg [15:0] ROM [0:7];                                  //   16'b1001__0100__0010__0__111;  //A:9   B:4     OP:SUB  RAM 111
    reg [2:0] cycle = 0;
    reg [3:0] count = 0;
    
    always @(*)
    if(~en)
    begin
        begin
            case (address)                                                  //A[3:0]__B[3:0]__OP[3:0]__Reg/Ram__RamLocation[2:0]
                3'b000 :   dout <= ROM[0];  //A:15  B:14    OP:ADD  RAM 000
                3'b001 :   dout <= ROM[1];  //A:9   B:4     OP:SUB  RAM 111
                3'b010 :   dout <= ROM[2];  //A:13  B:2     OP:ADD  RAM 101
                3'b011 :   dout <= ROM[3];  //A:1   B:6     OP:AND  RAM 110
                3'b100 :   dout <= ROM[4];  //A:10  B:5     OP:XOR  RAM 100
                3'b101 :   dout <= ROM[5];
                3'b110 :   dout <= ROM[6];
                3'b111 :   dout <= ROM[7];
            endcase    
        end
    end
    
    always @(posedge clk)
    begin
    
        if(en)
        begin
            case (cycle)
                0   :   begin
                                    if(count==16) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
                1   :   begin
                                    if(count==16) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
                2   :   begin
                                    if(count==8) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
                3   :   begin
                                    if(count==8) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
                4   :   begin
                                    if(count==8) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
                5   :   begin
                                    if(count==8) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
                6   :   begin
                                    if(count==8) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
                7   :   begin
                                    if(count==8) cycle <= cycle + 1;
                                    else 
                                    begin
                                        ROM[cycle][count] <= sin;
                                        count <= count + 1;
                                    end           
                        end
            endcase
        end
    
    end

    
endmodule
