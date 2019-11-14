module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);

reg d_1;
reg d_2;
reg d_3;

always @(posedge clk)
begin
    if(!resetn)
    begin
        d_1 <= 1'b0;
        d_2 <= 1'b0;
        d_3 <= 1'b0;
        out <= 1'b0;
    end
    else
    begin
        d_1 <= in;
        d_2 <= d_1;
        d_3 <= d_2;
        out <= d_3;
    end
end

endmodule