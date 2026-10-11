# GCD Calculator Using Verilog HDL

## Project Overview
This project implements a Greatest Common Divisor (GCD) calculator using Verilog HDL. It uses a Finite State Machine (FSM) and the Euclidean algorithm to calculate the GCD of two 8-bit unsigned inputs.

## Objective
To design and simulate a sequential GCD calculator that accepts two input numbers and produces their GCD along with a `done` signal indicating completion.

## Tools Used
- **HDL:** Verilog
- **Simulation Tool:** QuestaSim
- **Design Type:** Sequential circuit using FSM

## Inputs and Outputs

| Signal | Direction | Width | Description |
|---|---|---|---|
| `clk` | Input | 1 bit | Clock signal |
| `rst` | Input | 1 bit | Active-high asynchronous reset |
| `start` | Input | 1 bit | Starts the GCD calculation |
| `A` | Input | 8 bits | First input number |
| `B` | Input | 8 bits | Second input number |
| `gcd` | Output | 8 bits | Calculated GCD |
| `done` | Output | 1 bit | Indicates calculation completion |

## Algorithm
The design uses the Euclidean algorithm:

1. Load inputs `A` and `B` into internal registers `a` and `b`.
2. If `b` is not zero:
   - Assign `a = b`.
   - Assign `b = a % b`, using the previous values of `a` and `b`.
3. Repeat until `b == 0`.
4. When `b == 0`, assign `gcd = a` and assert `done`.

Mathematically:

- If `b == 0`, then `GCD(a,b) = a`.
- Otherwise, `GCD(a,b) = GCD(b, a % b)`.

## FSM States

| State | Description |
|---|---|
| `IDLE` | Waits for `start` and loads input values |
| `CAL` | Performs the Euclidean algorithm |
| `DONE` | Indicates that the GCD result is available |

State transitions:

- `IDLE` → `CAL` when `start = 1`
- `CAL` → `DONE` when `b == 0`
- `DONE` → `IDLE` when `start = 0`

## Example Test Case

| Input A | Input B | Expected GCD |
|---:|---:|---:|
| 18 | 12 | 6 |
| 48 | 18 | 6 |
| 45 | 9 | 9 |
| 25 | 10 | 5 |

For `A = 18` and `B = 12`, the calculation proceeds as follows:

| Iteration | a | b |
|---|---:|---:|
| Initial values | 18 | 12 |
| 1 | 12 | 6 |
| 2 | 6 | 0 |

When `b` becomes zero, `gcd = 6` and `done = 1`.

## How to Run in QuestaSim

1. Create a project in QuestaSim.
2. Add the RTL file (`gcd_fsm.v`) and testbench file (`tb.v`).
3. Compile both files.
4. Start simulation with the testbench as the top-level module.
5. Run the simulation and observe `state`, `a`, `b`, `gcd`, and `done` in the waveform.
6. Verify that the calculated GCD matches the expected result.

## Key Learning Outcomes
- Verilog sequential logic and nonblocking assignments
- FSM design using current state and next state
- Asynchronous reset handling
- Euclidean algorithm implementation in hardware
- RTL simulation and waveform debugging

## Future Enhancements
- Develop a self-checking SystemVerilog testbench.
- Add assertions and functional coverage.
- Test additional input combinations, including zero values.
- Compare modulo-based and subtraction-based GCD implementations.
