module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output reg fr3,
    output reg fr2,
    output reg fr1,
    output reg dfr
); 

// parameter
parameter Below_S1 = 3'b000;
parameter S1_S2_nominal = 3'b001;
parameter S1_S2_supplemental = 3'b010;
parameter S2_S3_nominal = 3'b011;
parameter S2_S3_supplemental = 3'b100;
parameter Above_S3 = 3'b101;

// signal declaration
reg [2:0] present_state;
reg [2:0] next_state;

// sequential logic reset
always @(posedge clk)
begin
    if(reset)
        present_state <= Below_S1;
    else
        present_state <= next_state;
end

// combinational logic state transiton
always @(*)
begin
    case(present_state)
        Below_S1: 
            if(s[1])
                next_state = S1_S2_nominal;
            else
                next_state = Below_S1;
        S1_S2_nominal:
            if(s[2])
                next_state = S2_S3_nominal;
            else
                if(s[1])
                    next_state = S1_S2_nominal;
                else
                    next_state = Below_S1;
        S1_S2_supplemental:
            if(s[2])
            next_state = S2_S3_nominal;
            else
                if(s[1])
                    next_state = S1_S2_supplemental;
                else
                    next_state = Below_S1;
        S2_S3_nominal:
            if(s[3])
                next_state = Above_S3;
            else
                if(s[2])
                    next_state = S2_S3_nominal;
                else
                    next_state = S1_S2_supplemental;
        S2_S3_supplemental:
            if(s[3])
                next_state = Above_S3;
            else
                if(s[2])
                    next_state = S2_S3_supplemental;
                else
                    next_state = S1_S2_supplemental;
        Above_S3:
            if(s[3])
                next_state = Above_S3;
            else
                next_state = S2_S3_supplemental;
        default: next_state = 3'bxxx;
    endcase
end

// Combinational logic output
always @(*)
begin
    case(present_state)
        Below_S1:               {fr3, fr2, fr1, dfr} = 4'b1111;
        S1_S2_nominal:          {fr3, fr2, fr1, dfr} = 4'b0110;
        S1_S2_supplemental:     {fr3, fr2, fr1, dfr} = 4'b0111;
        S2_S3_nominal:          {fr3, fr2, fr1, dfr} = 4'b0010;
        S2_S3_supplemental:     {fr3, fr2, fr1, dfr} = 4'b0011;
        Above_S3:               {fr3, fr2, fr1, dfr} = 4'b0000;
    endcase
end

endmodule