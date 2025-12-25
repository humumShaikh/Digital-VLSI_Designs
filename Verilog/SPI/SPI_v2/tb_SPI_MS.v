`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 24.12.2025 23:53:44
// Design Name: 
// Module Name: tb_SPI_MS
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


module tb_SPI_MS();

    reg [7:0] din;
    reg     start;
    reg     clk;
    reg     reset;
//    wire    miso;
//    wire    mosi;
//    wire    sclk;
//    wire    ss;
    
    wire miso_wire;
    wire mosi_wire;
    wire sclk_wire;
    wire ss_wire;
    
    SPI_M SPIM
    (
        .din(din),
        .start(start),
        .clk(clk),
        .reset(reset),
        .miso(miso_wire),
        .mosi(mosi_wire),
        .sclk(sclk_wire),
        .ss(ss_wire)
    );
    
    
    SPI_S SPIS
    (
        .sclk(sclk_wire),
        .mosi(mosi_wire),
        .ss(ss_wire),
        .miso(miso_wire)
    );
    
   
    always #5 clk <= ~clk;
    
    
    initial
    begin
        start <= 1'b0;
        clk <= 1'b0;
        reset <= 1'b0;
        din <= 8'h00;
                
        @(posedge clk) 
        begin
            din <= 8'h11;
            start <= 1'b1;
        end
        
        @(posedge clk) 
        begin
            din <= 8'h00;
            start <= 1'b0;
        end
        #100;
        
        
        @(posedge clk) 
        begin
            din <= 8'h22;
            start <= 1'b1;
        end
        
        @(posedge clk) 
        begin
            din <= 8'h00;
            start <= 1'b0;
        end
        #100;
        
        
        @(posedge clk) 
        begin
            din <= 8'h33;
            start <= 1'b1;
        end
        
        @(posedge clk) 
        begin
            din <= 8'h00;
            start <= 1'b0;
        end
        
        #100;
        
        @(posedge clk) start <= 1'b1;

        @(posedge clk) start <= 1'b0;
        
        #100;
        
        $finish;
    end

endmodule
