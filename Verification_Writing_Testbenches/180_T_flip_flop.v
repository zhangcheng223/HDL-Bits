module top_module ();
// input
reg clk;
reg reset;
reg t;

// output
wire q;

// parameter 
parameter PERIOD = 10;

initial
begin
    clk = 1'b0;
    reset = 1'b0;
    t = 1'b0;
end

// clk
always #(PERIOD/2) clk = ~clk;

// reset
initial
begin
    #10 reset = 1;
    #10 reset = 0;
end

// toggle
initial
begin
    #10 t = 1;
end

// instance
tff u_tff(
    .clk(clk),
    .reset(reset),
    .t(t),
    .q(q)
);

endmodule
