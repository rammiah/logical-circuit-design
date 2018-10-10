`timescale 1ns / 1ps

module main(clock, power_btn, red, green, input_num, SEG, AN, LED, change, err, check);
    parameter CHECK = 1;
    parameter ADD = 2;
    parameter CHANGE = 3;

    parameter MAX_NUM = 5'b10100;

    reg [1:0] state; // 状态机的状态

    input clock; // 输入的时钟信号
    input power_btn; // 按钮信号
    input [4:0]input_num; // 输入的每瓶的最大装药数
    output red, green;
    output [5:0]LED;
    output [7:0]SEG;
    output [7:0]AN;
    output change;
    output err; // 错误指示
    output check;
    
    assign check = (state == CHECK) & power;
    assign change = (state == CHANGE);
    assign LED[4:0] = ones & {power, power, power, power, power};
    assign err = error;
    assign green = power;
    assign red = ~power;

    wire clk_N;
    wire [4:0] finished_one; // 正在填装的的药数
    reg [4:0] ones; // 每个瓶子的药数限制
    wire [9:0] finished_all; // 已完成的所有数目
    reg power; // 电源指示
    wire flash; // 数码管刷新脉冲
    reg rst; // 清零信号，开机时使用
    
    assign LED[5] = clk_N & add & power; // 加法指示
    reg full;
    reg add;
    reg data_ok;
    reg error; // 错误信号
    

    divider #(100_000)display_clk(.click(clock), .clk_N(flash)); // 数码管分频
    divider div(.click(clock), .clk_N(clk_N)); // 加法信号分频
    // 加法器
    adder#(.N(4))one_bottle(.add(add), .clk_N(clk_N), .rst(power & ~full), .counter(finished_one));
    adder#(.N(9))all_bottle(.add(add & ~full), .clk_N(clk_N), .rst(power), .counter(finished_all));
    // 数码管显示
    display dis(.all(finished_all), .one(finished_one), .SEG(SEG), .AN(AN), .clk(flash));

    initial begin
        // 初始化的有点多
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
                ones = input_num; // 数据写入寄存器保存
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
                // 装到了限制进入换瓶状态
                if (finished_one == ones) begin
                    add = 0;
                    state = CHANGE;
                end else begin
                    // 否则继续加法状态
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
            // 关机状态
            state = CHECK;
            add = 0;
            full = 0;
            rst = 0;
            error = 0;
            ones <= 0;
        end
    end

    always@(posedge power_btn) begin
        // 电源键按下切换系统状态
        power <= ~power;
    end
endmodule
