module RAM
    (
        input wire [10:0]dataIn,
        input wire [2:0]address,
        output reg [7:0]dataOut
    );
    
    reg [7:0] MEMORY [0:7];
    
    always @(*)
    begin
        case (dataIn[2:0])
            0   :   MEMORY[0] <= dataIn[10:3];
            1   :   MEMORY[1] <= dataIn[10:3];
            2   :   MEMORY[2] <= dataIn[10:3];
            3   :   MEMORY[3] <= dataIn[10:3];
            4   :   MEMORY[4] <= dataIn[10:3];
            5   :   MEMORY[5] <= dataIn[10:3];
            6   :   MEMORY[6] <= dataIn[10:3];
            7   :   MEMORY[7] <= dataIn[10:3];
        endcase
        
        case (address)
            0   :   dataOut <= MEMORY[0];
            1   :   dataOut <= MEMORY[1];
            2   :   dataOut <= MEMORY[2];
            3   :   dataOut <= MEMORY[3];
            4   :   dataOut <= MEMORY[4];
            5   :   dataOut <= MEMORY[5];
            6   :   dataOut <= MEMORY[6];
            7   :   dataOut <= MEMORY[7];
        endcase
    end
    
endmodule
