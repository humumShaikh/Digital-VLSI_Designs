//UART Receiver//

module Receiver(
    input wire Rx,
    input wire clk,
    output reg[7:0]dataReceived
    );
    
    reg flag = 1;
    reg [3:0]count = 0;
    reg [0:10]data = 0;
    
    initial dataReceived <= 0;
    
    always @(*) begin
        if(~Rx) begin
            flag <= 0;
        end
        else if(count==11) begin
            flag <= 1;
        end
    end
    
    always @(posedge clk) begin
        if(flag==0) begin
            case (count)
                0   :   begin data[0] <= Rx; count <= count+1; end
                1   :   begin data[1] <= Rx; count <= count+1; end
                2   :   begin data[2] <= Rx; count <= count+1; end
                3   :   begin data[3] <= Rx; count <= count+1; end
                4   :   begin data[4] <= Rx; count <= count+1; end
                5   :   begin data[5] <= Rx; count <= count+1; end
                6   :   begin data[6] <= Rx; count <= count+1; end
                7   :   begin data[7] <= Rx; count <= count+1; end
                8   :   begin data[8] <= Rx; count <= count+1; end
                9   :   begin data[9] <= Rx; count <= count+1; end
                10   :   begin data[10] <= Rx; count <= count+1; end
            endcase
        end
        else if(count==11) begin
            count <= 0;
            dataReceived <= data[1:8];
        end
    end
    
endmodule
