# Verilog Projects  

This repository contains Verilog projects focused on digital circuit design and simulation. Each project includes source code and relevant documentation to facilitate understanding and replication.  

## Projects  

# FIFO Memory Design in Verilog

## Description:
Design and implementation of a **First-In-First-Out (FIFO) memory buffer** using **Verilog HDL** for efficient data management and transfer. The FIFO module is capable of handling sequential data storage and retrieval, with overflow and underflow management features.

## Features:
- **64-entry FIFO buffer** with **8-bit data width**.
- Supports **read and write operations** with pointers for sequential data flow.
- Automatic **overflow** and **underflow** handling.
- **Buffer full** and **empty status flags** for real-time monitoring of FIFO status.
- Comprehensive **testbench** to verify FIFO functionality under various conditions.
  - Simultaneous read and write operations.
  - Buffer overflow and underflow handling.
  - Reset functionality to ensure correct system behavior.

## Files:
- `fifo.v`: Main Verilog module for the FIFO buffer design.
- `fifo.v`: Testbench for simulating and verifying FIFO functionality.


## Tools Used:
- **Verilog HDL**: For hardware description and design.
- **Xilinx Vivado**: For simulation, verification, and FPGA-based design.
- **FPGA (Field-Programmable Gate Array)**: Implementation of the FIFO design on FPGA hardware.

## Documentation:
- You can access the project documentation and resources here: [FIFO.pptx](https://github.com/siddu925/verilog_project/blob/main/Project%20Documents/FIFO.pptx)
---
### 2. RGB Sequence Detector  

**Description:**  
Design and implementation of a sequence detector that identifies a specific pattern within a stream of RGB inputs.  

**Features:**  
- Detects predefined RGB sequences.  
- Outputs a signal upon successful detection.  

**Files:**  
- `rgb_sequence_detector.v`: Main Verilog module for the RGB sequence detector.  
- `rgb_sequence_detector_tb.v`: Testbench for simulating and verifying the detector's functionality.  

**Documentation:**  
- You can access the project documentation here:  [RBG_no_overlapping.pptx](https://github.com/siddu925/verilog_project/blob/main/Project%20Documents/RBG_no_overlapping.pptx)  

---
### 3. Vending Machine Controller(improved) 

**Description:**  
A Verilog-based vending machine controller designed for efficient and optimized product dispensing. It supports multiple coin inputs, precise change return, and reduced state complexity for improved efficiency.  

**Features:**  
- **Optimized State Machine:** The number of states has been significantly reduced, enhancing performance and reducing unnecessary transitions.  
- **Increased Power Efficiency:** Improved logic implementation minimizes power consumption, making it more suitable for real-world applications.  
- **Multiple Coin Inputs:** Accepts `$1, $2, and $5` denominations for flexible payment options.  
- **Automatic Change Return:** Ensures precise and efficient change dispensing when excess money is inserted.  
- **Functional Verification:** Includes a comprehensive testbench for simulating and validating the system’s functionality.  

**Files:**  
- `vm_add_coins.v`: Main Verilog module for the vending machine controller.  
- `vm_add_coins_tb.v`: Testbench for simulating and verifying the controller’s performance.  

**Documentation:**  
- You can access the project documentation here: [vending machine (Improved).pptx](https://github.com/siddu925/verilog_project/blob/main/Project%20Documents/vending%20machine%20(Improved).pptx)  

---

### 4. True Dual-Port RAM  

**Description:**  
Design and implementation of a **True Dual-Port RAM** that allows simultaneous read/write operations on two independent ports (Port A and Port B), using Verilog HDL.  

**Features:**  
- 64x8-bit SRAM memory block.  
- Concurrent access for Port A and Port B.  
- Independent control signals for read/write operations.  
- Clock-synchronized data handling.  
- Fully tested using a Verilog testbench.  

**Files:**  
- `dual_port_ram.v`: Verilog module implementing the True Dual-Port RAM.  
- `dual_port_ram_tb.v`: Testbench module for simulating and verifying functionality.

**Documentation:**  
- You can access the project documentation here: [Dual-Port RAM.pptx](https://github.com/siddu925/verilog_project/blob/main/Project%20Documents/dual%20port%20ram.pptx).

---
### 5. Vending Machine Controller  

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

**Documentation:**  
- You can access the project documentation here:   [vending machine.pptx](https://github.com/siddu925/verilog_project/blob/main/Project%20Documents/vending%20machine.pptx)  

---

### 6. RISC-V ALU  

**Description:**  
Implementation of an Arithmetic Logic Unit (ALU) compatible with the RISC-V instruction set architecture.  

**Features:**  
- Performs arithmetic operations such as addition and subtraction.  
- Executes logical operations like AND, OR, and XOR.  
- Supports shift operations.  

**Files:**  
- `riscv_alu.v`: Verilog module defining the RISC-V ALU.  
- `riscv_alu_tb.v`: Testbench for simulating and verifying the ALU's operations.  

**Documentation:**  
- You can access the project documentation here: [RISCV32_ALU.pptx](https://github.com/siddu925/verilog_project/blob/main/Project%20Documents/RISCV32_ALU.pptx)  
