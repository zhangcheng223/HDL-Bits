`timescale 1ps/1ps

module top_module ( );

reg clk;

parameter PERIOD = 10;

initial
begin
    clk = 1'b0;
end

always #(PERIOD/2) clk = ~clk;

dut u_dut(clk);

endmodule