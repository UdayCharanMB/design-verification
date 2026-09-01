module tb_demux_1to4;

reg D, S1, S0;
wire Y0, Y1, Y2, Y3;

demux_1to4 DUT (
    .D(D),
    .S1(S1),
    .S0(S0),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3)
);

initial begin
$dumpfile("dump.vcd");
  $dumpvars(1,tb_demux_1to4);
    $monitor("D=%b S1=%b S0=%b | Y0=%b Y1=%b Y2=%b Y3=%b",
              D, S1, S0, Y0, Y1, Y2, Y3);

    D=1; S1=0; S0=0;
    #10 S1=0; S0=1;
    #10 S1=1; S0=0;
    #10 S1=1; S0=1;
    #10 D=0;
    #10 $finish;

end

endmodule
