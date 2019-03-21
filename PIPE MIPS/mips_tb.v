`timescale 1ns / 1ps
module testbench;
parameter PERIOD = 20;
reg clock;
reg reset;
//reg [31:0] insruction_memory;
//reg [31:0] alu_result;

MIPS mips_inst(.clk	(clock),
					.reset (reset)
					);
initial begin
clock = 0;
forever#(PERIOD/2) clock = ~clock; 
end
initial begin
#0
	reset = 0;
end
initial begin
#5
	reset = 1;
#8000
$finish;	
end
endmodule