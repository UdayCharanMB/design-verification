module decoder_4to16 (
    input  [3:0] A,
    output [15:0] Y
);

assign Y = 16'b0000_0000_0000_0001 << A;

endmodule
