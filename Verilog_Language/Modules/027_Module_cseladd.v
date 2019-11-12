module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

wire select_flag;
wire [15:0] sum_high_0;
wire [15:0] sum_high_1;

add16 u_add16_lo(
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(1'b0),
    .sum(sum[15:0]),
    .cout(select_flag)
);

add16 u_add16_hi0(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1'b0),
    .sum(sum_high_0[15:0])
);

add16 u_add16_hi1(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(1'b1),
    .sum(sum_high_1[15:0])
);

assign sum[31:16] = select_flag? sum_high_1 : sum_high_0;

endmodule
