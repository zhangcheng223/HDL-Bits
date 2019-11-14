module top_module (
    input clk,
    input x,
    output reg z
); 
reg q1;
reg q2;
reg q3;

initial
z = 1;

always @(posedge clk)
begin
    q1 = x ^ q1;
    q2 = x & (~q2);
    q3 = x | (~q3);
    z = ~(q1 | q2 | q3);
end

endmodule