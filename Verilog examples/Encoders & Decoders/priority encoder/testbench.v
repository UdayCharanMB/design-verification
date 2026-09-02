module tb_priority_encoder;

reg  [3:0] D;
wire [1:0] Y;
wire       valid;

priority_encoder DUT (
    .D(D),
    .Y(Y),
    .valid(valid)
);

initial begin
 $dumpfile("dump.vcd");
  $dumpvars(1,tb_priority_encoder);
    $monitor("D=%b | Y=%b | Valid=%b", D, Y, valid);

    D = 4'b0000;
    #10 D = 4'b0001;
    #10 D = 4'b0010;
    #10 D = 4'b0100;
    #10 D = 4'b1000;
    #10 D = 4'b1010;  // D3 has priority
    #10 D = 4'b0111;  // D2 has priority
    #10 $finish;

end

endmodule
