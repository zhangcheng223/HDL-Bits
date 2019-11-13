module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

wire [2:0] cout;

adder1 u_adder1_0(
    .a(x[0]),
    .b(y[0]),
    .cin(1'b0),
    .cout(cout[0]),
    .sum(sum[0])
);

adder1 u_adder1_1(
    .a(x[1]),
    .b(y[1]),
    .cin(cout[0]),
    .cout(cout[1]),
    .sum(sum[1])
);

adder1 u_adder1_2(
    .a(x[2]),
    .b(y[2]),
    .cin(cout[1]),
    .cout(cout[2]),
    .sum(sum[2])
);

adder1 u_adder1_3(
    .a(x[3]),
    .b(y[3]),
    .cin(cout[2]),
    .cout(sum[4]),
    .sum(sum[3])
);

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