module tb_incrementer;

reg  [3:0] A;
wire [3:0] Y;

incrementer DUT (
    .A(A),
    .Y(Y)
);

initial begin
$dumpfile("dump.vcd");
  $dumpvars(1,tb_incrementer);
    $monitor("A=%b (%d) | Y=%b (%d)", A, A, Y, Y);

    A = 4'b0000;
    #10 A = 4'b0001;
    #10 A = 4'b0010;
    #10 A = 4'b0101;
    #10 A = 4'b1110;
    #10 $finish;

end

endmodule
