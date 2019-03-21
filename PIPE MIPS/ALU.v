module ALU(A, B, SA, i_ShiftOp, i_ArithmeticOp, i_LogicalOp, i_ALUselection, o_ALUout,z_flag);

input		[31:0]	A;
input		[31:0]	B;
input 	[4:0]		SA;
input		[1:0]		i_ShiftOp;
input					i_ArithmeticOp;
input		[1:0]		i_LogicalOp;
input		[1:0]		i_ALUselection;
output	[31:0]	o_ALUout;
output 					z_flag;

wire		[31:0]	logic_res;
wire		[32:0]	arithmetic_res;
wire		[31:0]	sign_res;
wire		[31:0]	shifter_res;
reg		[31:0]	ALU_res;
reg 					sign;
wire 				   sign_slt;
wire     [31:0]   slt_bus;
assign z_flag = sign;
assign o_ALUout = ALU_res;
assign sign_slt = arithmetic_res[32] ^ arithmetic_res[31];
assign slt_bus = {(32){sign_slt}};

logic logic_inst(.i_logcontrl(i_LogicalOp),
						.A(A),
						.B(B),
						.o_logic(logic_res)
						);
						
arithmetic arithmetic_inst(.A(A),
									.B(B),
									.i_OpArithmetic(i_ArithmeticOp),
									.o_res(arithmetic_res)
									);
						
shifter shifter_inst(.SA(SA),
							.B(B),
							.i_OpSift(i_ShiftOp),
							.o_ShiftRes(shifter_res)
							);

always @* begin
	case (i_ALUselection)
		0: ALU_res = shifter_res;
		1:	ALU_res = slt_bus;
		2:	ALU_res = arithmetic_res[31:0];
		3: ALU_res = logic_res;
	endcase
end
always @* begin
	sign = ~|ALU_res;
end			
			
endmodule