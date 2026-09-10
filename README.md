# 8-Bit Subtractor in Verilog

## Overview
This project implements an 8-bit subtractor module and its verification testbench in Verilog HDL. The design performs subtraction between two unsigned 8-bit inputs (`A` and `B`), producing an 8-bit difference (`DIFF`) and a 1-bit borrow flag (`BORROW`).

---

## How It Works
The subtractor uses zero-extension via concatenation to handle subtraction and underflow in a single operation:

```verilog
assign result = {1'b0, A} - {1'b0, B};
assign DIFF   = result[7:0];
assign BORROW = result[8];
```

* **Inputs**:
  * `A [7:0]`: Minuend (8-bit unsigned integer)
  * `B [7:0]`: Subtrahend (8-bit unsigned integer)
* **Outputs**:
  * `DIFF [7:0]`: The lower 8 bits of the result representing the difference.
  * `BORROW`: The 9th bit (`result[8]`), which turns `1` when `A < B` (underflow), signaling that a borrow occurred.

---

## Simulation Waveform
The simulation verifies normal operations, zero results, and underflow conditions across multiple test vectors.

![Simulation Waveform](images/Simulation_Waveform.jpeg)

---

## RTL Schematic
Synthesized logic diagram showing the hardware implementation generated from the Verilog module.

![RTL Schematic](images/RTL_Schematic.jpeg)

---

## Project Structure
```text
├── images/
│   ├── rtl_schematic.png
│   └── simulation_waveform.png
├── subtractor_8bit.v        # Subtractor RTL module
├── tb_subtractor_8bit.v     # Testbench file
└── README.md
```

---

## How to Run Simulation

You can simulate this design using **Icarus Verilog** and **GTKWave**:

1. **Compile**:
   ```bash
   iverilog -o subtractor_sim subtractor_8bit.v tb_subtractor_8bit.v
   ```

2. **Run**:
   ```bash
   vvp subtractor_sim
   ```

3. **View Waveform** (if using a VCD dump file):
   ```bash
   gtkwave subtractor_wave.vcd
   ```

---

## Test Cases Covered
* **`A > B`**: Normal subtraction with no borrow (`BORROW = 0`).
* **`A < B`**: Underflow condition where borrow goes high (`BORROW = 1`).
* **`A = B`**: Difference is zero with no borrow.
* **Boundary values**: Edge tests such as `A = 0, B = 1`.
