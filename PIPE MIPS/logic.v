module logic(i_logcontrl, A, B, o_logic);

input		[1:0]		i_logcontrl;
input 	[31:0] 	A;
input 	[31:0] 	B;

output	[31:0]	o_logic;

reg		[31:0]	AfterAnd;
reg		[31:0]	AfterOr;
reg		[31:0]	AfterXor;
reg		[31:0]	data;

assign o_logic = data;

//LOGIC
always @* begin
	AfterAnd = A & B; 
	AfterOr = A | B; 
	AfterXor = A ^ B; 
end

always @* begin
	case(i_logcontrl)
		0:	data = AfterAnd;
		1:	data = AfterOr;
		2:	data = ~(AfterOr);
		3:	data = AfterXor;
	endcase
end

endmodule