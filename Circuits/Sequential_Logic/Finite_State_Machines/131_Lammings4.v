module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

parameter LEFT = 0;
parameter RIGHT = 1;
parameter DIG_LEFT = 2;
parameter DIG_RIGHT = 3;
parameter GROUND_LEFT = 4;
parameter GROUND_RIGHT = 5;
parameter SPLAT = 6;
reg [2:0] state;
reg [2:0] next_state;

integer i_left = 0;
integer i_right = 0;
always @(*) begin
    // State transition logic
    case(state)
        LEFT: 
            if(ground)
                if(dig)
                    next_state = DIG_LEFT;
                else
                    if(bump_left)
                        next_state = RIGHT;
                    else
                        next_state = LEFT;
            else
                next_state = GROUND_LEFT;
        RIGHT:
            if(ground)
                if(dig)
                    next_state = DIG_RIGHT;
                else
                    if(bump_right)
                        next_state = LEFT;
                    else
                        next_state = RIGHT;
            else
                next_state = GROUND_RIGHT;
        DIG_LEFT:
            if(ground)
                next_state = DIG_LEFT;
            else
                next_state = GROUND_LEFT;
        DIG_RIGHT:
            if(ground)
                next_state = DIG_RIGHT;
            else
                next_state = GROUND_RIGHT;
        GROUND_LEFT:
            if(ground)
                if(i_left < 20)
                    next_state = LEFT;
                else
                    next_state = SPLAT;
            else
               next_state = GROUND_LEFT; 
        GROUND_RIGHT:
            if(ground)
                if(i_right < 20)
                    next_state = RIGHT;
                else
                    next_state = SPLAT;
            else
                next_state = GROUND_RIGHT;    
        SPLAT:
            next_state = SPLAT;
        default: next_state = 1'bx;
    endcase
end

always @(posedge clk, posedge areset) begin
    // State flip-flops with asynchronous reset
    if(areset)
        begin
            state <= LEFT;
            i_left <= 0;
            i_right <= 0;
        end
    else
    begin
        state <= next_state;
        if(state == GROUND_LEFT)
            i_left <= i_left + 1;
        else if(state == GROUND_RIGHT)
            i_right <= i_right + 1;
        else
        begin
            i_left <= 0;
            i_right <= 0;
        end
    end
end

// Output logic
assign walk_left = (state == LEFT)? 1'b1 : 1'b0;
assign walk_right = (state == RIGHT)? 1'b1 : 1'b0;
assign aaah = ((state == GROUND_LEFT) || (state == GROUND_RIGHT))? 1'b1 : 1'b0;
assign digging = ((state == DIG_LEFT) || (state == DIG_RIGHT)) ? 1'b1 : 1'b0;

endmodule