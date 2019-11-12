module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire and_ab_1;
    wire and_cd_1;
    wire or_2;
    
    assign and_ab_1 = a&b;
    assign and_cd_1 = c & d;
    assign or_2 = and_ab_1 | and_cd_1;
    assign out = or_2;
    assign out_n = ~or_2;

endmodule