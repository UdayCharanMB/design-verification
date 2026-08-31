# 4-Bit Carry Select Adder

##  Project Description

This project implements a **4-bit Carry Select Adder (CSA)** using Verilog HDL.

A Carry Select Adder improves addition speed by calculating the addition for both possible carry inputs (`Cin = 0` and `Cin = 1`) in parallel. The correct result is then selected using the actual carry input.

##  How It Works

For the same inputs `A` and `B`, the design calculates two possible results:

* **Case 1:** `Cin = 0`
* **Case 2:** `Cin = 1`

The actual `Cin` is then used to select the correct `Sum` and `Cout`.

```text
             A, B
              │
       ┌──────┴──────┐
       │             │
    Cin = 0       Cin = 1
       │             │
    Sum0,Cout0    Sum1,Cout1
       │             │
       └──────┬──────┘
              │
          MUX Selection
           based on Cin
              │
          Sum, Cout
```

## Design Code

```verilog
module carry_select_adder (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

wire [3:0] sum0, sum1;
wire cout0, cout1;

// Addition assuming Cin = 0
assign {cout0, sum0} = A + B + 1'b0;

// Addition assuming Cin = 1
assign {cout1, sum1} = A + B + 1'b1;

// Select the correct result
assign Sum  = Cin ? sum1 : sum0;
assign Cout = Cin ? cout1 : cout0;

endmodule
```

##  Code Explanation

### 1. Input and Output

```verilog
input [3:0] A, B;
input Cin;
output [3:0] Sum;
output Cout;
```

* `A` → 4-bit first number
* `B` → 4-bit second number
* `Cin` → Carry input
* `Sum` → 4-bit addition result
* `Cout` → Carry output

### 2. Two Possible Carry Cases

```verilog
wire [3:0] sum0, sum1;
wire cout0, cout1;
```

Two separate results are stored:

* `sum0`, `cout0` → result when `Cin = 0`
* `sum1`, `cout1` → result when `Cin = 1`

### 3. Calculate for `Cin = 0`

```verilog
assign {cout0, sum0} = A + B + 1'b0;
```

The adder calculates the result assuming the incoming carry is `0`.

### 4. Calculate for `Cin = 1`

```verilog
assign {cout1, sum1} = A + B + 1'b1;
```

At the same time, another result is calculated assuming the incoming carry is `1`.

### 5. Select the Correct Result

```verilog
assign Sum = Cin ? sum1 : sum0;
assign Cout = Cin ? cout1 : cout0;
```

This is a **2:1 MUX operation**.

If:

```text
Cin = 0 → Select sum0, cout0
Cin = 1 → Select sum1, cout1
```

## Testbench

```verilog
module tb_carry_select_adder;

reg [3:0] A, B;
reg Cin;

wire [3:0] Sum;
wire Cout;

carry_select_adder DUT (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin

    $monitor("A=%b B=%b Cin=%b | Sum=%b Cout=%b",
              A, B, Cin, Sum, Cout);

    A = 4'b0011; B = 4'b0010; Cin = 0;
    #10 A = 4'b0011; B = 4'b0010; Cin = 1;
    #10 A = 4'b1111; B = 4'b0001; Cin = 0;
    #10 A = 4'b1111; B = 4'b0001; Cin = 1;
    #10 $finish;

end

endmodule
```

## 📊 Expected Output

```text
A=0011 B=0010 Cin=0 | Sum=0101 Cout=0
A=0011 B=0010 Cin=1 | Sum=0110 Cout=0
A=1111 B=0001 Cin=0 | Sum=0000 Cout=1
A=1111 B=0001 Cin=1 | Sum=0001 Cout=1
```

##  Key Concept

The main idea of a Carry Select Adder is:

> **Calculate both possible carry cases in parallel and select the required result using the actual carry input.**

This can reduce carry propagation delay compared with a simple ripple-carry approach, at the cost of additional hardware.

##  Tools

* Verilog HDL
* EDA Playground / Vivado / ModelSim
* Digital Logic Design

##  Files

```text
├── carry_select_adder.v
├── tb_carry_select_adder.v
└── README.md
```

##  Author

**Uday Charan**
