module top_module (
    input clk,
    input a,
    output [3:0] q );

parameter A = 3'b100;
parameter B = 3'b101;
parameter C = 3'b110;
parameter D = 3'b000;
parameter E = 3'b001;
parameter F = 3'b010;
parameter G = 3'b011;

reg [2:0] state;
reg [2:0] next_state;

// sequential logic
always @(posedge clk)
begin
    if(a)
        state <= A;
    else
        state <= next_state;
end

// combinational logic state transition
always @(*)
begin
    case(state)
        A:  next_state = B;
        B:  next_state = C;
        C:  next_state = D;
        D:  next_state = E;
        E:  next_state = F;
        F:  next_state = G;
        G:  next_state = A;
        default: next_state = 3'bx;
    endcase
end

// combinational logic output
assign q = state;

endmodule