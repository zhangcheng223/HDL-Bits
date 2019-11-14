module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

MUXDFF u_MUXDFF(
    // input
    .clk(KEY[0]),
    .E(KEY[1]),
    .L(KEY[2]),
    .w(KEY[3]),
    .R(SW),

    // output
    .Q(LEDR)
);

endmodule

module MUXDFF (
    // input
    input clk,
    input E,
    input L,
    input [3:0] w,
    input [3:0] R,

    // output
    output reg [3:0] Q
);
always @(posedge clk)
begin
    case({E,L})
        2'b00: Q <= Q;
        2'b01,
        2'b11: Q <= R;
        2'b10: Q <= {w, Q[3:1]};
    default: Q <= 4'hx;
    endcase
end

endmodule