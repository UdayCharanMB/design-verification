module tb_piso;

reg clk, load;
reg [3:0] data_in;
wire serial_out;

piso DUT (
    .clk(clk),
    .load(load),
    .data_in(data_in),
    .serial_out(serial_out)
);

always #5 clk = ~clk;

initial begin
  
    $dumpfile("dump.vcd");
  $dumpvars(1,tb_piso);
    $monitor("Time=%0t | Load=%b | Data=%b | Serial_Out=%b",
              $time, load, data_in, serial_out);

    clk = 0;
    load = 1;
    data_in = 4'b1011;

    #10;
    load = 0;

    #40;
    $finish;
end

endmodule
