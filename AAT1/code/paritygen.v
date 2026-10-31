// Code your design here
module parity_generator_checker(
    input [3:0] data,
    input parity_in,
    output even_parity,
    output odd_parity,
    output error
);

    // Generate parity bits
    assign even_parity = ^data;
    assign odd_parity  = ~(^data);

    // Check received data using even parity
    assign error = ^{data, parity_in};

endmodule

// Code your testbench here
// or browse Examples
module testbench;

    reg [3:0] data;
    reg parity_in;

    wire even_parity;
    wire odd_parity;
    wire error;

    parity_generator_checker uut(
        .data(data),
        .parity_in(parity_in),
        .even_parity(even_parity),
        .odd_parity(odd_parity),
        .error(error)
    );

    initial begin
        $dumpfile("parity.vcd");
        $dumpvars(0, testbench);

        $monitor("Data=%b | Even=%b | Odd=%b | Parity_in=%b | Error=%b",
                 data, even_parity, odd_parity, parity_in, error);

        data = 4'b1011;
        parity_in = 1'b1; #10;

        data = 4'b1011;
        parity_in = 1'b0; #10;

        data = 4'b1100;
        parity_in = 1'b0; #10;

        $finish;
    end

endmodule
