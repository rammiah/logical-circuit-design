`timescale 1ns / 1ps

module main(clock, power_btn, red, green, input_num, SEG, AN, LED, change, err, check);
    parameter CHECK = 1;
    parameter ADD = 2;
    parameter CHANGE = 3;
    // 关机状�?�和�?????机状态的灯显�?????
    parameter down = 2'b10;
    parameter up = 2'b01;

    parameter MAX_NUM = 5'b10100;

    reg [1:0] state; // 现在的状�?????

    input clock; // 输入的时钟信号，�?????要使用分频器降低频率
    input power_btn; // 按钮信号
    input [4:0]input_num; // 输入的每瓶的�?????大数�?????
    output red, green;
    output [5:0]LED;
    output [7:0]SEG;
    output [7:0]AN;
    output change;
    output err;
    output check;
    
    assign check = (state == CHECK) & power;
    assign change = (state == CHANGE);
    assign LED[4:0] = ones & {power, power, power, power, power};
    assign err = error;
    assign green = power;
    assign red = ~power;

    wire clk_N;
    wire [4:0] finished_one; // 正在填装的的药数
    reg [4:0] ones; // 每个瓶子的药数限�?????
    wire [9:0] finished_all; // 已完成的瓶数
    reg power;
    wire flash;
    reg rst;
    
    assign LED[5] = clk_N & add & power;
    reg full;
    reg add;
    reg data_ok;
    reg error;
    

    divider #(100_000)display_clk(.click(clock), .clk_N(flash));
    divider div(.click(clock), .clk_N(clk_N)); // 分频�?????
    adder#(.N(4))one_bottle(.add(add), .clk_N(clk_N), .rst(power & ~full), .counter(finished_one));
    adder#(.N(9))all_bottle(.add(add & ~full), .clk_N(clk_N), .rst(power), .counter(finished_all));
    
    display dis(.all(finished_all), .one(finished_one), .SEG(SEG), .AN(AN), .clk(flash));

    initial begin
        // 有点多，等会再写
        state <= CHECK;
        power <= 0;
        add <= 0;
        full <= 0;
        rst <= 1;
        ones <= 0;
        error <= 0;
    end

    always@(posedge clk_N)begin
        if (power) begin
            case (state)
            CHECK: begin
                rst <= 1;
                ones = input_num; // 数据写入寄存�?????
                if (ones > MAX_NUM || ones == 0) begin
                    error <= 1;
                    state <= CHECK;
                end else begin
                    error <= 0;
                    state <= ADD;
                end
            end
            ADD: begin
                full = 0;
                if (finished_one == ones) begin
                    add = 0;
                    state = CHANGE;
                end else begin
                    add = 1;
                    state = ADD;
                end
            end
            CHANGE: begin
                full = 1;
                state = ADD;
            end
            endcase
        end else begin
            state = CHECK;
            add = 0;
            full = 0;
            rst = 0;
            error = 0;
        end
    end

    always@(posedge power_btn) begin
        power <= ~power;
    end
endmodule
