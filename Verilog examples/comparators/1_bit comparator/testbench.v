module tb_comparator_1bit;

reg A, B;
wire A_gt_B, A_lt_B, A_eq_B;

// DUT
comparator_1bit DUT (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_lt_B(A_lt_B),
    .A_eq_B(A_eq_B)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_comparator_1bit);
    $monitor("A=%b B=%b | A>B=%b A<B=%b A=B=%b",
              A, B, A_gt_B, A_lt_B, A_eq_B);

    A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 $finish;

end

endmodule
