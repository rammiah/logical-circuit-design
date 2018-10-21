`timescale 1ns / 1ps

module mian_tb();
    reg [10:0] i;
    reg x;
    reg power;
    reg next;

    main #(.BIGN(1))main(.clock(x), .power_btn(power), .input_num(5'b00001), .next_btn(next));
    
    
    initial begin
        i <= 0;
        x <= 1;
        power = 0;
        next <= 0;
        #10 power = 1;
        #10 power = 0;
        for (i = 0; i < 1000; i = i + 1) begin
            #2 x <= ~x;
        end
    end

endmodule
