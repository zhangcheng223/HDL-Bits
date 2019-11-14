module top_module (
    input clk,
    input d,
    output q
);

reg q0;
reg q1;

assign q = clk? q0 : q1;

// q: posedge
always @(posedge clk)
begin
    q0 <= d;
end

// p:negedge
always @(negedge clk)
begin
    q1 <= d;
end

endmodule
