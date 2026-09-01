module tb_demux_1to2;

reg D, S;
wire Y0, Y1;

demux_1to2 DUT (
    .D(D),
    .S(S),
    .Y0(Y0),
    .Y1(Y1)
);

initial begin
$dumpfile("dump.vcd");
  $dumpvars(1,tb_demux_1to2);
    $monitor("D=%b S=%b | Y0=%b Y1=%b", D, S, Y0, Y1);

    D = 0; S = 0;
    #10 D = 1; S = 0;
    #10 D = 0; S = 1;
    #10 D = 1; S = 1;
    #10 $finish;

end

endmodule
