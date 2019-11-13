module top_module( 
    input [99:0] in,
    output reg [98:0] out_both,
    output reg [99:1] out_any,
    output reg [99:0] out_different );

integer i;
always @(*)
begin
    for(i = 98; i>=0; i = i -1)
    begin
        out_both[i] = in[i+1] & in [i];

    end
    for(i = 99; i>=1; i = i -1)
    begin
        out_any[i] = in[i]|in[i-1];
    end
    for(i = 99; i>=0; i = i -1)
    begin
    if(i == 99)
        out_different[i] = in[0]^in[i];
    else
        out_different[i] = in[i+1]^in[i];
    end
end

endmodule
