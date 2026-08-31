module tb_ripple_carry_adder_4bit;

reg  [3:0] A, B;
reg        Cin;
wire [3:0] Sum;
wire       Cout;

ripple_carry_adder_4bit DUT (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_ripple_carry_adder_4bit);
    $monitor("A=%b B=%b Cin=%b | Cout=%b Sum=%b",
              A, B, Cin, Cout, Sum);

    A = 4'b0000; B = 4'b0000; Cin = 0;
    #10 A = 4'b0101; B = 4'b0011; Cin = 0;
    #10 A = 4'b1111; B = 4'b0001; Cin = 0;
    #10 A = 4'b1010; B = 4'b0101; Cin = 1;
    #10 $finish;

end

endmodule
