module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 

reg [255:0] q_next;
reg [3:0] sum;

// using blocking assignment
always @(posedge clk)
begin
   if(load)
        q = data;
    else
    begin
        for(integer i = 0; i <=255; i=i+1)
        begin
            if(i == 0)                          // left top corner element
                sum = q[1] + q[16] + q[17] + q[240] + q[241] + q[15] + q[31] + q[255];
            else if(i == 15)                    // right top corner element
                sum = q[14] + q[30] + q[31] + q[0] + q[16] + q[240] + q[254] + q[255];
            else if(i == 240)                   // left bottom corner element
                sum = q[224] + q[225] + q[241] + q[0] + q[1] + q[15] + q[239] + q[255];
            else if(i == 255)                   // right bottom corner element
                sum = q[238] + q[239] + q[254] + q[240] + q[224] + q[0] + q[14] + q[15];
            else if(i%16 == 0 && (i!=0))        // left border elements
                sum = q[i-16] + q[i+16] + q[i-15] + q[i+17] + q[i+1] + q[i-1] + q[i+15] + q[i+31];
            else if(i%16 == 15 && (i!=15))      // right border elements
                sum = q[i-16] + q[i+16] + q[i-17] + q[i-1] + q[i+15] + q[i-15] + q[i-31] + q[i+1];
            else if(i>0 & i<15)                 // top border elements
                sum = q[i-1] + q[i+1] + q[i+15] + q[i+17] + q[i+16] + q[i+240] + q[i+239] + q[i+241];
            else if(i> 240 && i<255)            // bottom border elements
                sum = q[i-1] + q[i+1] + q[i-16] + q[i-17] + q[i-15] + q[i-240] + q[i-241] + q[i-239];
            else                                // inner elements
                sum = q[i-1] + q[i+1] + q[i-16] + q[i-17] + q[i-15] + q[i+16] + q[i+15] + q[i+17];

            case(sum)
                2: q_next[i] = q[i];
                3: q_next[i] = 1;
                default: q_next[i] = 0;
            endcase
        end
        q = q_next;
    end
end

endmodule