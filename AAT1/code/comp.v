// Code your design here
module comparator #(
  parameter N=4)(
  input [N-1:0]a,b,
  output reg alb,agb,aeb);
  always@(*)begin
    if(a>b)begin
      agb=1;
      alb=0;
      aeb=0;
    end
    else if(a<b)begin
      alb=1;
      agb=0;
      aeb=0;
    end
    else
      begin
        aeb=1;
        agb=0;
        alb=0;
      end
  end
endmodule

// Code your testbench here
// or browse Examples
module tb;
  reg [3:0]a,b;
  wire alb,agb,aeb;
  comparator c1(a,b,alb,agb,aeb);
  initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0,tb);
    a=4'b1000;b=4'b0100;
    #5 a=4'b0001;b=4'b0100;
    #5 a=4'b1000;b=4'b1000;
    #5 $finish;
  end
  initial begin
    $monitor("Time=%0t a=%b b=%b alb=%b agb=%b aeb=%b",$time,a,b,alb,agb,aeb);
  end
endmodule
