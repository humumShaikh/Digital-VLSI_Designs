module FIFOH(
    input wire clk,
    input wire reset,
    input wire write_en,
    input wire read_en,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output reg full
);

    reg [7:0] RAM [0:7];

    reg [2:0] wrPtr = 0;
    
    
    initial
    begin   
        full <= 0;
        data_out <= 0;
        RAM[0] <= 0;
        RAM[1] <= 0;
        RAM[2] <= 0;
        RAM[3] <= 0;
        RAM[4] <= 0;
        RAM[5] <= 0;
        RAM[6] <= 0;
        RAM[7] <= 0;
    end

    always @(posedge clk)
    begin

    if(reset == 1)
    begin
    wrPtr <= 0;
    full <= 0;
    end

    else
    begin
    
        if(full == 0)
        begin
            if(write_en == 1    &&  read_en == 0)
            begin
                if(wrPtr != 7)
                begin
                RAM[wrPtr] <= data_in;
                wrPtr <= wrPtr + 1;
                end
                else if(wrPtr == 7)
                begin
                RAM[wrPtr] <= data_in;
                wrPtr <= 0;
                full <= 1;
                end
            end

            else if(write_en == 0   &&  read_en == 1)
            begin
            data_out <= RAM[0];
            RAM[0] <= RAM[1];
            RAM[1] <= RAM[2];
            RAM[2] <= RAM[3];
            RAM[3] <= RAM[4];
            RAM[4] <= RAM[5];
            RAM[5] <= RAM[6];
            RAM[6] <= RAM[7];
            RAM[7] <= 0;
            if(wrPtr > 0) wrPtr <= wrPtr - 1;
            end

            else if(write_en == 1   &&  read_en == 1)
            begin
            case (wrPtr)
            0   :   begin
                    data_out <= data_in;
                    end

            1   :   begin
                    data_out <= RAM[0];
                    RAM[0] <= data_in;
                    end

            2   :   begin
                    data_out <= RAM[0];
                    RAM[0] <= RAM[1];
                    RAM[1] <= data_in;
                    end

            3   :   begin
                    data_out <= RAM[0];
                    RAM[0] <= RAM[1];
                    RAM[1] <= RAM[2];
                    RAM[2] <= data_in;
                    end

            4   :   begin
                    data_out <= RAM[0];
                    RAM[0] <= RAM[1];
                    RAM[1] <= RAM[2];
                    RAM[2] <= RAM[3];
                    RAM[3] <= data_in;
                    end

            5   :   begin
                    data_out <= RAM[0];
                    RAM[0] <= RAM[1];
                    RAM[1] <= RAM[2];
                    RAM[2] <= RAM[3];
                    RAM[3] <= RAM[4];
                    RAM[4] <= data_in;
                    end

            6   :   begin
                    data_out <= RAM[0];
                    RAM[0] <= RAM[1];
                    RAM[1] <= RAM[2];
                    RAM[2] <= RAM[3];
                    RAM[3] <= RAM[4];
                    RAM[4] <= RAM[5];
                    RAM[5] <= data_in;
                    end

            7   :   begin
                    data_out <= RAM[0];
                    RAM[0] <= RAM[1];
                    RAM[1] <= RAM[2];
                    RAM[2] <= RAM[3];
                    RAM[3] <= RAM[4];
                    RAM[4] <= RAM[5];
                    RAM[5] <= RAM[6];
                    RAM[6] <= data_in;
                    end
            endcase
            end
        end
        
        
        else if(full == 1)
        begin
            if(read_en == 1)
            begin
                data_out <= RAM[0];
                RAM[0] <= RAM[1];
                RAM[1] <= RAM[2];
                RAM[2] <= RAM[3];
                RAM[3] <= RAM[4];
                RAM[4] <= RAM[5];
                RAM[5] <= RAM[6];
                RAM[6] <= RAM[7];
                RAM[7] <= 0;
                wrPtr <= wrPtr - 1;
                full <= 0;
            end
        end

    end

    
    end


endmodule
