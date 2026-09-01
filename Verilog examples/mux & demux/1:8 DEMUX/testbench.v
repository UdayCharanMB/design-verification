module tb_demux_1to8;

reg D;
reg [2:0] S;
wire [7:0] Y;

demux_1to8 DUT (
    .D(D),
    .S(S),
    .Y(Y)
);

initial begin
$dumpfile("dump.vcd");
  $dumpvars(1,tb_demux_1to8);
    $monitor("D=%b S=%b | Y=%b", D, S, Y);

    D = 1;
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
