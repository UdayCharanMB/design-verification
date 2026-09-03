module tb_d_ff_async_reset;

reg D, clk, reset;
wire Q;

d_ff_async_reset DUT (
    .D(D),
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("dump.vcd");
  $dumpvars(1,tb_d_ff_async_reset);
    $monitor("Time=%0t | reset=%b D=%b | Q=%b",
              $time, reset, D, Q);

    clk = 0;
    reset = 1;
    D = 0;

    #7 reset = 0;
    D = 1;

    #10 D = 0;

    #10 D = 1;

    #5 reset = 1;   // Asynchronous reset

    #5 reset = 0;
    D = 0;

    #10 $finish;

end

endmodule
