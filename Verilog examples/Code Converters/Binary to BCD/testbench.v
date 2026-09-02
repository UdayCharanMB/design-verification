module tb_binary_to_bcd;

reg  [7:0] binary;
wire [3:0] hundreds, tens, ones;

binary_to_bcd DUT (
    .binary(binary),
    .hundreds(hundreds),
    .tens(tens),
    .ones(ones)
);

initial begin

    $monitor("Binary = %d | BCD = %d%d%d",
              binary, hundreds, tens, ones);

    binary = 8'd0;
    #10 binary = 8'd9;
    #10 binary = 8'd25;
    #10 binary = 8'd99;
    #10 binary = 8'd125;
    #10 binary = 8'd255;
    #10 $finish;

end

endmodule
