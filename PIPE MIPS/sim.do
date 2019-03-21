###########################
# Simple modelsim do file #
###########################

# Delete old compilation results
if { [file exists "work"] } {
    vdel -all
}

# Create new modelsim working library
vlib work

# Compile all the Verilog sources in current folder into working library
vlog  mips_tb.v next_pc.v alu_control.v instruction_memory.v MIPS.v control_unit.v data_memory.v arithmetic.v logic.v shifter.v program_counter.v reg_file.v signext.v ALU.v execute_reg.v memory_reg.v write_back_reg.v decode_reg.v hazard_unit.v

# Open testbench module for simulation
vsim -novopt work.testbench

# Add all testbench signals to waveform diagram
add wave sim:/testbench/*
# Run simulation
run -all