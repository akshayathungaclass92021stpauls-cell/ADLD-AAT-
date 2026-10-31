module comp_n #(
 parameter N=4
)( input [N-1:0]a,b,
output reg agb,alb,aeb
);
always@(*)begin
if(a>b)
begin
agb=1;
aeb=0;
alb=0;
end
else if(a<b)
begin
agb=0;
aeb=0;
alb=1;
end
else
begin
agb=0;
aeb=1;
alb=0;
end
end
endmodule

