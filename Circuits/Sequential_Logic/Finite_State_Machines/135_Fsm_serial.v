`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/18 10:17:28
// Design Name: 
// Module Name: Fsm_serial
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

parameter Idle = 2'b00;
parameter Start = 2'b01;
parameter Data = 2'b10;
parameter Done = 2'b11;

reg [1:0] state;
reg [1:0] next_state;
reg [3:0] i;
reg in_last;


// sequential logic reset
always @(posedge clk)
begin
    if(reset)
        state <= Idle;
    else
        state <= next_state;

    // control i
    case(state)
        Idle: i <= 4'b0000;
        Start:  i <= 4'b0000;
        Data: i <= i + 4'b0001;
        Done: i <= 4'b0000;
        default: i <= 4'b0000;
    endcase

    in_last <= in;
end

// combinational state transition logic
always @(*)
begin
    case(state)
        Idle:
            if((in == 1'b0) && (in_last == 1'b1))
                next_state = Start;
            else
                next_state = Idle;
        Start:
            next_state = Data;
        Data:
            if(i<=4'b0110)
                next_state = Data;
            else
                if((in==1'b1)&&(in_last == 1'b0))
                    next_state = Done;
                else
                    next_state = Idle;
        Done:
            if((in == 1'b0) && (in_last == 1'b1))
                next_state = Start;
            else
                next_state = Idle;
        default: next_state = 2'bx;
    endcase
end

// combinational logic output
assign done = (state == Done)? 1'b1 : 1'b0;

endmodule
