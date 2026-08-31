module tb_half_subtractor;

reg A, B;
wire Diff, Borrow;

half_subtractor DUT (
    .A(A),
    .B(B),
    .Diff(Diff),
    .Borrow(Borrow)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_half_subtractor);
    $monitor("A=%b B=%b | Diff=%b Borrow=%b",
              A, B, Diff, Borrow);

    A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 $finish;

end

endmodule
