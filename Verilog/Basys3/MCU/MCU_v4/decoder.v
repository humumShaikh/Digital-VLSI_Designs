`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2025 09:53:31
// Design Name: 
// Module Name: decoder
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


module decoder(
    input wire [4:0] FSM_STATE,
    output reg [7:0] o1,
    output reg [7:0] o2,
    output reg [7:0] o3,
    output reg [7:0] o4
    );
    
    always @(*)
    begin //
        case (FSM_STATE) //-//
        0   :   begin //-//-// FETCH
                    o4 = 8'b1000_1110; //F
                    o3 = 8'b1000_0110; //E
                    o2 = 8'b1000_0111; //t
                    o1 = 8'b1000_1001; //H
                end //-//-//
        1   :   begin //-//-// DECODE
                    o4 = 8'b1010_0001; //d
                    o3 = 8'b1010_0111; //c
                    o2 = 8'b1010_0011; //o
                    o1 = 8'b1010_0001; //d
                end //-//-// 
        3   :   begin //-//-// getLEDCtrl
                    o4 = 8'b1100_0111; //L
                    o3 = 8'b1000_0110; //E
                    o2 = 8'b1010_0001; //d
                    o1 = 8'b1100_0110; //C
                end //-//-//
        4   :   begin //-//-// setLEDCtrl
                    o4 = 8'b1001_0010; //S
                    o3 = 8'b1100_0111; //L
                    o2 = 8'b1010_0001; //d
                    o1 = 8'b1100_0110; //C
                end //-//-//   
        5   :   begin //-//-// getLEDData01
                    o4 = 8'b1100_0111; //L
                    o3 = 8'b1000_0110; //E
                    o2 = 8'b1010_0001; //d
                    o1 = 8'b1111_1001; //1
                end //-//-//  
        6   :   begin //-//-// setLEDData01
                    o4 = 8'b1001_0010; //S
                    o3 = 8'b1100_0111; //L
                    o2 = 8'b1010_0001; //d
                    o1 = 8'b1111_1001; //1
                end //-//-//           
        7   :   begin //-//-// getLEDData02
                    o4 = 8'b1100_0111; //L
                    o3 = 8'b1000_0110; //E
                    o2 = 8'b1010_0001; //d
                    o1 = 8'b1010_0100; //2
                end //-//-//   
        8   :   begin //-//-// setLEDData02
                    o4 = 8'b1001_0010; //S
                    o3 = 8'b1100_0111; //L
                    o2 = 8'b1010_0001; //d
                    o1 = 8'b1010_0100; //2
                end //-//-//                 
        9   :   begin //-//-// getCounterData
                    o4 = 8'b1010_0111; //c
                    o3 = 8'b1010_1011; //n
                    o2 = 8'b1000_0111; //t
                    o1 = 8'b1010_0001; //d
                end //-//-//      
        10  :   begin //-//-// setCounterData
                    o4 = 8'b1001_0010; //S
                    o3 = 8'b1010_0111; //c
                    o2 = 8'b1000_0111; //t
                    o1 = 8'b1010_0001; //d
                end //-//-//  
        11  :   begin //-//-// incCunter
                    o4 = 8'b1110_1111; //i
                    o3 = 8'b1010_1011; //n
                    o2 = 8'b1010_0111; //c
                    o1 = 8'b1100_0110; //C
                end //-//-//              
        12  :   begin //-//-// getCmpData
                    o4 = 8'b1100_0110; //C 
                    o3 = 8'b1010_0011; //o
                    o2 = 8'b1000_1100; //P
                    o1 = 8'b1010_0001; //d
                end //-//-//    
        13  :   begin //-//-// setCmpData
                    o4 = 8'b1001_0010; //S
                    o3 = 8'b1100_0110; //C 
                    o2 = 8'b1000_1100; //P
                    o1 = 8'b1010_0001; //d
                end //-//-//            
        14  :   begin //-//-// CJE
                    o4 = 8'b1111_1111; //
                    o3 = 8'b1100_0110; //C 
                    o2 = 8'b1110_0000; //J
                    o1 = 8'b1000_0110; //E
                end //-//-//      
        15  :   begin //-//-// getJmpAddress
                    o4 = 8'b1110_0000; //J
                    o3 = 8'b1000_1100; //P
                    o2 = 8'b1000_1000; //A
                    o1 = 8'b1010_0001; //d
                end //-//-//   
        16  :   begin //-//-// JMP
                    o4 = 8'b1110_0000; //J
                    o3 = 8'b1100_0001; //U                
                    o2 = 8'b1010_1011; //n
                    o1 = 8'b1000_1100; //P
                end //-//-//         
        17  :   begin //-//-// END
                    o4 = 8'b1111_1111; //
                    o3 = 8'b1000_0110; //E
                    o2 = 8'b1010_1011; //n
                    o1 = 8'b1010_0001; //d
                end //-//-//                                                                 
        endcase //-//
    end //
    
    task decode;
        input [3:0]in;
        output [7:0]out;
        begin
        case (in)
            0   :   out = 8'b1100_0000;//s7 s6 s5 s4 s3 s2 s1 s0   sDP sG sF sE sD sC sB sA
            1   :   out = 8'b1111_1001;
            2   :   out = 8'b1010_0100;
            3   :   out = 8'b1011_0000;
            4   :   out = 8'b1001_1001;
            5   :   out = 8'b1001_0010;
            6   :   out = 8'b1000_0010;
            7   :   out = 8'b1111_1000;
            8   :   out = 8'b1000_0000;
            9   :   out = 8'b1001_0000;
            10   :   out = 8'b1000_1000; //A
            11   :   out = 8'b1000_0011; //b
            12   :   out = 8'b1010_0111; //c 8'b1100_0110; //C
            13   :   out = 8'b1010_0001; //d
            14   :   out = 8'b1000_0110; //E
            15   :   out = 8'b1000_1110; //F
        endcase
        end
    endtask
    
    /////0/////
    //       //
    //5      //1
    //       //
    /////6/////
    //       //
    //4      //2
    //       //
    /////3/////     //DP  
    
endmodule
