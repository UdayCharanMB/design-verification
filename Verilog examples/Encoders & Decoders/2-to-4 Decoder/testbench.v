module tb_decoder_2to4;

reg  [1:0] A;
wire [3:0] Y;

decoder_2to4 DUT (
    .A(A),
    .Y(Y)
);

initial begin

$dumpfile("dump.vcd");
  $dumpvars(1,tb_decoder_2to4);
    $monitor("A=%b | Y=%b", A, Y);

    A = 2'b00;
    #10 A = 2'b01;
    #10 A = 2'b10;
    #10 A = 2'b11;
    #10 $finish;

end

endmodule
