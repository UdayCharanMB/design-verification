module tb_d_ff;

reg clk, reset, D;
wire Q;

d_ff DUT (
    .clk(clk),
    .reset(reset),
    .D(D),
    .Q(Q)
);

// Clock
always #5 clk = ~clk;

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_d_ff);
    $monitor("Time=%0t | Reset=%b D=%b | Q=%b",
             $time, reset, D, Q);

    clk = 0;
    reset = 1;
    D = 0;

    #10 reset = 0; D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 reset = 1;
    #10 reset = 0; D = 0;

    #10 $finish;
end

endmodule
