module top_module (
    input clock,
    input a,
    output p,
    output reg q );

// q
initial
begin
    q = 1'b1;
end

always @(negedge clock)
begin
    if(a)
        q <= 1'b1;
    else
        q <= 1'b0;
end

assign p = (clock&a&(~q))|((~clock)&(~a)&q)|((~clock)&a&q)|(clock&a&q);

endmodule