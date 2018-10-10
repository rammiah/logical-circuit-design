`timescale 1ns / 1ps

module divider(click, clk_N);

    input click; // 原始信号
    output reg clk_N; // 输出的信�?
    parameter N = 100_000_000; // 2s�?个脉冲，周期0.5Hz
    reg [31:0] counter;

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
