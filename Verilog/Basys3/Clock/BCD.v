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