# UART Transmitter using Verilog HDL

## Overview

This project implements a UART (Universal Asynchronous Receiver Transmitter) Transmitter using Verilog HDL. The design converts 8-bit parallel data into a serial data stream using an FSM-based architecture and configurable baud-rate generation. The transmitter follows the standard UART protocol consisting of Start, Data, and Stop bits.

The project was designed, simulated, and verified using Xilinx Vivado and is targeted for implementation on the Basys-3 FPGA development board.

---

## Features

- FSM-based UART Transmitter Design
- Configurable Baud Rate Generation
- 8-bit Data Transmission
- Start and Stop Bit Support
- LSB-First Data Transmission
- Vivado Simulation Verified
- FPGA Ready (Basys-3 Compatible)

---

## Architecture

<p align="center">
  <img src="docs/uart_architecture.png" width="700">
</p>

The system consists of:

### Baud Generator
- Generates baud_tick pulses from the system clock.
- Controls UART transmission timing.

### UART Transmitter FSM
Implements four states:

- IDLE
- START
- DATA
- STOP

The FSM serializes parallel data and transmits it according to the UART protocol.

---

## FSM State Diagram

<p align="center">
  <img src="docs/uart_fsm.png" width="600">
</p>

### State Description

| State | Function |
|---------|---------|
| IDLE | Waits for transmission request |
| START | Sends UART Start Bit (0) |
| DATA | Transmits 8-bit data serially |
| STOP | Sends UART Stop Bit (1) |

---

## Simulation Results

### UART Transmission Waveform

<p align="center">
  <img src="screenshots/uart_tx_waveform.png" width="900">
</p>

### Verification

The transmitted data was:

```text
8'hA5
```

Binary Representation:

```text
10100101
```

UART transmits data LSB first:

```text
1 → 0 → 1 → 0 → 0 → 1 → 0 → 1
```

Observed waveform confirms:

- Correct baud timing
- Proper state transitions
- Successful serial data transmission
- Correct stop-bit generation

---

## Repository Structure

```text
uart-transmitter-verilog/
│
├── rtl/
│   ├── baud_generator.v
│   └── uart_tx.v
│   └── uart_tx_top.v
│
├── tb/
│   └── uart_tx_tb.v
│
├── constraints/
│   └── uart_tx_basys3.xdc
│
├── docs/
│   ├── uart_architecture.png
│   └── uart_fsm.png
│
├── screenshots/
│   └── uart_tx_waveform.png
│
└── README.md
```

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- Basys-3 FPGA Board
- Git & GitHub

---

## Applications

- FPGA-Based Communication Systems
- FPGA and RTL Design Learning
- Embedded Systems
- Serial Data Communication
- Digital System Interfacing
- UART-Based Debugging and Monitoring

---

## Future Enhancements

- UART Receiver Implementation
- Full UART TX/RX Communication System
- Parity Bit Support
- Configurable Data Width
- Configurable Stop Bits
- FPGA Hardware Demonstration
- Integration with Microcontrollers and Sensors

---

## Authors

**Lakshmi Omkareswar Thummagunta**
- UART Architecture Design
- Baud Generator Development
- FSM-Based UART Transmitter Implementation
- RTL Simulation and Verification
- FPGA Integration and Testing

**Sriya Adimulam**
- Project Documentation
- FSM and Architecture Diagram Preparation
- Waveform Analysis
- Repository Organization
- Technical Presentation Support

---