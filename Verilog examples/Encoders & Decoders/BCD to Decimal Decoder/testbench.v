module tb_bcd_to_decimal;

reg  [3:0] bcd;
wire [9:0] decimal;

bcd_to_decimal DUT (
    .bcd(bcd),
    .decimal(decimal)
);

initial begin

    $monitor("BCD=%b | Decimal=%b", bcd, decimal);

    bcd = 4'b0000;
    #10 bcd = 4'b0001;
    #10 bcd = 4'b0010;
    #10 bcd = 4'b0011;
    #10 bcd = 4'b0100;
    #10 bcd = 4'b0101;
    #10 bcd = 4'b0110;
    #10 bcd = 4'b0111;
    #10 bcd = 4'b1000;
    #10 bcd = 4'b1001;
    #10 $finish;

end

endmodule
