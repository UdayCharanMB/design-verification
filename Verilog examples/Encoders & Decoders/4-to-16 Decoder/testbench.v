module tb_decoder_4to16;

reg  [3:0] A;
wire [15:0] Y;

decoder_4to16 DUT (
    .A(A),
    .Y(Y)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_decoder_4to16);
    $monitor("A=%b | Y=%b", A, Y);

    A = 4'b0000;
    #10 A = 4'b0001;
    #10 A = 4'b0010;
    #10 A = 4'b0011;
    #10 A = 4'b0100;
    #10 A = 4'b0101;
    #10 A = 4'b0110;
    #10 A = 4'b0111;
    #10 A = 4'b1000;
    #10 A = 4'b1001;
    #10 A = 4'b1010;
    #10 A = 4'b1011;
    #10 A = 4'b1100;
    #10 A = 4'b1101;
    #10 A = 4'b1110;
    #10 A = 4'b1111;

    #10 $finish;

end

endmodule
