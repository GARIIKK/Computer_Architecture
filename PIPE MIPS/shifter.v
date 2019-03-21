module shifter(SA, B, i_OpSift, o_ShiftRes);

input			[4:0]	SA;
input signed			[31:0]	B;
input			[1:0]		i_OpSift;

output		[31:0]	o_ShiftRes;

reg signed	[31:0]	res;
reg			[63:0]	CopyB;

assign	o_ShiftRes = res;

always @* begin
	CopyB <= {B, B} << SA[4:0];
end
		
always @* begin
	case (i_OpSift)
		0:	res = B << SA[4:0];
		1:	res = B >> 	SA[4:0];
		2:	res = B >>> SA[4:0];
		3:	res = CopyB[63:32];
	endcase
end

endmodule