module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

genvar i;

generate
begin
    for(i = 0; i<=2; i = i+1)
    begin: adder_loop
        if(i==0)
            adder1 u_adder1(
                .a(a[0]),
                .b(b[0]),
                .cin(cin),
                .sum(sum[0]),
                .cout(cout[0])
            );
        else
            adder1 u_adder1(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .sum(sum[i]),
                .cout(cout[i])
            );
    end
end
endgenerate

endmodule

// 1-bit full adder
module adder1(
    input a,
    input b,
    input cin,
    output cout,
    output sum
);

assign {cout, sum} = a + b + cin;

endmodule