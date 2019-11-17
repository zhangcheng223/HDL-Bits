module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

parameter BYTE1 = 2'b00;
parameter BYTE2 = 2'b01;
parameter BYTE3 = 2'b10;
parameter DONE = 2'b11;

reg [2:0] state;
reg [2:0] next_state;

// sequential state transition logic 
always @(posedge clk)
begin
    if(reset)
        state <= BYTE1;
    else
        state <= next_state;
end

// combinational logic 
always @(*)
begin
    case(state)
        BYTE1: 
            if(in[3])
                next_state  = BYTE2;
            else
                next_state = BYTE1;
        BYTE2:
            next_state = BYTE3;
        BYTE3:
            next_state = DONE;
        DONE:
            if(in[3])
                next_state = BYTE2;
            else
                next_state = BYTE1;
        default: next_state = 2'bx; 
    endcase
end

// combinational logic output
assign done = (state == DONE)? 1'b1 : 1'b0;

endmodule
