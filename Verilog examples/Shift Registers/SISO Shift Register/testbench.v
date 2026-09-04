module tb_siso;

reg clk, reset, serial_in;
wire serial_out;

siso DUT (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .serial_out(serial_out)
);

always #5 clk = ~clk;

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_siso);
            
    $monitor("Time=%0t | Reset=%b | Serial_In=%b | Serial_Out=%b",
             $time, reset, serial_in, serial_out);

    clk = 0;
    reset = 1;
    serial_in = 0;

    #10 reset = 0;

    #10 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 1;

    #30 $finish;

end

endmodule
