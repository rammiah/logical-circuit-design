`timescale 1ns / 1ps

module divider_tb();
    reg[16:0] clock;
    reg x;
    wire clk_N;
    
    divider #(4)div(.click(x), .clk_N(clk_N));
    
    
    initial begin
        clock <= 0;
        x <= 0;
        for (clock = 0; clock < 40;) begin
        #10 clock = clock + 1;
        x = ~x;
        end
    end
endmodule
