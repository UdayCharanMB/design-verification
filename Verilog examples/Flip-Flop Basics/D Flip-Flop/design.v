module d_ff (
    input D,
    input clk,
    output reg Q
);

always @(posedge clk)
    Q <= D;

endmodule
