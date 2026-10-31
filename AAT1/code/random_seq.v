// Code your design here
module sequence_generator(
    input clk,
    input reset,
    output reg [2:0] q
);

    always @(posedge clk) begin
        if (reset)
            q <= 3'b000;
        else begin
            case (q)
                3'b000: q <= 3'b010; // 0 -> 2
                3'b010: q <= 3'b011; // 2 -> 3
                3'b011: q <= 3'b111; // 3 -> 7
                3'b111: q <= 3'b101; // 7 -> 5
                3'b101: q <= 3'b100; // 5 -> 4
                3'b100: q <= 3'b000; // 4 -> 0
                default: q <= 3'b000;
            endcase
        end
    end

endmodule

// Code your testbench here
// or browse Examples
module testbench;

    reg clk, reset;
    wire [2:0] q;

    sequence_generator uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("sequence.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        reset = 1;

        #10 reset = 0;
        #100 $finish;
    end

    initial begin
        $monitor("Time=%0t | Binary=%b | Decimal=%0d",
                 $time, q, q);
    end

endmodule
