//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire
// 
// Create Date: 28.10.2025 19:40:18
// Design Name: 
// Project Name: 
// Target Devices: Basys3   (xc7a35tcpg236-1)
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module BCD(
    input wire [5:0]sec,
    input wire [5:0]min,
    output wire [3:0]ThD,HD,TD,UD
    );    
    
    assign UD = sec % 10;
    assign TD = sec / 10;
    
    assign HD = min % 10;
    assign ThD = min / 10;
    
endmodule
