module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output reg out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(state)
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

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset)
            state <= B;
        else
            state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    always @(*)
    begin
        if(state == A)
            out = 0;
        else
            out = 1;
    end

endmodule