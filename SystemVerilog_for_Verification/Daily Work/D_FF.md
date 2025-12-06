`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
//////////////////////////////////////////////////////////////////////////////////

module dff(
    input wire clk,
    input wire reset_n,
    input wire d,
    output reg q
    );
    
    always @(posedge clk or negedge reset_n)
    begin
        if(!reset_n) q = 0;
        else q = d;
    end
    
endmodule



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
//////////////////////////////////////////////////////////////////////////////////


module tb_dff();

    reg clk;
    reg reset_n;
    reg d;
    wire q;
    
    dff DFF0 (
        .clk(clk),
        .reset_n(reset_n),
        .d(d),
        .q(q)
    );
    
    always #5 clk <= ~clk;
    
    initial begin
        clk <= 0; reset_n <= 1; d <= 0;
        
        @(posedge clk) d <= 1;
        
        @(posedge clk) d <= 0;
        
        @(posedge clk);
        
        @(posedge clk) d <= 1;
        
        @(posedge clk);
        
        @(posedge clk) d <= 0;
        
        @(negedge clk) d <= 1;
        
        @(negedge clk) d <= 0;
        
        #50;
        
        $finish;
         
    end
    

endmodule

Note - It was observed that even after changing the design from blocking to non-blocking, the difference in the output was only seen after changing the blocking stimulus to non blocking stimulus
