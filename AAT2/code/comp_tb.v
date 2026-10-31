module comp_tb;
reg [3:0]a,b;
wire agb,alb,aeb;
comp_n c1(a,b,agb,alb,aeb);
initial begin
a=4'b1101;b=4'b0001;
#10 a=4'b0100;b=4'b1000;
#10 a=4'b0011;b=4'b0011;
#10 $finish;
end
initial begin
$dumpfile("comp.vcd");
$dumpvars;
end
endmodule
