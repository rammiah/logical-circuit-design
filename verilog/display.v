`timescale 1ns / 1ps

module display(all, one, SEG, AN, clk);
    input clk;
    input [9:0]all;
    input [4:0]one;
    output [7:0]SEG;
    output reg[7:0]AN;

    parameter NONE = 8'b11111111;

    reg [3:0]show;
    reg [3:0]Seg_RAM[7:0];
    reg [3:0]control;

    initial begin
        control <= 0;
    end

    pattern patt(.code(show), .patt(SEG));

    always@(posedge clk) begin
        control <= (control + 1) % 8;
    end

    always @(posedge clk) begin
        case (control)
        0:AN <= 8'b11111110;
        1:AN <= 8'b11111101;
        4:AN <= 8'b11101111;
        5:AN <= 8'b11011111;
        6:AN <= 8'b10111111;
        default: AN <= NONE;
        endcase
    end

    always @(posedge clk) begin
        case (control)
        0:show <= Seg_RAM[0];
        1:show <= Seg_RAM[1];
        4:show <= Seg_RAM[4];
        5:show <= Seg_RAM[5];
        6:show <= Seg_RAM[6];
        default: show <= 4'b0000;
        endcase
    end


    always@(posedge clk) begin
        Seg_RAM[0] <= one % 10;
        Seg_RAM[1] <= one / 10;
        Seg_RAM[4] <= all % 10;
        Seg_RAM[5] <= (all / 10) % 10;
        Seg_RAM[6] <= all / 100;
    end
    

endmodule
