//UART Transmitter//
module Transmitter(
    input wire clk,
    input wire control,
    input wire [7:0]data,
    output reg Tx
    );
    
    reg [3:0]count=0;
    reg flag=0;
    
    initial Tx <= 1;
    
    always @(*) begin
        if(control) begin
            flag <= 1;
        end
        else if(count==11) begin
            flag <= 0;
        end
    end

    always @(posedge clk) begin
        if(flag==1) begin
            case (count)
                0   :   begin Tx <= 1'b0; count<=count+1; end
                1   :   begin Tx <= data[7]; count<=count+1; end
                2   :   begin Tx <= data[6]; count<=count+1; end
                3   :   begin Tx <= data[5]; count<=count+1; end
                4   :   begin Tx <= data[4]; count<=count+1; end
                5   :   begin Tx <= data[3]; count<=count+1; end
                6   :   begin Tx <= data[2]; count<=count+1; end
                7   :   begin Tx <= data[1]; count<=count+1; end
                8   :   begin Tx <= data[0]; count<=count+1; end
                9   :   begin Tx <= ^data; count<=count+1; end
                10  :   begin Tx <= 1'b1; count<=count+1; end
            endcase
        end
        else if(count==11) begin
            count <= 0;
        end
    end
    
endmodule
