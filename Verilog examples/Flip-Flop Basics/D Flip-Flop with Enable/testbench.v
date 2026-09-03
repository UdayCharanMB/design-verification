module tb_dff_enable;

reg D, EN, CLK;
wire Q;

dff_enable DUT (
    .D(D),
    .EN(EN),
    .CLK(CLK),
    .Q(Q)
);

initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

initial begin
  
  $dumpfile("dump.vcd");
  $dumpvars(1,tb_dff_enable);
    $monitor("Time=%0t | CLK=%b EN=%b D=%b | Q=%b",
              $time, CLK, EN, D, Q);

    EN = 1; D = 0;
    #10 D = 1;
    #10 EN = 0; D = 0;
    #10 D = 1;
    #10 EN = 1; D = 0;
    #10 $finish;
end

endmodule
