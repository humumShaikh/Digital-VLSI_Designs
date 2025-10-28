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
// Description: To make a display work with Basys3 board on vga, can give inputs of solid colors for checking
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vga_controller(
    input wire clk,
    input wire [11:0] sw,
    output reg hsync,
    output reg vsync,
    output wire [11:0] rgb
    );
    
    reg [1:0] count = 0;
    
    reg [9:0] hcount = 0;
    reg [9:0] vcount = 0;
    
    reg pclk;
    
    reg video_en = 0; 
    
    always @(posedge clk)
    begin
        if(count == 0)
        begin
            count <= count + 1;
            pclk <= 1;
        end
        else
        begin
            count <= count + 1;
            pclk <= 0;
        end
    end
    
    
    always @(posedge pclk)
    begin
        if(hcount == 799) hcount <= 0;
        else    hcount <= hcount + 1;
    end
    
    always @(posedge pclk)
    begin
        if(hcount == 799)
        begin
            if(vcount == 524) vcount <= 0;
            else vcount <= vcount + 1;
        end
    end
    
    always @(*)
    begin
    
        if(hcount <= 639 && vcount <= 479) video_en <= 1;
        else video_en <= 0;
    
        if((hcount >= 656) && (hcount <= 751)) hsync <= 1;
        else hsync <= 0;
        
        if((vcount >= 513) && (vcount <= 515)) vsync <= 1;
        else vsync <= 0;
        
    end
    
    assign rgb = (video_en) ? sw : 12'b0;
    
endmodule
