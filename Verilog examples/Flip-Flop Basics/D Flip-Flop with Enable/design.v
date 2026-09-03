//Logic:
//EN = 1 → Q follows D at the rising edge of CLK
//EN = 0 → Q holds its previous value

module dff_enable (
    input D,
    input EN,
    input CLK,
    output reg Q
);

always @(posedge CLK) begin
    if (EN)
        Q <= D;
end

endmodule
