module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output reg done); //

parameter BYTE1 = 2'b00;
parameter BYTE2 = 2'b01;
parameter BYTE3 = 2'b10;
parameter DONE = 2'b11;

reg [2:0] state;
reg [2:0] next_state;

reg [7:0] in_before_3;
reg [7:0] in_before_2;
reg [7:0] in_before_1;

// sequential logic store data in reg
always @(posedge clk)
begin
    if(reset)
    begin
        in_before_1 <= 8'd0;
        in_before_2 <= 8'd0;
        in_before_3 <= 8'd0;
    end
    else
    begin
        in_before_1 <= in;
        in_before_2 <= in_before_1;
        in_before_3 <= in_before_2;
    end
end

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
always @(*)
begin
    case(state)
        BYTE1:
        begin
            out_bytes = 24'bx;
            done = 1'b0;
        end
        BYTE2:
        begin
            out_bytes = 24'bx;
            done = 1'b0;
        end
        BYTE3:
        begin
            out_bytes = 24'bx;
            done = 1'b0;
        end
        DONE:
        begin
            out_bytes = {in_before_3, in_before_2, in_before_1};
            done = 1'b1;
        end
        default:
        begin
            out_bytes = 24'bx;
            done = 1'bx;
        end
    endcase
end

endmodule
