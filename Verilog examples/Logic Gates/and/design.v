//data flow level modeling
module and_gate(a,b,y);
  input wire a,b;
  output y;
  assign y= a&b;
endmodule
//behavioral level modeling
module and_gate1(a,b,y);
  input a,b;
  output reg y;
  always@(*) begin
    y=a&b;
  end
endmodule
//gatelevel modeling
module and_gate2(a,b,y);
  input a,b;
  output y;
  and g1(y,a,b);
endmodule
