module tb_decoder_3to8;

reg A, B, C;
wire [7:0] Y;

decoder_3to8 DUT (
    .A(A),
    .B(B),
    .C(C),
    .Y(Y)
);

initial begin

    $monitor("A=%b B=%b C=%b | Y=%b", A, B, C, Y);

    A=0; B=0; C=0;
    #10 A=0; B=0; C=1;
    #10 A=0; B=1; C=0;
    #10 A=0; B=1; C=1;
    #10 A=1; B=0; C=0;
    #10 A=1; B=0; C=1;
    #10 A=1; B=1; C=0;
    #10 A=1; B=1; C=1;

    #10 $finish;

end

endmodule
//another logic

module tb_decoder_3to8;

reg [2:0] A;
wire [7:0] Y;

decoder_3to8 DUT (
    .A(A),
    .Y(Y)
);

initial begin

    $monitor("A=%b | Y=%b", A, Y);

    for (A = 0; A < 8; A = A + 1)
        #10;

    $finish;

end

endmodule
