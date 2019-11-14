module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 

always @(posedge clk)
begin
    if(reset)   
    begin
        hh <= 8'b0001_0010;
        mm <= 8'd0;
        ss <= 8'd0;
    end
    else if(ena)
    begin
        // ss
        if(ss[3:0] == 4'b1001)
        begin
            if(ss[7:4] == 4'b0101)
            begin
                ss <= 8'b0000_0000;

                // mm
                if(mm[3:0] == 4'b1001)
                begin
                    if(mm[7:4] == 4'b0101)
                    begin
                        mm <= 8'b0000_0000;

                        // hh
                        if(hh[3:0] == 4'b1001)
                        begin
                            hh <= {hh[7:4]+4'b0001, 4'd0000};
                        end
                        else if(hh == 8'b0001_0010)
                            hh <= 8'b0000_0001;
                        else
                            hh <= hh + 8'b0000_0001;   // hh complete
                    end
                    else
                    begin
                        mm <= {{mm[7:4]+4'b0001}, 4'b0000};
                    end
                end     
                else
                    mm <= mm +8'b0000_0001;// mm complete
            end
            else
            begin
                 ss <= {{ss[7:4]+4'b0001}, 4'b0000};
            end
        end
        else
        begin
            ss <= ss + 8'b0000_0001;
        end       // ss complete
    end
end

// contral pm or am
always @(posedge clk)
begin
    if(reset)
        pm <= 1'b0;
    else
        if((hh == 8'b0001_0001)&(mm == 8'b0101_1001)&(ss == 8'b0101_1001))
            pm <= ~pm;
end

endmodule

