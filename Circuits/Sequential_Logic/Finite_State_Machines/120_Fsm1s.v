// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    reg present_state, next_state;

    parameter A = 1'b0;
    parameter B = 1'b1;

    // sequential logic state transition
    always @(posedge clk)
    begin
        if(reset)
            present_state <= B;
        else
            present_state <= next_state;
    end

    // combinational logic state transiton logic
    always @(*)
    begin
        case(present_state)
            A:
                if(in)
                    next_state = A;
                else
                    next_state = B;
            B:
                if(in)
                    next_state = B;
                else
                    next_state = A;
            default: next_state = 1'bx;
        endcase
    end

    // combinational logic ouput
    always @(*)
    begin
        if(present_state == A)
            out = 0;
        else
            out = 1;
    end

endmodule
