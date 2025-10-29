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



module displayer
    (
        input wire clk,
        input wire [7:0]thd,hd,td,ud,
        output reg [3:0]an,
        output reg [7:0]digit
    );
    
    reg [1:0] dcount = 0;
    
    reg [18:0] max_count = 10_000;
    reg [18:0] count = 0;
    
    always @(posedge clk)
    begin
    
    if(count==max_count)
    begin
        count <= 0;
        case (dcount)
            0   :   begin
                    an <= 4'b1110;
                    digit <= ud;
                    dcount <= dcount + 1;
                    end     
   
            1   :   begin
                    an <= 4'b1101;
                    digit <= td;
                    dcount <= dcount + 1;
                    end    
                    
            2   :   begin
                    an <= 4'b1011;
                    digit <= hd;
                    dcount <= dcount + 1;
                    end             
                    
            3   :   begin
                    an <= 4'b0111;
                    digit <= thd;
                    dcount <= 0;
                    end                     
                
        endcase
    end
    
    else count <= count + 1; 
    
    end
    
    
endmodule
