`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 20.01.2026 19:56:04
// Design Name: 
// Module Name: tb_SPI_M
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


module tb_SPI_M;

    reg               clk;
    reg               reset;
    reg       [7:0]   din;
    reg               start;
    
    reg               MISO;
    wire              MOSI;
    wire              SS;
    wire              SCLK;
    
    
    reg [7:0]   tempReg = 8'hF9;
    
    SPI_M   SPIM
    (
        .clk(clk),
        .reset(reset),
        .din(din),
        .start(start),
        
        .MISO(MISO),
        .MOSI(MOSI),
        .SS(SS),
        .SCLK(SCLK)
    );
    
    
    always #5 clk <= ~clk;
    
    initial
    begin
        clk <= 0;
        reset <= 0;
        din <= 8'hA1;
        start <= 0;
        
        tempReg <= 8'h66;       //00 00
        
        initComm(8'h69);
        
        tempReg <= 8'h61;        //00 01
        
        initComm(8'hAD);
        
        tempReg <= 8'h68;       //00 10
        
        initComm(8'hAD);
        
        tempReg <= 8'h69;       //00 11
        
        initComm(8'hAD);
        
        tempReg <= 8'h76;       //01 00
        
        initComm(8'hAD);
        
        tempReg <= 8'h75;       //01 01
        
        initComm(8'hAD);
        
        tempReg <= 8'h78;       //01 10
        
        initComm(8'hAD);
        
        tempReg <= 8'h7F;       //01 11
        
        initComm(8'hAD);
        
        tempReg <= 8'hA6;       //10 00
        
        initComm(8'hAD);
        
        tempReg <= 8'hA1;       //10 01
        
        initComm(8'hAD);
        
        tempReg <= 8'hA8;       //10 10
        
        initComm(8'hAD);
        
        tempReg <= 8'hA9;       //10 11
        
        initComm(8'hAD);
        
        tempReg <= 8'hF6;       //11 00
        
        initComm(8'hAD);
        
        tempReg <= 8'hF1;       //11 01
        
        initComm(8'hAD);
        
        tempReg <= 8'hF8;       //11 10
        
        initComm(8'hAD);
        
        tempReg <= 8'hFF;       //11 11
        
        initComm(8'hAD);
                
        #120;
        $finish; 
        
    end
    
    
    task initComm
    (
        input [7:0] d
    );
        begin
            @(posedge clk)
            begin
                din <= d;
                start <= 1'b1;
            end
            
            @(posedge clk)
            begin
                start <= 1'b0;
            end
            
            repeat(8)
            begin
                @(posedge clk)
                begin
                    MISO <= tempReg[7];
                    tempReg <= tempReg << 1;
                end
            end
        end
    endtask
    
    
endmodule
