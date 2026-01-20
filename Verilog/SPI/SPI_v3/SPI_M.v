`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 23.12.2025 22:16:22
// Design Name: SPI Master
// Module Name: SPI_M
// Project Name: SPI
// Target Devices: xc7a35tcpg236-1
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: SPI Mode 1 : CPOL = 0 CPHA = 1 , Tx +posedge Rx -negedge
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI_M
(
    input   wire            clk,
    input   wire            reset,
    input   wire    [7:0]   din,
    input   wire            start,
    
    input   wire            MISO,
    output  reg             MOSI,
    output  reg             SS,
    output  wire            SCLK
);

    localparam  [7:0]   IDLE                =   0,
                        SHIFT               =   1,
                        SAMPLE              =   2;
    
    reg [7:0]   STATE = IDLE;
    
    reg [7:0]   masterData;
    
    reg [3:0]   shiftCount = 7;
    reg [3:0]   sampleCount = 7;
    
    reg sclk_flag;
    
    always @(posedge clk or negedge clk)
    begin
        if(reset == 1'b1)
        begin
            if(clk == 1'b1)   resetSPI();
        end
        
        else
        begin
                        if(clk)
                        begin
                            case (STATE)
                                IDLE                :   begin
                                                            if(start == 1'b1)
                                                            begin
                                                                STATE <= SHIFT;
                                                                masterData <= din;
                                                                SS <= 0;
                                                            end
                                                            
                                                            else
                                                            begin
                                                                MOSI <= 0;
                                                                SS <= 1;
                                                                sclk_flag <= 0;
                                                            end
                                                        end
               
                                SHIFT               :   begin
                                                            sclk_flag <= 1;
                                                            if(shiftCount > 0)
                                                            begin
                                                                STATE <= SAMPLE;
                                                                MOSI <= masterData[7];
                                                                masterData <= masterData << 1;
                                                                shiftCount <= shiftCount - 1;
                                                            end
                                                            
                                                            else
                                                            begin
                                                                STATE <= SAMPLE;
                                                                shiftCount <= 7;
                                                                MOSI <= masterData[7];
                                                                masterData <= masterData << 1;
                                                            end
                                                        end                                         
                            endcase
                        end
            
            
            
                        else if(~clk)
                        begin
                            case (STATE)
                                SAMPLE              :   begin
                                                            if(sampleCount > 0)
                                                            begin
                                                                STATE <= SHIFT;
                                                                masterData[0] <= MISO;
                                                                sampleCount <= sampleCount - 1;
                                                            end
                                                            
                                                            else 
                                                            begin
                                                                STATE <= IDLE;
                                                                masterData[0] <= MISO;
                                                                sampleCount <= 7;
                                                            end
                                                        end
                            endcase
                        end
                        
                        
        end
    end        
    
    
    task resetSPI;
        begin
            STATE <= IDLE;
            MOSI <= 0;
            SS <= 1;
            masterData <= 0;
            shiftCount <= 7;
            sampleCount <= 7;
        end
    endtask 

    
    assign SCLK = (sclk_flag) ? clk : 1'b0;

endmodule
