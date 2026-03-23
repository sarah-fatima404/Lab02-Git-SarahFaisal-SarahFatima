`timescale 1ns/1ps

module tb_lab5;

    reg clk;
    reg rst_btn;
    reg [15:0] sw_phys;
    wire [15:0] led_phys;

    lab5_top uut (
        .clk(clk),
        .rst_btn(rst_btn),
        .sw_phys(sw_phys),
        .led_phys(led_phys)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_btn = 1;
        sw_phys = 0;

        #20 rst_btn = 0;

        // Load 10
        #10 sw_phys = 16'd10;
        #150;

        // Reset during count
        rst_btn = 1;
        #10 rst_btn = 0;

        // Load 5
        #10 sw_phys = 16'd5;
        #100;

        $finish;
    end

endmodule
