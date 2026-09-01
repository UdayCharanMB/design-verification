module adder_subtractor (
    input  [3:0] A,
    input  [3:0] B,
    input        mode,      // 0 = Addition, 1 = Subtraction
    output [3:0] Y,
    output       Cout
);

assign {Cout, Y} = mode ? (A - B) : (A + B);

endmodule
