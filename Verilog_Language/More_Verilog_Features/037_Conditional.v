module top_module (
    input [7:0] a, b, c, d,
    output reg [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    reg [7:0] min_1;
    reg [7:0] min_2;

    always @(*)
    begin
        min_1 = (a < b)? a : b;
        min_2 = (c < d)? c : d;
        min = (min_1 < min_2)? min_1 : min_2;
    end

endmodule