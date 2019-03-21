module memory_reg(
input i_clk,
input i_reg_writeM,
input i_mem_to_regM,
input i_mem_to_writeM,
input [31:0] i_alu_outM,
input [31:0] i_write_dataM,
input [4:0] i_write_regM,
output reg o_reg_writeM,
output reg o_mem_to_regM,
output reg o_mem_to_writeM,
output reg [31:0] o_alu_outM,
output reg [31:0] o_write_dataM,
output reg [4:0]  o_write_regM
);
always@(posedge i_clk)begin
		o_reg_writeM <= i_reg_writeM;	
end
always@(posedge i_clk)begin
		o_mem_to_regM <= i_mem_to_regM;	
end
always@(posedge i_clk)begin
		o_mem_to_writeM <= i_mem_to_writeM;	
end
always@(posedge i_clk)begin
		o_alu_outM <= i_alu_outM;	
end
always@(posedge i_clk)begin
		o_write_dataM <= i_write_dataM;	
end
always@(posedge i_clk)begin
		o_write_regM <= i_write_regM;	
end
endmodule

