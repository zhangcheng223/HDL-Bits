// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );

    always @(*)
    begin
        casez(in)
            8'b0000_0000,
            8'b????_???1 : pos = 3'b000;
            8'b????_??10 : pos = 3'b001;
            8'b????_?100 : pos = 3'b010;
            8'b????_1000 : pos = 3'b011;
            8'b???1_0000 : pos = 3'b100;
            8'b??10_0000 : pos = 3'b101;
            8'b?100_0000 : pos = 3'b110;
            8'b1000_0000 : pos = 3'b111;
        default: pos = 3'bxxx;
        endcase
    end
endmodule
