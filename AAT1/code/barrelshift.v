// Code your design here
module Barrel_shifter(
    input [3:0] a,
    input [2:0] mode,
    input [1:0] n,
    output reg [3:0] y
);
    always @(*) begin
        case (mode)
            3'b000: y = a << n;
            3'b001: y = a >> n;
            3'b010: y = $signed(a) >>> n;
            3'b011: y = (a >> n) | (a << (4-n)); // Rotate right
            3'b100: y = (a << n) | (a >> (4-n)); // Rotate left
            default: y = 4'b0000;
        endcase
    end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg [3:0]a;
  reg [2:0]mode;
  reg n;
  wire [3:0]y;
  Barrel_shifter b1(a,mode,n,y);
  initial begin
    $dumpfile("Barrel_shifter.vcd");
    $dumpvars(0,tb);
    a=4'b1101;
    n=1;
    mode=3'b000;
    #5 mode=3'b001;
    #5 mode=3'b010;
    #5 mode=3'b011;
    #5 mode=3'b100;
    #5 n=2;mode=3'b000;
    #5 mode=3'b001;
    #5 mode=3'b010;
    #5 mode=3'b011;
    #5 mode=3'b100;
    #5 $finish;
  end
  initial begin
    $monitor("Time=%0t a=%b mode=%b n=%b y=%b",$time,a,mode,n,y);
  end
endmodule
