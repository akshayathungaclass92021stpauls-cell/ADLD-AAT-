module sr_ff(
input s,r,clk,reset,
output reg q
);
always@(posedge clk) begin
if(reset)
q=1'b0;
else
case({s,r})
2'b00:q=q;
2'b01:q=1'b0;
2'b10:q=1'b1;
2'b11:q=1'bx;
default:q=q;
endcase
end
endmodule
