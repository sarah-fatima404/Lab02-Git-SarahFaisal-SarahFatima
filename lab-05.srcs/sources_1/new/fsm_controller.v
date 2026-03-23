module fsm_counter (
    input clk,
    input rst,
    input [15:0] sw_val,
    output reg [15:0] count_reg
);

    localparam WAIT  = 2'b00;
    localparam LOAD  = 2'b01;
    localparam COUNT = 2'b10;

    reg [1:0] state;

    // 1-second counter for 100 MHz clock
    reg [26:0] sec_counter;
    wire one_sec = (sec_counter == 100_000_000-1);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= WAIT;
            count_reg <= 0;
            sec_counter <= 0;
        end
        else begin
            case (state)

            WAIT: begin
                count_reg <= 0;
                sec_counter <= 0;
                if (sw_val != 0)
                    state <= LOAD;
            end

           LOAD: begin
            case (1'b1)
                sw_val[0]: count_reg <= 0;
                sw_val[1]: count_reg <= 1;
                sw_val[2]: count_reg <= 2;
                sw_val[3]: count_reg <= 3;
                sw_val[4]: count_reg <= 4;
                sw_val[5]: count_reg <= 5;
                sw_val[6]: count_reg <= 6;
                sw_val[7]: count_reg <= 7;
                sw_val[8]: count_reg <= 8;
                sw_val[9]: count_reg <= 9;
                sw_val[10]: count_reg <= 10;
                sw_val[11]: count_reg <= 11;
                sw_val[12]: count_reg <= 12;
                sw_val[13]: count_reg <= 13;
                sw_val[14]: count_reg <= 14;
                sw_val[15]: count_reg <= 15;
                default: count_reg <= 0;
            endcase
        
            sec_counter <= 0;
            state <= COUNT;
        end


            COUNT: begin
                if (one_sec) begin
                    sec_counter <= 0;

                    if (count_reg > 0)
                        count_reg <= count_reg - 1;
                    else
                        state <= WAIT;
                end
                else
                    sec_counter <= sec_counter + 1;
            end

            endcase
        end
    end

endmodule
