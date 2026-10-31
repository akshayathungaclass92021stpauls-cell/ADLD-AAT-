// Code your design here
module moore_101(
    input clk, reset, x,
    output reg z
);
    reg [1:0] state, next_state;

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    // State register
    always @(posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S1 : S2;
            S2: next_state = x ? S3 : S0;
            S3: next_state = x ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Moore output logic
    always @(*) begin
        z = (state == S3);
    end
endmodule

// Code your testbench here
// or browse Examples
module tb_moore;
    reg clk, reset, x;
    wire z;

    moore_101 uut(clk, reset, x, z);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("moore.vcd");
        $dumpvars(0, tb_moore);

        $monitor("Time=%0t x=%b z=%b",
                 $time, x, z);

        clk = 0;
        reset = 1;
        x = 0;

        #10 reset = 0;

        // Input sequence: 10101
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;
        @(negedge clk) x = 0;
        @(negedge clk) x = 1;

        @(negedge clk);
        $finish;
    end
endmodule
