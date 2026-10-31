// Code your design here
module Alu #(
  parameter N=4
)( input [N-1:0]a,b,
   input [1:0]mode,
   output reg [3:0]y
 );
  always@(*)begin
    case(mode)
      2'b00:y=a+b;
      2'b01:y=a-b;
      2'b10:y=a*b;
      2'b11:y=a/b;
      default:y=1'bx;
    endcase
  end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg [3:0]a,b;
  reg [1:0]mode;
  wire [3:0]y;
  Alu a1(a,b,mode,y);
  initial begin
    $dumpfile("Alu.vcd");
    $dumpvars(0,tb);
    a=4'b1000;b=4'b0010;
    mode=2'b00;
    #5 mode=2'b01;
    #5 mode=2'b10;
    #5 mode=2'b11;
    #5$finish;
  end
  initial begin
    $monitor("Time=%0t a=%b b=%b mode=%b y=%b",$time,a,b,mode,y);
  end
endmodule
