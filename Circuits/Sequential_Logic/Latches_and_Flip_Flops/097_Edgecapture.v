module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);

reg [31:0] in_last;

always @(posedge clk)
begin
    in_last <= in;
    if(reset)
        out <= 0;
    else
        if(in != in_last)
            out <= in_last & (~in) | out;
end

endmodule