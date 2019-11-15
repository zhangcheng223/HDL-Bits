module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output reg out); //  

// parameter
parameter OFF = 1'b0;
parameter ON = 1'b1;

// signal declaration
reg present_state;
reg next_state;

// sequential logic state transition
always @(posedge clk or posedge areset)
begin
    if(areset)
        present_state <= OFF;
    else
        present_state <= next_state;
end

// combinational logic state transition
always @(*)
begin
    case(present_state)
        OFF:
            if(j)
                next_state = ON;
            else
                next_state = OFF;
        ON: 
            if(k)
                next_state = OFF;
            else
                next_state = ON;
        default: next_state = 1'bx;
    endcase
end

// combinational logic output
always @(*)
begin
    if(present_state == OFF)
        out = 0;
    else
        out = 1;
end

endmodule