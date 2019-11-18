module top_module();

reg clk;
reg in;
reg [2:0] s;
wire out;

parameter PERIOD = 10;


initial
begin
    clk = 1'b0;
    in = 1'b0;
    s = 3'b010;
end

always #(PERIOD/2) clk = ~clk;

initial
begin
    #20 in = 1'b1;
    #10 in = 1'b0;
    #10 in = 1'b1;
    #30 in = 1'b0;
end

initial
begin
    #PERIOD s = 3'd6;
    #PERIOD s = 3'd2;
    #PERIOD s = 3'd7;
    #PERIOD s = 3'd0;
end

q7 u_q7(
    .clk(clk),
    .in(in),
    .s(s),
    .out(out)
);

endmodule
