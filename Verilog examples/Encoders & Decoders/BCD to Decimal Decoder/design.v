module bcd_to_decimal (
    input  [3:0] bcd,
    output reg [9:0] decimal
);

always @(*) begin
    decimal = 10'b0000000000;

    case (bcd)
        4'b0000: decimal[0] = 1;
        4'b0001: decimal[1] = 1;
        4'b0010: decimal[2] = 1;
        4'b0011: decimal[3] = 1;
        4'b0100: decimal[4] = 1;
        4'b0101: decimal[5] = 1;
        4'b0110: decimal[6] = 1;
        4'b0111: decimal[7] = 1;
        4'b1000: decimal[8] = 1;
        4'b1001: decimal[9] = 1;
    endcase
end

endmodule
