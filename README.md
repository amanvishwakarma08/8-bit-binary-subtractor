## Overview
This repository contains the RTL code and testbench for an 8-bit subtractor written in Verilog. The design calculates the difference between two 8-bit unsigned integers (`A` and `B`) and outputs an 8-bit `DIFF` along with a 1-bit `BORROW` flag to indicate underflow (when `B > A`).

## Files Included
* `subtractor_8bit.v`: The main Verilog module for the 8-bit subtractor.
* `tb_subtractor_8bit.v`: The testbench used to verify the subtractor's functionality across various test cases.

## How It Works
The subtractor uses concatenation to handle the borrow bit elegantly. By prepending a `0` to both `A` and `B`, the subtraction is performed on 9 bits:
```verilog
assign result = {1'b0, A} - {1'b0, B};
```
* The lower 8 bits (`result[7:0]`) represent the **Difference**.
* The 9th bit (`result[8]`) represents the **Borrow**, which goes high (`1`) if the subtrahend (`B`) is larger than the minuend (`A`).

## Simulation
To simulate this design, you can use any standard Verilog simulator such as **Icarus Verilog**, **ModelSim**, or **Vivado**.

### Example using Icarus Verilog:
1. Compile the code:
   ```bash
   iverilog -o subtractor_sim subtractor_8bit.v tb_subtractor_8bit.v
   ```
2. Run the simulation:
   ```bash
   vvp subtractor_sim
   ```

## Test Cases Covered
The testbench validates the following scenarios:
1. `A > B` (Normal subtraction, no borrow)
2. `A < B` (Underflow condition, borrow goes high)
3. `A = B` (Zero result)
4. Extreme cases (e.g., `A = 0, B = 1`)
