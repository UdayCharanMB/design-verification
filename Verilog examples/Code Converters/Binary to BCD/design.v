module binary_to_bcd (
    input  [7:0] binary,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] ones
);

integer temp;

always @(*) begin
    temp = binary;

    hundreds = temp / 100;
    temp     = temp % 100;

    tens     = temp / 10;
    ones     = temp % 10;
end

endmodule
