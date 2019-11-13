module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

wire cout_temp[3:0];
genvar i;

assign cout = cout_temp[3];
generate
begin
    for(i = 0; i<=3; i = i+1)
    begin: bcd_loop
        if(i==0)
            bcd_fadd u_bcd_fadd(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cin),
                .cout(cout_temp[i]),
                .sum(sum[4*i+3:4*i])
            );
        else
            bcd_fadd u_bcd_fadd(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cout_temp[i-1]),
                .cout(cout_temp[i]),
                .sum(sum[4*i+3:4*i])
            );
    end
end

endgenerate
endmodule