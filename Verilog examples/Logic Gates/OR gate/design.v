//data flow level modeling
module or_gate(a,b,y);
  input wire a,b;
  output y;
  assign y= a|b;
endmodule
//behavioral level modeling
module or_gate1(a,b,y);
  input a,b;
  output reg y;
  always@(*) begin
    y=a|b;
  end
endmodule
//gatelevel modeling
module or_gate2(a,b,y);
  input a,b;
  output y;
  or g1(y,a,b);
endmodule
