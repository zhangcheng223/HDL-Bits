module top_module (input x, input y, output z);

wire z_A_1;
wire z_A_2;
wire z_B_1;
wire z_B_2;

A ia1(
    .x(x),
    .y(y),
    .z(z_A_1)
);
A ia2(
    .x(x),
    .y(y),
    .z(z_A_2)
);

B ib1(
    .x(x),
    .y(y),
    .z(z_B_1)
);
B ib2(
    .x(x),
    .y(y),
    .z(z_B_2)
);

assign z = (z_A_1 | z_B_1) ^ (z_A_2 & z_B_2);

endmodule

// module A
module A (
    input x, 
    input y, 
    output z);

assign z = (x ^ y) & x;

endmodule

// module B
module B ( input x, input y, output z );

assign z = x ~^ y;

endmodule