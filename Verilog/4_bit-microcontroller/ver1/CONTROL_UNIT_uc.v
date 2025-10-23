module CU
    (
        input wire clk,
        output reg [2:0]progMemAdd,
        input wire [15:0]progDataIn,
        output reg [11:0]dataOutAB,
        input wire [7:0]dataInAB,
        output reg [10:0]dataRAMOut
    );
    
    reg [2:0]count = 0;
    reg [2:0]cycle = 0;
    
    always @(posedge clk)
    begin
        case (cycle)
            0   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            1   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            2   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            3   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            4   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            5   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            6   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
            7   :   case (count)
                        0   :   begin
                                    progMemAdd <= cycle;
                                    count <= count+1;
                                end
                        1   :   begin
                                    dataOutAB <= progDataIn[15:4];
                                    count <= count+1;
                                end
                        2   :   begin
                                    dataRAMOut <= {dataInAB,cycle};
                                    count <= 0;
                                    cycle <= cycle+1;
                                end
                    endcase
        endcase
    end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
endmodule
