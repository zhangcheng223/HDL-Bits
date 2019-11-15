module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

// parameter
parameter below_S1 = 3'b000;
parameter S1_S2_nominal = 3'b001;
parameter S1_S2_supplemental = 3'b010;
parameter S2_S3_nominal = 3'b011;
parameter S2_S3_supplemental = 3'b100;
parameter above_S3 = 3'b101;

// signal declaration
reg [2:0] present_state;
reg [2:0] next_state;

// sequential logic reset
always @(posedge clk)
begin
    if(reset)
        present_state <= below_S1;
    else
        present_state <= next_state;
end

// combinational logic state transiton
always @(*)
begin
    
end


endmodule