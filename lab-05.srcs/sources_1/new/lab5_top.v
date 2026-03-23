module lab5_top(
    input clk,
    input rst_btn,
    input [15:0] sw_phys,
    output [15:0] led_phys,
    output [6:0] seg,
    output [3:0] an
);

    wire clean_rst;
    wire [15:0] current_count;

    debouncer db (
        .clk(clk),
        .pbin(rst_btn),
        .pbout(clean_rst)
    );

    fsm_counter fsm (
        .clk(clk),
        .rst(clean_rst),
        .sw_val(sw_phys),
        .count_reg(current_count)
    );

    sevenseg_basys3 display (
        .clk(clk),
        .rst(clean_rst),
        .value(current_count),
        .seg(seg),
        .an(an)
    );

    assign led_phys = current_count;

endmodule
