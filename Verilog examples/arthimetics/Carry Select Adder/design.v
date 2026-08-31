module carry_select_adder (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

wire [3:0] sum0, sum1;
wire cout0, cout1;

// Calculate assuming Cin = 0
assign {cout0, sum0} = A + B + 1'b0;

// Calculate assuming Cin = 1
assign {cout1, sum1} = A + B + 1'b1;

// Select based on actual Cin
assign Sum  = Cin ? sum1 : sum0;
assign Cout = Cin ? cout1 : cout0;

endmodule
