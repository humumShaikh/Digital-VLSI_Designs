module PROGRAM_MEMORY
    (
    input wire [2:0]address,
    output reg [15:0]dout
    );
    
    always @(*)
    begin
        case (address)                                                  //A[3:0]__B[3:0]__OP[3:0]__Reg/Ram__RamLocation[2:0]
            3'b000 :   dout <= 16'b1111__1110__0001__0__000;  //A:15  B:14    OP:ADD  RAM 000
            3'b001 :   dout <= 16'b1001__0100__0010__0__111;  //A:9   B:4     OP:SUB  RAM 111
            3'b010 :   dout <= 16'b1101__0010__0001__0__101;  //A:13  B:2     OP:ADD  RAM 101
            3'b011 :   dout <= 16'b0001__0110__0101__0__110;  //A:1   B:6     OP:AND  RAM 110
            3'b100 :   dout <= 16'b1010__0101__1000__0__100;  //A:10  B:5     OP:XOR  RAM 100
            3'b101 :   dout <= 16'b0000__0000__0000__0__000;
            3'b110 :   dout <= 16'b0000__0000__0000__0__000;
            3'b111 :   dout <= 16'b0000__0000__0000__0__000;
        endcase    
    end
    
endmodule
