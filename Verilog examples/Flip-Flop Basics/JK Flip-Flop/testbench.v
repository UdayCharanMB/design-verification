module tb_jk_ff;

reg J, K, clk, reset;
wire Q;

jk_ff DUT (
    .J(J),
    .K(K),
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

// Clock
always #5 clk = ~clk;

initial begin

  $dumpfile("dump.vcd");
  $dumpvars(1,tb_jk_ff);
    $monitor("Time=%0t | Reset=%b J=%b K=%b | Q=%b",
              $time, reset, J, K, Q);

    clk = 0;
    reset = 1;
    J = 0;
    K = 0;

    #10 reset = 0;

    #10 J = 0; K = 0;   // Hold
    #10 J = 0; K = 1;   // Reset
    #10 J = 1; K = 0;   // Set
    #10 J = 1; K = 1;   // Toggle
    #10 J = 1; K = 1;   // Toggle

    #10 $finish;
end

endmodule
