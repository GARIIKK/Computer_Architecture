module decode_reg(
input i_clk,
input [31:0] i_instruct_dataD,
input [29:0] i_add_pc,
input i_we,
input i_clear,
output reg [31:0] o_instruct_dataD,
output reg [29:0] o_add_pc
);
//reg [31:0]tmp;
always@(posedge i_clk)begin
	if(i_we)begin
	   o_instruct_dataD <= o_instruct_dataD;
	end else if(i_clear)
		o_instruct_dataD <= 32'h0;
	 else 
	   o_instruct_dataD <= i_instruct_dataD; 
end
 always@(posedge i_clk)begin
	if(i_we)begin
		o_add_pc <= o_add_pc;
	end else
		o_add_pc <= i_add_pc; 
 end
 
 endmodule
 