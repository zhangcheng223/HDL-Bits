module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output reg [3:1] ena,
    output reg [15:0] q);

always @(posedge clk)
begin
    if(reset)
        q <= 0;
    else
    begin
        if(q[3:0] == 4'd9)
        begin
            q[3:0] <= 4'b0000;
            if(q[7:4] == 4'd9)
            begin
                q[7:4] <= 4'b0000;
                if(q[11:8] == 4'd9)
                begin
                    q[11:8] <= 4'b0000;
                    if(q[15:12] == 4'd9)
                        q[15:12] <= 4'b0000;
                    else
                        q[15:12] <= q[15:12] + 1;
                end
                else
                     q[11:8] <= q[11:8]+4'b0001;      
            end
            else
                q[7:4] <= q[7:4]+4'b0001;
        end
        else
            q[3:0] <= q[3:0]+4'b0001;
    end
end

// always @(posedge clk)
// begin
//     if(reset)
//         q <= 0;
//     else
//     begin
//         q <= q + 1;
//     end
// end

always @(posedge clk)
begin
    if(reset)
        ena <= 0;
    else
    begin
        if(q[3:0]==4'd8)
        begin
            ena[1] <= 1'b1;
            if(q[7:4]==4'd9)
            begin
                ena[2] <= 1'b1;
                if(q[11:8]==4'd9)
                    ena[3] <= 1'b1;
            end
        end
        else
        ena <= 3'b000;
    end
end

endmodule