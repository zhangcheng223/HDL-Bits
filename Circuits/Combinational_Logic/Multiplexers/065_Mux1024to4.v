module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output reg [3:0] out);

integer i;

always @(*)
begin
    out = 4'b0000;
    for(i =0; i <= 255; i = i+1)
    begin
        if(sel == i)
            out = {in[4*i+3], in[4*i+2], in[4*i+1], in[4*i]};
    end
end
endmodule
