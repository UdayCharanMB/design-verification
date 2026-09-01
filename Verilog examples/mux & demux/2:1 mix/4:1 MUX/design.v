module mux_4to1 (
    input  [3:0] I,
    input  [1:0] S,
    output Y
);

assign Y = I[S];

endmodule
