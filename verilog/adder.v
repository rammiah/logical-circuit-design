`timescale 1ns / 1ps

module adder(add, clk_N, rst, counter);
    parameter N = 4;
    
    input add; // 输入信号是否加一
    input clk_N; // 时钟信号
    input rst; // 清零信号
    output reg[N:0] counter; // 内部数据

    initial begin
        counter = 0;
    end
    // 下降沿清零和+1
    always@(negedge clk_N, negedge rst) begin
        // 清零
        if (rst == 0) begin
            counter <= 0;
        end else if (add) begin
            counter <= counter + 1; // 每次加一
        end
    end
endmodule
