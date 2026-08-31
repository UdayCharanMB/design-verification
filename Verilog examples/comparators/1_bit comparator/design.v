A 1-bit comparator compares two 1-bit inputs (A and B) and produces three outputs:
A_gt_B = 1 if A > B
A_lt_B = 1 if A < B
A_eq_B = 1 if A == B
module comparator_1bit (
    input A,
    input B,
    output A_gt_B,
    output A_lt_B,
    output A_eq_B
);

assign A_gt_B = A & ~B;
assign A_lt_B = ~A & B;
assign A_eq_B = ~(A ^ B);

endmodule
