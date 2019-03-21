module write_back_reg(
input i_clk,
input i_reg_writeW,
input i_mem_to_regW,
input [31:0] i_alu_outW,
input [31:0] i_dm_outW,
input [4:0]  i_write_regW,
output reg o_reg_writeW,
output reg o_mem_to_regW,
output reg [31:0] o_alu_outW,
output reg [31:0] o_dm_outW,
output reg [4:0]  o_write_regW
);
always@(posedge i_clk)begin
	o_reg_writeW <= i_reg_writeW;
end

always@(posedge i_clk)begin
	o_mem_to_regW <= i_mem_to_regW;
end
always@(posedge i_clk)begin
	o_alu_outW <= i_alu_outW;
end

always@(posedge i_clk)begin
	o_dm_outW <= i_dm_outW;
end
always@(posedge i_clk)begin
	o_write_regW <= i_write_regW;
end

endmodule
