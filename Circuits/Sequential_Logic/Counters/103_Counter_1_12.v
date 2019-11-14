module top_module (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q,
    output c_enable,
    output reg c_load,
    output [3:0] c_d
); //

wire [3:0] Q_temp;
assign c_enable = enable? 1 : 1'b0;
assign c_d = c_load? 1'b1 : 1'b0;

always @(posedge clk)
begin
    if(reset)
        Q <= 4'b0001;
    else if(enable)
        if(Q != 4'b1100)
            Q <= Q+1;
        else
            Q <= 4'b0001;
end

always @(*)
begin
    if(reset || (enable && Q == 4'b1100))
        c_load = 1'b1;
    else
        c_load = 1'b0;
end

// 用于验证
count4 u_count4 (
        .clk(clk),
        .enable(enable),
        .load(c_load),
        .d(c_d),
        .Q(Q_temp)
);

endmodule