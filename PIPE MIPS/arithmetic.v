module arithmetic(A, B, i_OpArithmetic, o_res);

input			[31:0]	A;
input			[31:0]	B;
input						i_OpArithmetic;

output		[32:0]	o_res;
//output 					o_sign;

reg			[32:0]	res;
//reg						sign;

assign	o_res = res;
//assign	o_sign = sign;

always @* begin
	res = A + ((B ^ {32{i_OpArithmetic}}) + i_OpArithmetic);
end

//always @ begin
//	if (res == 32'h00000000)begin
//		sign = 1'b1;
//	end else 
//		sign = 1'b0;	
//end
//always @* begin
//	sign = ~|res;
//end

endmodule