module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] result
);

wire [31:0] c;
wire cout_1;
assign c = sub? ~b : b;
add16 add16_1(
    .a(a[15:0]),
    .b(c[15:0]),
    .cin(sub),
    .sum(result[15:0]),
    .cout(cout_1)
);

add16 add16_2(
    .a(a[31:16]),
    .b(c[31:16]),
    .cin(cout_1),
    .sum(result[31:16])
);

endmodule