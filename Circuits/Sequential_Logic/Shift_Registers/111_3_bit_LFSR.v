module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

muxdff u_mudff(
    // input
    .clk(KEY[0]),
    .R(SW),
    .L(KEY[1]),

    // output
    .Q(LEDR)
);

endmodule


module muxdff(
    // input
    input clk,
    input [2:0] R,
    input L,

    // output
    output reg [2:0] Q
);

always @(posedge clk)
begin
   if(!L)
        Q <= {Q[1]^Q[2], Q[0], Q[2]};
    else
        Q <= R;
end

endmodule