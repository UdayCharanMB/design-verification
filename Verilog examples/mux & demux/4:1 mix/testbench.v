module tb_mux_4to1;

reg  [3:0] I;
reg  [1:0] S;
wire Y;

mux_4to1 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

initial begin
 $dumpfile("dump.vcd");
  $dumpvars(1,tb_mux_4to1);
    $monitor("I=%b S=%b | Y=%b", I, S, Y);

    I = 4'b1010;

    S = 2'b00; #10;
    S = 2'b01; #10;
    S = 2'b10; #10;
    S = 2'b11; #10;

    $finish;
end

endmodule
