module top_module (
    input clk,
    input a,
    input b,
    output q,
    output reg state  );

parameter Idle = 1'b0;
parameter Start = 1'b1;

reg next_state;

// sequential logic reset
always @(posedge clk)
begin
    if((a == 1'b0)&&(b == 1'b0))
        state <= Idle;
    else
        state <= next_state;
end

// combinational logic state transition
always @(*)
begin
    case(state)
        Idle:
            if(a &&b )
                next_state = Start;
            else
                next_state = Idle;
        Start:
            if((~a) && (~b))
                next_state = Idle;
            else
                next_state = Start;
        default: next_state = Idle;
    endcase
end

// combinational logic output
assign q = ((~a)&b&(~state)) | (a & (~b)&(~state)) | ((~a)&(~b)&state) | (a&b&state);

endmodule