module tb;
  reg a,b;
  wire and_out;
  wire or_out;
  wire not_out;
  wire nand_out;
  wire nor_out;
  wire xor_out;
  wire xnor_out;
  all_gates dut(a,b,and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    $monitor("$time=%0b a=%0b b=%0b %0d %0d %0d %0d %0d %0d %0d ", a,b,and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out);
    a=0; b=0;#10;
    a=0;b=1;#10;
    a=1;b=0; #10;
    a=1;b=1;#10;
    $finish;
  end
endmodule
