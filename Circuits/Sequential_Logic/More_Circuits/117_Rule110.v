module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 

// right shift is the left of center
// left shift is the right of center
// reg [511:0] left_shift;
// reg [511:0] right_shift;

always @(posedge clk)
begin
    if(load)
        q <= data;
    else
    begin
        // right_shift <= {1'b0, q[511:1]};        // left of center
        // left_shift <= {q[510:0], 1'b0};         // right of center   

        q <= ((~{1'b0, q[511:1]}) & q)|(~q & {q[510:0], 1'b0})|((~{q[510:0], 1'b0}) & q);
    end

end

endmodule
