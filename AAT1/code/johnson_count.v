// Code your design here
module d_ff(
    input d,clk,reset,
    output reg q
);
    always@(posedge clk)begin
    if(reset)
      q<=1'b0;
    else
      begin
        if(d)
          q<=1;
        else
          q<=0;
      end
  end
endmodule
module john_counter(
    input clk,reset,
    output reg [3:0]q);
    wire [3:0] d;
    assign d[0] = reset ? 1'b1 : (~q[3]);
    assign d[1] = reset ? 1'b0 : q[0];
    assign d[2] = reset ? 1'b0 : q[1];
    assign d[3] = reset ? 1'b0 : q[2];
    d_ff d1(d[0], clk, 1'b0, q[0]);
    d_ff d2(d[1], clk, 1'b0, q[1]);
    d_ff d3(d[2], clk, 1'b0, q[2]);
    d_ff d4(d[3], clk, 1 me, q[3]); // Note: 1'b0 intended in instantiation
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg clk,reset;
  wire [3:0]q;
  john_counter j1(clk,reset,q);
  initial begin
    $dumpfile("john_counter.vcd");
    $dumpvars(0,tb);
    clk=0;reset=1;
    #5 reset=0;
    #50 $finish;
  end
  always #5 clk=~clk;
  initial begin
    $monitor("Time=%0t clk=%b reset=%b q=%b",$time,clk,reset,q);
  end
endmodule
