module execute_reg(
input i_clk,
input i_clear,
input i_reg_writeE,
input i_mem_to_regE,
input i_mem_writeE,
input [3:0] i_alu_controlE,
input i_alu_srcE,
input i_reg_dstE,
input [31:0] i_AE,
input [31:0] i_BE,
input [4:0] i_rsE,
input [4:0] i_rtE,
input [4:0] i_rdE,
input [31:0] i_sign_extE,
output reg o_reg_writeE,
output reg o_mem_to_regE,
output reg o_mem_writeE,
output reg [3:0] o_alu_controlE,
output reg o_alu_srcE,
output reg o_reg_dstE,
output reg [31:0] o_AE,
output reg [31:0] o_BE,
output reg [4:0] o_rsE,
output reg [4:0] o_rtE,
output reg [4:0] o_rdE,
output reg [31:0] o_sign_extE
);

always@(posedge i_clk)begin
	if(i_clear)begin
		o_reg_writeE <= 1'b0;
	end else
	o_reg_writeE <= i_reg_writeE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
		o_mem_to_regE <= 1'b0;
	end else
	o_mem_to_regE <= i_mem_to_regE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
		o_mem_writeE <= 1'b0;
	end else
	o_mem_writeE <= i_mem_writeE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
		o_alu_controlE <= 4'h0;
	end else
	o_alu_controlE <= i_alu_controlE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
		o_alu_srcE <= 1'b0;
	end else
	o_alu_srcE <= i_alu_srcE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
		o_reg_dstE <= 1'b0;
	end else
	o_reg_dstE <= i_reg_dstE;
end

always@(posedge i_clk)begin
	o_AE <= i_AE;
end
always@(posedge i_clk)begin
	o_BE <= i_BE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
		o_rsE <= 5'h0;
	end else
	o_rsE <= i_rsE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
	o_rtE <= 5'h0;
	end else
	o_rtE <= i_rtE;
end
always@(posedge i_clk)begin
	if(i_clear)begin
	o_rdE <= 5'h0;
	end else
	o_rdE <= i_rdE;
end
always@(posedge i_clk)begin
	o_sign_extE <= i_sign_extE;
end

endmodule