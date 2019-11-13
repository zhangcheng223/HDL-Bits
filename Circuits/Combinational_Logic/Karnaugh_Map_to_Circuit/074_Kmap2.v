module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

assign out = ((~a)&(~d))|((~a)&(~b)&(~c))|((~b)&(~c))|((~a)&b&c)|(a&c&d);

endmodule
