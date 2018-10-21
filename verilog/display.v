`timescale 1ns / 1ps

module display(all, one, SEG, AN, clk, power);
    // 显示模块
    input clk; // 显示脉冲
    input [9:0]all; // 输入的3位的数字
    input [4:0]one; // 2位数字
    output [7:0]SEG; // 数码管
    output reg[7:0]AN; // 控制显示的数码管
    input power;

    parameter NONE = 8'b11111111; // 空信号

    reg [3:0]show;
    reg [3:0]Seg_RAM[7:0];
    reg [3:0]control;

    initial begin
        control <= 0;
    end

    pattern patt(.code(show), .patt(SEG));

    always@(posedge clk) begin
        // control只需要一直0~7循环就行了
        control <= (control + 1) % 8;
    end

    always @(posedge clk) begin
        case (control)
        // AN随control一直切换
        0:AN <= 8'b11111110;
        1:AN <= 8'b11111101;
        4:AN <= 8'b11101111;
        5:AN <= 8'b11011111;
        6:AN <= 8'b10111111;
        default: AN <= NONE;
        endcase
    end

    always @(posedge clk) begin
        if (power) begin
            case (control)
            // show同理
            0:show <= Seg_RAM[0];
            1:show <= Seg_RAM[1];
            4:show <= Seg_RAM[4];
            5:show <= Seg_RAM[5];
            6:show <= Seg_RAM[6];
            default: show <= 4'b0000;
            endcase
        end else begin
            show <= 4'b1111;// 不显示内容
        end
    end


    always@(posedge clk) begin
        // 每次时钟刷新数字Seg内容
        Seg_RAM[0] <= one % 10;
        Seg_RAM[1] <= one / 10;
        Seg_RAM[4] <= all % 10;
        Seg_RAM[5] <= (all / 10) % 10;
        Seg_RAM[6] <= all / 100;
    end
    

endmodule
