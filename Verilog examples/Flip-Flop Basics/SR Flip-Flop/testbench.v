module tb_sr_ff;

reg S, R, clk;
wire Q;

sr_ff DUT (
    .S(S),
    .R(R),
    .clk(clk),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin

   $dumpfile("dump.vcd");
  $dumpvars(1,tb_sr_ff);
  
    $monitor("Time=%0t | S=%b R=%b | Q=%b",
              $time, S, R, Q);

    clk = 0;

    S = 0; R = 0;   // Hold
    #10 S = 1; R = 0; // Set
    #10 S = 0; R = 0; // Hold
    #10 S = 0; R = 1; // Reset
    #10 S = 1; R = 1; // Invalid
    #10 $finish;

end

endmodule
