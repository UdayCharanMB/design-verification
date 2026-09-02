module tb_binary_to_gray;

reg  [3:0] binary;
wire [3:0] gray;

binary_to_gray DUT (
    .binary(binary),
    .gray(gray)
);

initial begin

    $monitor("Binary = %b | Gray = %b", binary, gray);

    binary = 4'b0000;
    #10 binary = 4'b0001;
    #10 binary = 4'b0010;
    #10 binary = 4'b0011;
    #10 binary = 4'b0100;
    #10 binary = 4'b0101;
    #10 binary = 4'b0110;
    #10 binary = 4'b0111;
    #10 binary = 4'b1000;
    #10 $finish;

end

endmodule
