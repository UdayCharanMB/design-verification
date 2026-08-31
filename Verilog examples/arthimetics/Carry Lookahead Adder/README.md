# 4-Bit Carry Lookahead Adder

##  Project Description

This project implements a **4-bit Carry Lookahead Adder (CLA)** using Verilog HDL.

A Carry Lookahead Adder is a fast adder that calculates carry signals in parallel instead of waiting for the carry to ripple from one bit to the next.

##  Design

The design has:

* Two 4-bit inputs: `A` and `B`
* One carry input: `Cin`
* One 4-bit output: `Sum`
* One carry output: `Cout`

### Block Diagram

```text
       A[3:0] ─────┐
                   │
                   ▼
              ┌───────────┐
       B[3:0] ─►   CLA     ├──► Sum[3:0]
              │   Adder   │
       Cin ──►│           ├──► Cout
              └───────────┘
```

##  Working Principle

The CLA uses two important signals for every bit:

### 1. Generate (G)

A carry is generated when both input bits are `1`.

```text
G[i] = A[i] & B[i]
```

### 2. Propagate (P)

A carry is propagated when exactly one of the input bits is `1`.

```text
P[i] = A[i] ^ B[i]
```

The carry equations are:

```text
C1 = G0 + P0·C0

C2 = G1 + P1·G0 + P1·P0·C0

C3 = G2 + P2·G1 + P2·P1·G0 + P2·P1·P0·C0

C4 = G3 + P3·G2 + P3·P2·G1
     + P3·P2·P1·G0
     + P3·P2·P1·P0·C0
```

Finally:

```text
Sum = P ^ C
Cout = C4
```

##  Files

```text
4-bit-carry-lookahead-adder/
│
├── carry_lookahead_adder.v
└── tb_carry_lookahead_adder.v
```

### `carry_lookahead_adder.v`

Contains the main **4-bit CLA design**.

### `tb_carry_lookahead_adder.v`

Contains the testbench used to verify the design using `$monitor`.

##  Test Cases
The testbench checks different combinations of:

* Addition without carry
* Addition with carry
* Maximum 4-bit value
* Carry input (`Cin = 1`)

Example:

```text
A=0001 B=0010 Cin=0 | Sum=0011 Cout=0
A=0101 B=0011 Cin=0 | Sum=1000 Cout=0
A=1111 B=0001 Cin=0 | Sum=0000 Cout=1
A=1010 B=0101 Cin=1 | Sum=0000 Cout=1
```

##  Key Advantage

### Ripple Carry Adder

```text
Carry → FA0 → FA1 → FA2 → FA3
```

Each stage waits for the previous carry.

### Carry Lookahead Adder

```text
       ┌─ C1
       ├─ C2
       ├─ C3
Cin ───┴─ C4
```

Carry signals are calculated directly using Generate and Propagate signals.

**Result:** CLA provides faster carry calculation than a basic Ripple Carry Adder.

## Tools

* Verilog HDL
* EDA Playground / ModelSim / Questa / Vivado
* `$monitor` for simulation output

##  Learning Outcomes

* Understanding Carry Lookahead Adders
* Generate and Propagate concepts
* Carry equation derivation
* Verilog combinational design
* Writing a basic Verilog testbench
* Simulation and verification using `$monitor`

##  License

This project is created for learning and educational purposes.
