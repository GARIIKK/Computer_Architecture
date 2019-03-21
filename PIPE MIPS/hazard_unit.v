module hazard_unit(
input i_reg_writeW,
input i_reg_writeM,
input i_reg_writeE,
input i_mem_to_regM,
input i_mem_to_regE,
input i_branchD,
input [4:0] i_write_regW,
input [4:0] i_write_regM,
input [4:0] i_write_regE,
input [4:0] i_rsE,
input [4:0] i_rtE,
input [4:0] i_rsD,
input [4:0] i_rtD,
output reg [1:0] o_forward_AE,
output reg [1:0] o_forward_BE,
output  o_flush,
output reg o_forward_AD,
output reg o_forward_BD,
output  o_stallD,
output  o_stallF,
output reg  o_dataB,
output reg o_dataA
);

//reg [5:0] control;
reg lwstall;
reg branchstall;
always@* begin
	if((i_rsE != 5'h0)&(i_rsE == i_write_regM) & i_reg_writeM)begin
		o_forward_AE = 2'b10;
	end
	else if((i_rsE != 5'h0)&(i_rsE == i_write_regW) &i_reg_writeW)begin
		o_forward_AE = 2'b01;
	end
	else o_forward_AE = 2'b00;
	
end
always@* begin
	if((i_rtE != 5'h0)&(i_rtE == i_write_regM) & i_reg_writeM)begin
		o_forward_BE = 2'b10;
	end
	else if((i_rtE != 5'h0)&(i_rtE == i_write_regW) & i_reg_writeW)begin
		o_forward_BE = 2'b01;
	end
	else o_forward_BE = 2'b00;
	
end

always@* begin
	if((i_rtD != 5'h0)&(i_rtD == i_write_regW) & i_reg_writeW)begin
		o_dataB = 1'b1;
	end
//	else if((i_rtD != 5'h0)&(i_rtD == i_write_regE) & i_reg_writeE)begin
	//	o_dataB = 2'b10;
	//	end
	else o_dataB = 1'b0;
	
end
always@* begin
	if((i_rsD != 5'h0)&(i_rsD == i_write_regW) & i_reg_writeW)begin
		o_dataA = 1'b1;
	end
//	else if((i_rtD != 5'h0)&(i_rtD == i_write_regE) & i_reg_writeE)begin
	//	o_dataB = 2'b10;
	//	end
	else o_dataA = 1'b0;
	
end


always@* begin
 o_forward_AD = ((i_rsD != 0)&(i_rsD == i_write_regM) & i_reg_writeM);
end
always@* begin
  o_forward_BD = ((i_rtD != 0)&(i_rtD == i_write_regM) & i_reg_writeM);
end 
always@* begin
	lwstall = (((i_rsD == i_rtE)|(i_rtD == i_rtE))& i_mem_to_regE);
end
 always@* begin
	branchstall = ((i_branchD & i_reg_writeE &((i_write_regE == i_rsD)|(i_write_regE == i_rtD)))|(i_branchD & i_mem_to_regM & ((i_write_regM == i_rsD)|(i_write_regM == i_rtD))));
end

assign o_stallD = lwstall | branchstall;
assign o_stallF = lwstall | branchstall;
assign o_flush = lwstall | branchstall;

/*always @(posedge i_clk)begin
		casez(state)
			0 : if((i_rsE != 0) & (i_rsE == i_write_regM) & i_reg_writeM)begin
				 state <= 1'b1;
				end else state <= state;
			1 : 

end

always@* begin
	control = {i_branchD,i_mem_to_regE,i_reg_writeE,i_reg_writeM,i_reg_writeW};
end

always@(i_branchD,i_mem_to_regE,i_reg_writeE,i_reg_writeM,i_reg_writeW)begin  //  *?

	o_flush = 1'b0;
	o_forward_AD = 1'b0;
	o_forward_BD = 1'b0;
	o_stallD = 1'b0;
	o_stallF = 1'b0;
	o_forward_AE = 2'h0;
	o_forward_BE = 2'h0;
	
	casez(control)
	

	endcase
end
*/
endmodule