module top_module (
    input [7:0] in,
    output parity); 


    // even partity
    assign parity = ^in;

endmodule
