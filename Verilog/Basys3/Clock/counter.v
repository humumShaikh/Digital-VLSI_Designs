//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 28.10.2025 19:40:18
// Design Name: 
// Module Name: vga_controller
// Project Name: 
// Target Devices: Basys3   (xc7a35tcpg236-1)
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


module counter(
    input wire bClk,
    input wire reset,
    input wire [5:0]setMin,
    output reg [5:0]sec,
    output reg [5:0]min
    );
    
    reg [26:0]maxCount = 100_000_000;
    reg [26:0]count = 0;
        
    initial
    begin
        sec <= 0;
    end
    
    always @(negedge bClk)
    begin
        if(~reset)
        begin
            if(count == maxCount)
            begin
                if(sec == 59)
                begin
                    sec <= 0;
                    if(min == 59) min <= 0;
                    else min <= min + 1;
                end
                else
                begin
                    sec <= sec + 1;
                end
                
                count <= 0;
            end
            
            else
            begin
                count <= count + 1;
            end
        end
        
        else if(reset)
        begin
            count <= 0;
            if(setMin > 59) min <= 59;
            else min <= setMin;
            sec <= 0;
        end
    end

endmodule
