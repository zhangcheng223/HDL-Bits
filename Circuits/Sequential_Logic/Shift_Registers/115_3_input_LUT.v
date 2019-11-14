module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output reg Z ); 

reg [7:0] Q_temp;

always @(posedge clk)
begin
    if(enable)
        Q_temp <= {Q_temp[6:0], S};
end

always @(*)
begin
    case({A,B,C})
        3'b000: Z = Q_temp[0];
        3'b001: Z = Q_temp[1];
        3'b010: Z = Q_temp[2];
        3'b011: Z = Q_temp[3];
        3'b100: Z = Q_temp[4];
        3'b101: Z = Q_temp[5];
        3'b110: Z = Q_temp[6];
        3'b111: Z = Q_temp[7];
    default: Z <= 1'bx;
    endcase
end

endmodule