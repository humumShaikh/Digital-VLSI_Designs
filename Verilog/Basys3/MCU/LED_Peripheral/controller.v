`timescale 1ns / 1ps

module controller(
    input wire clock,
    output reg reset_n,
    output reg write_enable,
    output reg [7:0] write_address,
    output reg [7:0] write_data
    );
    
    reg [4:0] count = 0;
    
    initial
    begin
        reset_n <= 1;
        write_enable <= 0;
        write_address <= 0;
        write_data <= 0;
    end
    
    
    always @(posedge clock)
    begin
        case (count)
        0   :   begin
                write_enable <= 1;
                count <= count + 1;
                end
                
        1   :   begin
                write_address <= 'h01;
                write_data <= 'h80;
                count <= count + 1;
                end         
                
        2   :   begin
                write_address <= 'h02;
                write_data <= 'h07;
                count <= count + 1;
                end                
        
        3   :   begin
                write_address <= 'h03;
                write_data <= 'h80;
                count <= count + 1;
                end             
   
        4   :   begin
                write_enable <= 0;
                count <= count + 1;
                end         
                
        5   :   begin
                count <= count + 1;
                end            
                
        6   :   begin
                write_enable <= 1;
                count <= count + 1;
                end
                
        7   :   begin
                write_address <= 'h01;
                write_data <= 'h80;
                count <= count + 1;
                end            
                
        8   :   begin
                write_address <= 'h02;
                write_data <= 'h90;
                count <= count + 1;
                end               
                
        9   :   begin
                write_address <= 'h03;
                write_data <= 'h09;
                count <= count + 1;
                end               
                
        10   :  begin
                write_enable <= 0;
                count <= count + 1;
                end            
                
        11   :  begin
                count <= count + 1;
                end                          
                
        12   :  begin
                write_enable <= 1;
                count <= count + 1;
                end   
                
        13   :  begin
                write_address <= 'h01;
                write_data <= 'h00;
                count <= count + 1;
                end
                
        14   :  begin
                write_address <= 'h02;
                write_data <= 'h11;
                count <= count + 1;
                end
                
        15   :  begin
                write_address <= 'h03;
                write_data <= 'h11;
                count <= count + 1;
                end     
        
        16   :  begin
                write_enable <= 0;
                count <= count + 1;
                end        
                
        17   :  begin
                count <= count + 1;
                end                
                
        18   :  begin
                write_enable <= 1;
                count <= count + 1;
                end               
                
        19   :  begin
                write_address <= 'h01;
                write_data <= 'h80;
                count <= count + 1;
                end          
                
        20   :  begin
                write_address <= 'h02;
                write_data <= 'h69;
                count <= count + 1;
                end 
                
        21   :  begin
                write_address <= 'h03;
                write_data <= 'h69;
                count <= count + 1; 
                end                
               
        22   :  begin
                write_enable <= 0;
                count <= count + 1; 
                end               
                
        23   :  begin
                count <= 0;
                end                             
                
        endcase
    end
endmodule