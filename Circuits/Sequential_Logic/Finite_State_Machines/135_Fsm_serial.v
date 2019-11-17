module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

parameter Idle = 3'b000;
parameter Start = 3'b001;
parameter Data = 3'b010;
parameter Stop = 3'b011;
parameter Done = 3'b100;

reg [2:0] state;
reg [2:0] next_state;
reg [4:0] i;

// sequential logic reset
always @(posedge clk)
begin
    if(reset)
        state <= Idle;
    else
        state <= next_state;
end

// control i
always @(posedge clk)
begin
    case(state)
        Start:  i <=0;
        Data: i <= i + 5'b001;
        Stop: i <= 0;
        Done: i <= 0;
        default: i <= 0;
    endcase
end

// combinational state transition logic
always @(*)
begin
    case(state)
        Idle :  
            if(in)
                next_state = Start;
            else
                next_state = Idle;
        Start:
            if(!in)
                next_state = Data;
            else
                next_state = Start;
        Data:
            if(i<=5'b0111)
                next_state = Data;
            else
                next_state = Stop;
        Stop:
            if(in)
                next_state = Done;
            else
                next_state = Idle;
        Done:
            if(!in)
                next_state = Data;
            else
                next_state = Idle;
        default: next_state = 2'bx;
    endcase
end

// combinational logic output
assign done = (state == Done)? 1'b1 : 1'b0;

endmodule