module decoder_3to8 (
    input  [2:0] A,
    output [7:0] Y
);

assign Y = 8'b00000001 << A;

endmodule
//another code
module decoder_3to8 (
    input  A,
    input  B,
    input  C,
    output [7:0] Y
);

assign Y[0] = ~A & ~B & ~C;
assign Y[1] = ~A & ~B &  C;
assign Y[2] = ~A &  B & ~C;
assign Y[3] = ~A &  B &  C;
assign Y[4] =  A & ~B & ~C;
assign Y[5] =  A & ~B &  C;
assign Y[6] =  A &  B & ~C;
assign Y[7] =  A &  B &  C;

endmodule
// another logic
module decoder_3to8 (
    input [2:0] A,
    output reg [7:0] Y
);

always @(*) begin
    case (A)
        3'b000: Y = 8'b00000001;
        3'b001: Y = 8'b00000010;
        3'b010: Y = 8'b00000100;
        3'b011: Y = 8'b00001000;
        3'b100: Y = 8'b00010000;
        3'b101: Y = 8'b00100000;
        3'b110: Y = 8'b01000000;
        3'b111: Y = 8'b10000000;
    endcase
end

endmodule
