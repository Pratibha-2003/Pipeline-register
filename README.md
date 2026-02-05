# Pipeline-register
# Single-Stage Valid/Ready Pipeline Register

This repository contains a SystemVerilog implementation of a single-stage
pipeline register using the standard valid/ready handshake protocol.

## Description
- Acts as a one-deep FIFO between an input and output interface
- Accepts data when `in_valid` and `in_ready` are asserted
- Holds data until the downstream asserts `out_ready`
- Correctly handles backpressure without data loss or duplication
- Fully synthesizable and suitable for ASIC/FPGA designs

## Interface Signals
**Input Interface**
- in_data  : Input data bus
- in_valid : Indicates valid input data
- in_ready : Indicates readiness to accept input data

**Output Interface**
- out_data  : Output data bus
- out_valid : Indicates valid output data
- out_ready : Indicates downstream readiness

## Reset Behavior
- Active-low reset (`rst_n`)
- Resets the pipeline register to an empty state (`out_valid = 0`)

## Language
- SystemVerilog

## Notes
This design is equivalent to a one-entry FIFO / pipeline register commonly
used in RTL designs with ready/valid handshaking.
