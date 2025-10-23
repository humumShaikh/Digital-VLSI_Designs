module ALU
    (
        input wire [11:0]DIN,
        output reg [7:0]DOUT
    );
    
    always @(*)
    begin
        case (DIN[3:0])
            0   :   ;
            1   :   DOUT <= DIN[11:8] + DIN[7:4];
            2   :   DOUT <= DIN[11:8] - DIN[7:4];
            3   :   DOUT <= DIN[11:8] * DIN[7:4];
            4   :   DOUT <= DIN[11:8] / DIN[7:4];
            5   :   DOUT <= DIN[11:8] & DIN[7:4];
            6   :   DOUT <= DIN[11:8] | DIN[7:4];
            7   :   DOUT <= ~DIN[11:8];
            8   :   DOUT <= DIN[11:8] ^ DIN[7:4];
        endcase
    end
    
endmodule
