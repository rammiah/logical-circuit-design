`timescale 1ns / 1ps

module adder_tb();
    reg[10:0] i;
    reg x;
    reg rst;
    wire [4:0] counter;
    
    adder add(.add(1), .clk_N(x), .rst(rst), .counter(counter));
    
    initial begin
        i = 0;
        x = 1;
        rst = 1;
        #1;
        
        for (i = 0; i < 50; i = i + 1) begin
            rst = 1;
            #5 x = ~x;
            if (i == 25) begin
                rst <= 0;
            end
        end
    end
    

endmodule
