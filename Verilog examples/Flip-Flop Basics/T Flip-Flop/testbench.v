module tb_t_ff;

reg T, clk, reset;
wire Q;

t_ff DUT (
    .T(T),
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin

   $dumpfile("dump.vcd");
  $dumpvars(1,tb_t_ff);
  
    $monitor("Time=%0t | Reset=%b T=%b | Q=%b",
              $time, reset, T, Q);

    clk = 0;
    reset = 1;
    T = 0;

    #10 reset = 0;
    #10 T = 1;
    #20 T = 0;
    #10 T = 1;
    #20 $finish;

end

endmodule
