module tb_full_subtractor;

reg A, B, Bin;
wire Diff, Bout;

full_subtractor DUT (
    .A(A),
    .B(B),
    .Bin(Bin),
    .Diff(Diff),
    .Bout(Bout)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1, tb_full_subtractor);
    $monitor("A=%b B=%b Bin=%b | Diff=%b Bout=%b",
              A, B, Bin, Diff, Bout);

    A=0; B=0; Bin=0;
    #10 A=0; B=0; Bin=1;
    #10 A=0; B=1; Bin=0;
    #10 A=0; B=1; Bin=1;
    #10 A=1; B=0; Bin=0;
    #10 A=1; B=0; Bin=1;
    #10 A=1; B=1; Bin=0;
    #10 A=1; B=1; Bin=1;
    #10 $finish;

end

endmodule
