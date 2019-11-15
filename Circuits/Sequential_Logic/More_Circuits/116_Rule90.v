module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q );

reg [511:0] q_left;
reg [511:0] q_right;

always @(posedge clk)
begin
    if(load)
        q = data;
    else
    begin
       q <={q[510:0], 1'b0} ^ {1'b0, q[511:1]};
    end
end

endmodule