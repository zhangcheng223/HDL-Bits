module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output reg out); //

    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;

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
