module tb_adder_subtractor;

reg  [3:0] A, B;
reg        mode;
wire [3:0] Y;
wire       Cout;

adder_subtractor DUT (
    .A(A),
    .B(B),
    .mode(mode),
    .Y(Y),
    .Cout(Cout)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_adder_subtractor);
    $monitor("A=%d B=%d Mode=%b | Y=%d Cout=%b",
              A, B, mode, Y, Cout);

    // Addition
    A = 4; B = 3; mode = 0;

    #10;

    // Subtraction
    A = 7; B = 2; mode = 1;

    #10;

    // Addition
    A = 9; B = 5; mode = 0;

    #10;

    // Subtraction
    A = 8; B = 3; mode = 1;

    #10 $finish;

end

endmodule
