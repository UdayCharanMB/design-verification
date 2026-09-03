module d_ff (
    input D,
    input clk,
    input set,
    input reset,
    output reg Q
);

always @(posedge clk) begin
    if (reset)
        Q <= 1'b0;
    else if (set)
        Q <= 1'b1;
    else
        Q <= D;
end

endmodule
