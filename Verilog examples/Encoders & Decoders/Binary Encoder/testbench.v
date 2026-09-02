module tb_encoder_4to2;

reg  [3:0] D;
wire [1:0] Y;

encoder_4to2 DUT (
    .D(D),
    .Y(Y)
);

initial begin

   $dumpfile("dump.vcd");
  $dumpvars(1,tb_encoder_4to2);
    $monitor("D=%b | Y=%b", D, Y);

    D = 4'b0001;
    #10 D = 4'b0010;
    #10 D = 4'b0100;
    #10 D = 4'b1000;
    #10 $finish;

end

endmodule
