module tb_mux_8to1;

reg  [7:0] I;
reg  [2:0] S;
wire Y;

mux_8to1 DUT (
    .I(I),
    .S(S),
    .Y(Y)
);

initial begin
 $dumpfile("dump.vcd");
  $dumpvars(1,tb_mux_8to1);
    $monitor("I=%b S=%b | Y=%b", I, S, Y);

    I = 8'b10101010;

    S = 3'b000;
    #10 S = 3'b001;
    #10 S = 3'b010;
    #10 S = 3'b011;
    #10 S = 3'b100;
    #10 S = 3'b101;
    #10 S = 3'b110;
    #10 S = 3'b111;

    #10 $finish;

end

endmodule
