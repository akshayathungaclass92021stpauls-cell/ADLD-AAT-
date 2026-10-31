// Code your design here
module jk_ff(
    input j, k, clk, reset,
    output reg q
);
  always @(posedge clk or negedge reset) begin
      if (!reset)
          q <= 1'b0;
      else begin
          case ({j, k})
              2'b00: q <= q;
              2'b01: q <= 1'b0;
              2'b10: q <= 1'b1;
              2'b11: q <= ~q;
          endcase
      end
  end
endmodule

module counter_async(
    input clk, reset,
    output [3:0] q
);
    jk_ff j1(1'b1, 1'b1, clk, reset, q[0]);
    jk_ff j2(1'b1, 1'b1, q[0], reset, q[1]);
    jk_ff j3(1'b1, 1'b1, q[1], reset, q[2]);
    jk_ff j4(1'b1, 1'b1, q[2], reset, q[3]);
endmodule

module tb;
  reg clk,reset;
  wire [3:0]q;
  counter_async c1(clk,reset,q);
  initial begin
    $dumpfile("counter_async.vcd");
    $dumpvars(0,tb);
    clk=1;reset=0;
    #5 reset=1;
    #40 $finish;
  end
  always #5 clk=~clk;
  initial begin
    $monitor("Time=%0t clk=%b reset=%b q=%b",$time,clk,reset,q);
  end
endmodule
