module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q);

always @(posedge clk)
begin
    if(reset)
        q <= 0;
    else if(slowena)
        if(q == 4'b1001)
            q <= 0;
        else
            q <= q+1;
end

endmodule