module tb_half_adder;

reg A, B;
wire Sum, Carry;

half_adder DUT (
    .A(A),
    .B(B),
    .Sum(Sum),
    .Carry(Carry)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_half_adder);
    $monitor("A=%b B=%b | Sum=%b Carry=%b",
              A, B, Sum, Carry);

    A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 $finish;

end

endmodule
