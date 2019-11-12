module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire cout_1;
wire cout_2;
add16 u_add16_1(
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(1'b0),
    .sum(sum[15:0]),
    .cout(cout_1)
);

add16 u_add16_2(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(cout_1),
    .sum(sum[31:16]),
    .cout(cout_2)
);

endmodule