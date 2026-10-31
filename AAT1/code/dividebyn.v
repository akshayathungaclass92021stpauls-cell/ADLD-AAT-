// Code your design here
module divide_by_n #(
    parameter N = 10
)(
    input clk,
    input reset,
    output reg [$clog2(N)-1:0] count,
    output reg tick
);

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
            tick  <= 0;
        end
        else if (count == N-1) begin
            count <= 0;
            tick  <= 1;
        end
        else begin
            count <= count + 1'b1;
            tick  <= 0;
        end
    end

endmodule

// Code your testbench here
// or browse Examples
module testbench;

    reg clk, reset;
    wire [3:0] count;
    wire tick;

    divide_by_n #(.N(10)) uut (
        .clk(clk),
        .reset(reset),
        .count(count),
        .tick(tick)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("divide_by_n.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        reset = 1;

        #10 reset = 0;
        #120 $finish;
    end

    initial begin
        $monitor("Time=%0t | Count=%d | Tick=%b",
                 $time, count, tick);
    end

endmodule
