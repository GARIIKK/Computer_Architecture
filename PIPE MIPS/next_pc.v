module next_pc(
input [29:0] inc_pc,
input 		 i_j,
input			 i_bne,
input			 i_beq,
input 		 i_Z_flag,
input [25:0] i_immidiate,
output reg[29:0] o_jump_adress,
output 	 	 PCSrc
					);

wire [29:0] i_jump_adress;
wire [29:0] immidiate = {{(14){i_immidiate[15]}},i_immidiate[15:0]};
assign i_jump_adress = {inc_pc[29:26],i_immidiate};


always @*begin
	casez(i_j)
		0 : begin
			o_jump_adress = (inc_pc + immidiate);
			end
		1 : begin
			  o_jump_adress = i_jump_adress;
			end
	endcase		
end
 
assign PCSrc = (~i_Z_flag & i_bne)|(i_Z_flag & i_beq)| i_j;

endmodule 