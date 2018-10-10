`timescale 1ns / 1ps

module pattern(code, patt);
    parameter num00 = 4'b0000;
    parameter num01 = 4'b0001;
    parameter num02 = 4'b0010;
    parameter num03 = 4'b0011;
    parameter num04 = 4'b0100;
    parameter num05 = 4'b0101;
    parameter num06 = 4'b0110;
    parameter num07 = 4'b0111;
    parameter num08 = 4'b1000;
    parameter num09 = 4'b1001;
    // 0-9的数字变成显示管上的东西
    
    parameter dec00 = 8'b11000000;
    parameter dec01 = 8'b11111001;
    parameter dec02 = 8'b10100100;
    parameter dec03 = 8'b10110000;
    parameter dec04 = 8'b10011001;
    parameter dec05 = 8'b10010010;
    parameter dec06 = 8'b10000010;
    parameter dec07 = 8'b11111000;
    parameter dec08 = 8'b10000000;
    parameter dec09 = 8'b10011000;
    input [3:0] code; // 输入的原始二进制数字
    output reg [7:0] patt; // 输出的数字，低电平有效

    initial begin
        patt <= 8'b11111111;
    end
    
    always @(code)
    begin
        case(code)
            num00: patt = dec00;
            num01: patt = dec01;
            num02: patt = dec02;
            num03: patt = dec03;
            num04: patt = dec04;
            num05: patt = dec05;
            num06: patt = dec06;
            num07: patt = dec07;
            num08: patt = dec08;
            num09: patt = dec09;
            default: patt = 8'b11111111;
        endcase
    end
    
endmodule
