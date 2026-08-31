module tb_carry_select_adder;

reg  [3:0] A, B;
reg        Cin;
wire [3:0] Sum;
wire       Cout;

carry_select_adder DUT (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_carry_select_adder);
    $monitor("A=%b B=%b Cin=%b | Sum=%b Cout=%b",
              A, B, Cin, Sum, Cout);

    A = 4'b0011; B = 4'b0010; Cin = 0;
    #10 A = 4'b0011; B = 4'b0010; Cin = 1;
    #10 A = 4'b1111; B = 4'b0001; Cin = 0;
    #10 A = 4'b1111; B = 4'b0001; Cin = 1;
    #10 $finish;

end

endmodule
