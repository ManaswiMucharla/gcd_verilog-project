# GCD Calculator Using Verilog

## Overview
This project calculates the Greatest Common Divisor (GCD) of two integer inputs using the Euclidean algorithm.

## Algorithm
- If `b == 0`, return `a`.
- Otherwise, calculate `gcd(b, a % b)`.

## Tools
- Verilog HDL
- QuestaSim

## Test Cases

| Input A | Input B | Expected GCD |
|---:|---:|---:|
| 18 | 12 | 6 |
| 45 | 9 | 9 |
| 405 | 121 | 1 |

## How to Run
Compile the Verilog source and testbench in QuestaSim, run the simulation, and compare the displayed results with the expected GCD values.

## Future Improvements
- Add more test cases, including zero inputs.
- Develop a clocked FSM-based GCD design.
- Add self-checking testbench assertions.
