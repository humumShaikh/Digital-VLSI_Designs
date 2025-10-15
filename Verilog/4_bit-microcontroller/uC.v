module uC
    (
        input wire clk,
        input wire [2:0]address,
        output wire [7:0]dataOut
    );
    
    wire [11:0]DIN;
    wire [7:0]DOUT;
    
    wire [2:0]progMemAdd;
    wire [15:0]progDataIn;
    wire [10:0]dataRAMOut;
        
    ALU alu (DIN , DOUT);
    
    CU cu (clk,progMemAdd,progDataIn,DIN,DOUT,dataRAMOut);
    
    PROGRAM_MEMORY program_memory (progMemAdd,progDataIn);
    
    RAM ram (dataRAMOut,address,dataOut);
    
endmodule