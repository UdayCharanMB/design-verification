module tb_PIPO;

reg clk;
reg [3:0] D;
wire [3:0] Q;

PIPO DUT (
    .clk(clk),
    .D(D),
    .Q(Q)
);

always #5 clk = ~clk;

initial begin

      $dumpfile("dump.vcd");
  $dumpvars(1,tb_PIPO);
  
    $monitor("Time=%0t | CLK=%b | D=%b | Q=%b",
              $time, clk, D, Q);

    clk = 0;

    D = 4'b1010;
    #10;

    D = 4'b1100;
    #10;

    D = 4'b0111;
    #10;

    D = 4'b1001;
    #10;

    $finish;
end

endmodule
