module top_module(
    input clk,
    input in,
    input reset,
    output reg out); //

// parameter
parameter A = 2'b00;
parameter B = 2'b01;
parameter C = 2'b10;
parameter D = 2'b11;

// signal declaration
reg [1:0] state;
reg [1:0] next_state;

// state flip-flops with asynchronous reset
always @(posedge clk)
begin
    if(reset)
        state <= A;
    else
        state <= next_state;
end

// State transition logic: next_state = f(state, in)
always @(*)
begin
    case(state)
        A :
            if(in)
                next_state = B;
            else
                next_state = A;
        B:
            if(in)
                next_state = B;
            else
                next_state = C;
        C:
            if(in)
                next_state = D;
            else
                next_state = A;
        D: 
            if(in)
                next_state = B;
            else
                next_state = C;
        default: next_state = 2'bx;
    endcase
end

// Output logic:  out = f(state) for a Moore state machine
always @(*)
begin
    case(state)
        A : out = 1'b0;
        B : out = 1'b0;
        C : out = 1'b0;
        D : out = 1'b1;
        default: out = 1'bx;
    endcase
end

endmodule
