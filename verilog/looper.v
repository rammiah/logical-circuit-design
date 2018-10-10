`timescale 1ns / 1ps

odule looper(add, clr, counter);
    parameter N = 4;
    output reg [N:0]counter; // 计数�?
    input add;// 加一信号
    input clr; // 清零信号

    initial begin
        counter <= 0;
    end

    always @(posedge add, posedge clr)begin
        if (clr) begin
            counter <= 0; 
        end else begin
            counter <= counter + 1;
        end
    end
endmodule
