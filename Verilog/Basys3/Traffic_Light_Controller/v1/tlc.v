`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CWIR3
// Engineer: copperwire , alen
// 
// Create Date: 11.11.2025 07:53:26
// Design Name: 
// Module Name: tlc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
                                                     //road3//
                                                     //     //
                                                     //     //
                                                     //     //
                                          /////////////     /////////////
                                          //road2                 road4//
                                          /////////////     /////////////
                                                     //     //
                                                     //     //
                                                     //     //
                                                     //road1//                

module tlc(
    input wire clk,
    input wire reset,
    output reg [4:0] sec,
    output reg [3:0] left,      //road1     road2       raod3       road4
    output reg [3:0] right,     //road1     road2       road3       road4
    output reg [3:0] straight,  //road1     road2       road3       road4
    output reg [3:0] red        //road1     road2       road3       road4
    );
    
    
    reg [26:0] max_count = 100_000_000;
    reg [26:0] count = 0;

                    
   reg [1:0] state = 0;             
    
    
    always @(posedge clk)
    begin
    
    if(reset == 1)
    begin
        sec <= 29;
        count <= 0;
        left <= 4'b1000;
        right <= 4'b0000;
        straight <= 4'b1000;
        red <= 4'b0111;
    end 
    
    
    else if(reset == 0)
    begin
    
        if(count == max_count)
        begin
            count <= 0;
            
            if(sec > 0) sec <= sec - 1;
            if(sec == 1) state <= state + 1; 
            else if(sec == 0)
            begin
                sec <= 29;
            end
            
            case (state)
            0   :   begin
                    left <= 4'b1000;
                    right <= 4'b0000;
                    straight <= 4'b1000;
                    red <= 4'b0111;
                    end
                    
            1   :   begin
                    left <= 4'b0100;
                    right <= 4'b0100;
                    straight <= 4'b0100;
                    red <= 4'b1011;
                    end                
                    
            2   :   begin
                    left <= 4'b0010;
                    right <= 4'b0010;
                    straight <= 4'b0010;
                    red <= 4'b1101;
                    end            
                    
            3   :   begin
                    left <= 4'b0001;
                    right <= 4'b0001;
                    straight <= 4'b0001;
                    red <= 4'b1110;
                    end  
        endcase
        end
        
        else if(count != max_count) count <= count + 1;
    
    end
    
    
    end //always 
    
endmodule