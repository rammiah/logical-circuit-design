`timescale 1ns / 1ps

module divider(click, clk_N);

    input click; // ???????
    output reg clk_N; // ?????
    parameter N = 100_000_000; // ????100MHz?2s??????????2s?N???????
    reg [31:0] counter; // ?????

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
