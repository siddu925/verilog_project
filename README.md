# Verilog Projects

This repository contains Verilog projects focused on digital circuit design and simulation. Each project includes source code and relevant documentation to facilitate understanding and replication.

## Projects

### 1. RGB Sequence Detector

**Description:**  
Design and implementation of a sequence detector that identifies a specific pattern within a stream of RGB inputs.

**Features:**
- Detects predefined RGB sequences.
- Outputs a signal upon successful detection.

**Files:**
- `rgb_sequence_detector.v`: Main Verilog module for the RGB sequence detector.
- `rgb_sequence_detector_tb.v`: Testbench for simulating and verifying the detector's functionality.
### 2. Vending Machine Controller  

**Description:**  
A Verilog-based **Vending Machine Controller** that accepts multiple coin inputs, dispenses products, and returns change dynamically.  

**Features:**  
- Implements a **Finite State Machine (FSM)** to manage vending transactions.  
- Supports **multiple coin inputs** ($1, $2, and $5).  
- Dispenses products like **Chocolate and Drink**.  
- Returns **change** if extra money is inserted.  
- Includes a **Testbench** for simulation and verification.  

**Files:**  
- `vending_machine.v`: Main Verilog module for the vending machine controller.  
- `vending_machine_tb.v`: Testbench for simulating and verifying functionality.  

### 3. RISC-V ALU

**Description:**  
Implementation of an Arithmetic Logic Unit (ALU) compatible with the RISC-V instruction set architecture.

**Features:**
- Performs arithmetic operations such as addition and subtraction.
- Executes logical operations like AND, OR, and XOR.
- Supports shift operations.

**Files:**
- `riscv_alu.v`: Verilog module defining the RISC-V ALU.
- `riscv_alu_tb.v`: Testbench for simulating and verifying the ALU's operations.


