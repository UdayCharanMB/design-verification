module PIPO (
    input clk,
    input [3:0] D,
    output reg [3:0] Q
);

always @(posedge clk)
    Q <= D;

endmodule
