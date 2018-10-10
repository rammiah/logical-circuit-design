`timescale 1ns / 1ps

module divider(click, clk_N);

    input click; // 输入脉冲
    output reg clk_N; // 输出信号
    parameter N = 100_000_000; // 半周期脉冲数
    reg [31:0] counter; // 内部计数器

    initial begin
        counter <= 0;
        clk_N <= 0;
    end

    always@(posedge click)begin
        counter <= counter + 1;
        if (counter >= N) begin
            counter <= 0;
            clk_N <= ~clk_N;
        end
    end

endmodule
