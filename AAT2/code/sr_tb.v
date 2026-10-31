module sr_tb;
reg s,r,clk,reset;
wire q;
sr_ff s1(s,r,clk,reset,q);
initial begin
clk=0;reset=1;
#5 reset=1;
#10 s=0;r=1;
#10 s=1;r=0;
#10 s=0;r=0;
#10 s=1;r=1;
#10 $finish;
end
always #5 clk=~clk;
initial begin
$dumpfile("srff.vcd");
$dumpvars;
end
endmodule
