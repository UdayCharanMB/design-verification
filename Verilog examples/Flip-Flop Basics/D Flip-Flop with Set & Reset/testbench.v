module tb_d_ff;

reg D, clk, set, reset;
wire Q;

d_ff DUT (
    .D(D),
    .clk(clk),
    .set(set),
    .reset(reset),
    .Q(Q)
);

// Clock
always #5 clk = ~clk;

initial begin

  
    $dumpfile("dump.vcd");
  $dumpvars(1,tb_d_ff);
    $monitor("Time=%0t | D=%b Set=%b Reset=%b | Q=%b",
              $time, D, set, reset, Q);

    clk = 0;
    D = 0;
    set = 0;
    reset = 0;

    #10 D = 1;           // Normal operation
    #10 D = 0;

    #10 set = 1;         // Set Q = 1
    #10 set = 0;

    #10 reset = 1;       // Reset Q = 0
    #10 reset = 0;

    #10 D = 1;

    #10 $finish;
end

endmodule
