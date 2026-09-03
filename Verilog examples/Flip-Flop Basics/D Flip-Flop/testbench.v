module tb_d_ff;

reg D, clk;
wire Q;

d_ff DUT (
    .D(D),
    .clk(clk),
    .Q(Q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_d_ff);
    $monitor("Time=%0t | clk=%b D=%b | Q=%b",
              $time, clk, D, Q);

    D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 1;
    #10 D = 0;

    #10 $finish;
end

endmodule
