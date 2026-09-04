module tb_sipo;

reg clk;
reg reset;
reg serial_in;
wire [3:0] parallel_out;

sipo DUT (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
);

// Clock
always #5 clk = ~clk;

initial begin

  $dumpfile("dump.vcd");
  $dumpvars(1,tb_sipo);
    $monitor("Time=%0t | Serial_in=%b | Parallel_out=%b",
              $time, serial_in, parallel_out);

    clk = 0;
    reset = 1;
    serial_in = 0;

    #10 reset = 0;

    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;

    #10 $finish;

end

endmodule
