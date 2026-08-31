module tb;
  reg a,b;
  wire y;
  and_gate uut(.a(a),.b(b),.c(c));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    $monitor("a=%0d b=%0d y=%0d",a,b,y);
    a=0;b=0;#10;
    a=0;b=1;#10;
    a=1;b=0;#10;
    a=1;b=1;#10;
    $finish;
  end
endmodule
