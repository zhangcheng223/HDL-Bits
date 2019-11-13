module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

genvar i;

wire [99:0] cout_temp;

// generate circular instance
generate
begin
    for(i = 0; i <= 99; i = i+1)
    begin: bcd_add_loop
        if(i==0)
            bcd_fadd u_bcd_fadd(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cin),
                .sum(sum[4*i+3:4*i]),
                .cout(cout_temp[i])
            );
        else
            bcd_fadd u_bcd_fadd(
                .a(a[4*i+3:4*i]),
                .b(b[4*i+3:4*i]),
                .cin(cout_temp[i-1]),
                .sum(sum[4*i+3:4*i]),
                .cout(cout_temp[i])
            );
    end
end
endgenerate

assign cout = cout_temp[99];

endmodule