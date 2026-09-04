module siso (
    input clk,
    input reset,
    input serial_in,
    output serial_out
);

reg [3:0] shift_reg;

always @(posedge clk) begin
    if (reset)
        shift_reg <= 4'b0000;
    else
        shift_reg <= {shift_reg[2:0], serial_in};
end

assign serial_out = shift_reg[3];

endmodule
