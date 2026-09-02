module priority_encoder (
    input  [3:0] D,
    output reg [1:0] Y,
    output reg       valid
);

always @(*) begin

    if (D[3]) begin
        Y = 2'b11;
        valid = 1'b1;
    end
    else if (D[2]) begin
        Y = 2'b10;
        valid = 1'b1;
    end
    else if (D[1]) begin
        Y = 2'b01;
        valid = 1'b1;
    end
    else if (D[0]) begin
        Y = 2'b00;
        valid = 1'b1;
    end
    else begin
        Y = 2'b00;
        valid = 1'b0;
    end

end

endmodule

