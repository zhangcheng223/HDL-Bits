module top_module( 
    input [254:0] in,
    output reg [7:0] out );

integer count;
always @(*)
begin: count_b
    integer i;
    count = 0;
    for(i = 0; i <= 254; i = i+1)
    begin
        if(in[i])
            count = count + 1;
    end

    out = {count[7:0]};
end

endmodule
