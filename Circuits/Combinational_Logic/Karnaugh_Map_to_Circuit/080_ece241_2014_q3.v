module top_module (
    input c,
    input d,
    output reg [3:0] mux_in
);

always @(*)
begin
    case({c,d})
        2'b00: mux_in = 4'b0100;
        2'b01: mux_in = 4'b0001;
        2'b10: mux_in = 4'b0101;
        2'b11: mux_in = 4'b1001;
    default: mux_in = 4'bx;
    endcase
end


// assign mux_in[0] = c + d;
// assign mux_in[1] = 1'b0;
// assign mux_in[2] = c&d;
// assign mux_in[3] = ~d;

endmodule
