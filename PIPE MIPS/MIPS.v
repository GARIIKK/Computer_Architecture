module MIPS(
input clk,
input reset
);
wire  regDst;
wire  extOp;

wire [29:0] pc_for_jump;
wire PCSrc ;
		
reg  [29:0] input_pc;
wire [31:0] output_pc;
wire [29:0] add_pc;
wire [31:0] o_instr_dataD;
wire [29:0] o_add_pc;

//for execute reg
wire o_reg_writeE;
wire o_mem_to_regE;
wire o_mem_writeE;
wire [3:0] o_alu_controlE;
wire o_alu_srcE;
wire o_reg_dstE;
wire [31:0] o_AE;
wire [31:0] o_BE;
wire [4:0] o_rsE;
wire [4:0] o_rtE;
wire [4:0] o_rdE;
wire [31:0] o_sign_extE;
wire  o_dataB;
wire o_dataA; //for mux for 3 jump instruction

//for memory_reg
reg [4:0] i_write_regM;
wire o_reg_writeM;
wire o_mem_to_regM;
wire o_mem_to_writeM;
wire [31:0] o_alu_outM;
wire [31:0] o_write_dataM;
wire [4:0]  o_write_regM;

//for writeback
wire o_reg_writeW;
wire o_mem_to_regW;
wire [31:0] o_alu_outW;
wire [31:0] o_dm_outW;
wire [4:0]  o_write_regW;

//for hazad unit
wire [1:0] o_forward_AE;
wire [1:0] o_forward_BE;
wire o_flush;
wire o_forward_AD;
wire o_forward_BD;
wire o_stallD;
wire o_stallF;
wire branchD;

//out of mux 
reg [31:0] data_mux_A;
reg [31:0] data_mux_B;

//for comparator
reg [31:0] i_comp_1,i_comp_2,result;
reg zero;
parameter sign  = 1'b1;


//wire [29:0] next_pc_add;
//assign next_pc_add = output_pc[31:2] + 30'h4;
assign add_pc = output_pc[31:2] + 1'b1;

always@*begin
	casez(PCSrc)
	0 : begin
		input_pc = add_pc;
		end
	1 : begin
		input_pc = pc_for_jump;
		end
	default : begin
			input_pc = add_pc;
		end
endcase
end
program_counter PC_inst(.pc_next   (input_pc),
								.pc_result (output_pc),
								.we        (o_stallF),
								.reset     (reset),
								.clk       (clk)
								);
								
wire [31:0] IMD; //instruction memory data

instruction_memory instr_inst(.i_addr (output_pc),
			      .o_data(IMD)
			     );
wire we;
wire [4:0] adress_A,adress_B;
reg  [4:0] write_adress;
wire [31:0] wd;
wire [31:0] data_A,data_B;
reg [31:0] write_bus;

assign adress_A = o_instr_dataD[25:21];
assign adress_B = o_instr_dataD[20:16];

wire [4:0] rsD;
wire [4:0] rtD;
wire [4:0] rdD;

assign rsD = o_instr_dataD[25:21];
assign rtD = o_instr_dataD[20:16];
assign rdD = o_instr_dataD[15:11];

always @* begin
	casez(o_reg_dstE)
		0 : begin
			 i_write_regM = o_rtE;
			end
		1 : begin
			 i_write_regM = o_rdE;
			end
		default : begin
			i_write_regM = o_rtE;
			end
	endcase	
end	
wire  regWrite;
reg_file reg_inst(.clk 		 (clk),
						.we 		 (o_reg_writeW),
						.adress_A (adress_A),
						.adress_B (adress_B),
						.wa		 (o_write_regW),
						.wd 		 (write_bus),
						.data_A	 (data_A),
						.data_B 	 (data_B),
						.rst 		 (reset)
						);
//first operand of comparator						
always @* begin
	casez(o_forward_AD)
		0 : begin
			 i_comp_1 = data_A;
			end
		1 : begin
			 i_comp_1 = o_alu_outM;
			end
	endcase	
end
//second operand of comparator 
always @* begin
	casez(o_forward_BD)
		0 : begin
			 i_comp_2 = data_B;
			end
		1 : begin
			 i_comp_2 = o_alu_outM;
			end
	endcase	
end

always @* begin
	result = i_comp_1 + ((i_comp_2 ^ {32{sign}}) + 1);
end

always @* begin
	zero = ~|result;
end
																
wire [15:0] imm;
//assign imm = IMD[15:0];
wire [31:0] sign_immD;

assign imm = o_instr_dataD[15:0];

						
signext signext_inst(.i_data (imm),
							.i_sign (extOp),
							.o_data (sign_immD)
							);
							
wire [5:0] op_code; 
wire [5:0] funct;
wire [3:0] ALU_op;
assign op_code = o_instr_dataD [31:26];
assign funct =  o_instr_dataD [5:0];				
alu_control control_inst(.op_code   (op_code),
								 .funct 	   (funct),
								 .alu_cntrl (ALU_op)
								);
//wire  regDst;
//wire  regWrite;
wire  jump;
wire  br_beq;
wire  br_bne;
//wire  extOp;
wire  aluSrc;
wire  memWrite;
wire  memToReg; 
control_unit control_unit_inst(.i_opCode   (op_code),
										 .o_regDst 	 (regDst),
										 .o_regWrite (regWrite),
										 .o_jump     (jump),
										 .o_br_beq   (br_beq),
										 .o_br_bne	 (br_bne),
										 .o_extOp	 (extOp),
										 .o_aluSrc	 (aluSrc),
										 .o_memWrite (memWrite),
										 .o_memToReg (memToReg)
										);
//x3 mux for bypass A										
always@* begin
	casez(o_forward_AE)
		0 : begin
			data_mux_A = o_AE;
			end
		1 : begin
			data_mux_A = write_bus;
			end
		2 : begin
			data_mux_A = o_alu_outM;
			end
			
		default : begin
			data_mux_A = o_AE; ///?????
		end
	endcase
end

//x3 mux for bypass B
always@* begin
	casez(o_forward_BE)
		0 : begin
			data_mux_B = o_BE;
			end
		1 : begin
			data_mux_B = write_bus;
			end
		2 : begin
			data_mux_B = o_alu_outM;
			end
			
		default : begin
			data_mux_B = o_BE; ///?????
		end
	endcase
end										
										
//mux for choose b operand										
reg [31:0] b_operand;	
always @* begin
	casez(o_alu_srcE)
		0 : begin
			 b_operand = data_mux_B;
			end
		1 : begin
			 b_operand = o_sign_extE; //000000000000000000000
			end
	endcase	
end

wire [1:0] shift_op;
wire  arithmetic_op;
wire [1:0] logical_op;
wire [1:0] selection_op;
wire [31:0] alu_out;
wire 			z_flag;
wire [4:0] SA;
assign SA = o_sign_extE[15:11];//be careful
assign shift_op = o_alu_controlE [1:0];
assign arithmetic_op = o_alu_controlE [0];
assign logical_op = o_alu_controlE	[1:0];
assign selection_op = o_alu_controlE [3:2];
						
ALU alu_inst(.A 			     (data_mux_A),
				 .B 			     (b_operand),
				 .SA				  (SA),
				 .i_ShiftOp      (shift_op),
				 .i_ArithmeticOp (arithmetic_op),
				 .i_LogicalOp    (logical_op),
				 .i_ALUselection (selection_op),
				 .o_ALUout		  (alu_out),
				 .z_flag			  (z_flag)
				);
wire [31:0] mem_out_data;				
data_memory DM_inst(.data 		(o_write_dataM),
						  .addr 		(o_alu_outM),
						  .we	  		(o_mem_to_writeM),
						  .clk  		(clk),
						  .data_out (mem_out_data)
						 );
wire [25:0] immidiate_pc;
//wire [29:0] pc_for_jump;
assign immidiate_pc = o_instr_dataD[25:0];	
//wire PCSrc;					 
next_pc next_pc_inst(
							.inc_pc 			(o_add_pc),
							.i_j 	  			(jump),
							.i_bne  			(br_bne),
							.i_beq  			(br_beq),
							.i_Z_flag 		(zero),
							.i_immidiate 	(immidiate_pc),
							.o_jump_adress (pc_for_jump),
							.PCSrc			(PCSrc)
							);
reg [31:0] output_instr_mem;
							
/*always@* begin
casez(PCSrc)
	0 : begin
		output_instr_mem = IMD;
		end
	1 : begin
		output_instr_mem = 32'h0;
		end
	default : begin
			output_instr_mem = IMD;
		end	
	endcase
end							
*/
decode_reg decode_inst(
							 .i_clk            (clk),
							 .i_instruct_dataD (IMD),
							 .i_add_pc         (add_pc),
							 .i_we             (o_stallD),
							 .i_clear          (PCSrc),
							 .o_instruct_dataD (o_instr_dataD),
							 .o_add_pc         (o_add_pc)
							 );
reg [31:0] input_to_exect_mux1;							 
always@*begin
	casez(o_dataB)
	0 : begin
		input_to_exect_mux1 = data_B;
		end
	1 : begin
		input_to_exect_mux1 = o_alu_outW;
		end
	//2 :begin 
	//   input_to_exect_mux = write_bus;
	//	end
	default : begin
			input_to_exect_mux1 = data_B;
		end
endcase
end

reg [31:0] input_to_exect_mux2;							 
always@*begin
	casez(o_dataA)
	0 : begin
		input_to_exect_mux2 = data_A;
		end
	1 : begin
		input_to_exect_mux2 = write_bus;
		end
	//2 :begin 
	//   input_to_exect_mux = write_bus;
	//	end
	default : begin
			input_to_exect_mux2 = data_A;
		end
endcase
end


/*
reg i_reg_writeE;
reg i_mem_to_regE;
reg i_mem_writeE;
reg [3:0] i_alu_controlE;
reg i_alu_srcE;
reg i_reg_dstE;
reg [4:0] i_rsE;
reg [4:0] i_rtE;
reg [4:0] i_rdE;

always@* begin
casez(o_flush)
	0 : begin
		i_reg_writeE = regWrite;
		end
	1 : begin
		i_reg_writeE = 1'h0;
		end
	default : begin
			i_reg_writeE = regWrite;
		end	
	endcase
end
always@* begin
casez(o_flush)
	0 : begin
		i_mem_to_regE = memToReg;
		end
	1 : begin
		i_mem_to_regE = 1'h0;
		end
	default : begin
			i_mem_to_regE = memToReg;
		end	
	endcase
end
always@* begin
casez(o_flush)
	0 : begin
		i_mem_writeE = memWrite;
		end
	1 : begin
		i_mem_writeE = 1'h0;
		end
	default : begin
			i_mem_writeE = memWrite;
		end	
	endcase
end
always@* begin
casez(o_flush)
	0 : begin
		i_alu_controlE = ALU_op;
		end
	1 : begin
		i_alu_controlE = 4'h0;
		end
	default : begin
			i_alu_controlE = ALU_op;
		end	
	endcase
end

always@* begin
casez(o_flush)
	0 : begin
		i_alu_srcE = aluSrc;
		end
	1 : begin
		i_alu_srcE = 1'h0;
		end
	default : begin
			i_alu_srcE = aluSrc;
		end	
	endcase
end
always@* begin
casez(o_flush)
	0 : begin
		i_reg_dstE = regDst;
		end
	1 : begin
		i_reg_dstE = 1'h0;
		end
	default : begin
			i_reg_dstE = regDst;
		end	
	endcase
end
always@* begin
casez(o_flush)
	0 : begin
		i_rsE = rsD;
		end
	1 : begin
		i_rsE = 1'h0;
		end
	default : begin
			i_rsE = rsD;
		end	
	endcase
end
always@* begin
casez(o_flush)
	0 : begin
		i_rtE = rtD;
		end
	1 : begin
		i_rtE = 1'h0;
		end
	default : begin
			i_rtE = rtD;
		end	
	endcase
end
always@* begin
casez(o_flush)
	0 : begin
		i_rdE = rdD;
		end
	1 : begin
		i_rdE = 1'h0;
		end
	default : begin
			i_rdE = rdD;
		end	
	endcase
end
*/
execute_reg execute_inst(
								 .i_clk          (clk),
								 .i_clear        (o_flush),
								 .i_reg_writeE   (regWrite),
								 .i_mem_to_regE  (memToReg),
								 .i_mem_writeE   (memWrite),
								 .i_alu_controlE (ALU_op),
								 .i_alu_srcE     (aluSrc),
								 .i_reg_dstE	  (regDst),
								 .i_AE           (input_to_exect_mux2),
								 .i_BE           (input_to_exect_mux1),
								 .i_rsE          (rsD),
								 .i_rtE          (rtD),
								 .i_rdE          (rdD),
								 .i_sign_extE    (sign_immD),
								 .o_reg_writeE   (o_reg_writeE),
								 .o_mem_to_regE  (o_mem_to_regE),
								 .o_mem_writeE   (o_mem_writeE),
								 .o_alu_controlE (o_alu_controlE),
								 .o_alu_srcE     (o_alu_srcE),
								 .o_reg_dstE     (o_reg_dstE),
								 .o_AE           (o_AE),
								 .o_BE           (o_BE),
								 .o_rsE          (o_rsE),
								 .o_rtE          (o_rtE),
								 .o_rdE          (o_rdE),
								 .o_sign_extE    (o_sign_extE)
								);							 

memory_reg memory_inst(
						.i_clk           (clk),
						.i_reg_writeM    (o_reg_writeE),
						.i_mem_to_regM   (o_mem_to_regE),
						.i_mem_to_writeM (o_mem_writeE),
						.i_alu_outM      (alu_out),
						.i_write_dataM   (data_mux_B),
						.i_write_regM    (i_write_regM),
						.o_reg_writeM    (o_reg_writeM),
						.o_mem_to_regM   (o_mem_to_regM),
						.o_mem_to_writeM (o_mem_to_writeM),
						.o_alu_outM      (o_alu_outM),
						.o_write_dataM   (o_write_dataM),
						.o_write_regM    (o_write_regM)
						);
write_back_reg write_inst(
								 .i_clk         (clk),
								 .i_reg_writeW  (o_reg_writeM),
								 .i_mem_to_regW (o_mem_to_regM),
								 .i_alu_outW    (o_alu_outM),
								 .i_dm_outW     (mem_out_data),
								 .i_write_regW  (o_write_regM),
								 .o_reg_writeW  (o_reg_writeW),
								 .o_mem_to_regW (o_mem_to_regW),
								 .o_alu_outW    (o_alu_outW),
								 .o_dm_outW     (o_dm_outW),
								 .o_write_regW  (o_write_regW)
								 );

assign branchD = jump | br_beq | br_bne;
						
hazard_unit harard_inst(
							  .i_reg_writeW  (o_reg_writeW),
							  .i_reg_writeM  (o_reg_writeM),
							  .i_reg_writeE  (o_reg_writeE),
							  .i_mem_to_regM (o_mem_to_regM),
							  .i_mem_to_regE (o_mem_to_regE),
							  .i_branchD     (branchD),
							  .i_write_regW  (o_write_regW),
							  .i_write_regM  (o_write_regM),
							  .i_write_regE  (i_write_regM),
							  .i_rsE         (o_rsE),
							  .i_rtE         (o_rtE),
							  .i_rsD         (rsD),
							  .i_rtD         (rtD),
							  .o_forward_AE  (o_forward_AE),
							  .o_forward_BE  (o_forward_BE),
							  .o_flush       (o_flush),
							  .o_forward_AD  (o_forward_AD),
							  .o_forward_BD  (o_forward_BD),
							  .o_stallD      (o_stallD),
							  .o_stallF      (o_stallF), //in pc
							  .o_dataB		  (o_dataB),
							  .o_dataA       (o_dataA)
							  );								
							
always @*begin
	casez(o_mem_to_regW)
		0 : begin
			 write_bus = o_alu_outW;
			end
		1 : begin 
			 write_bus = o_dm_outW;
			end
 endcase
end

endmodule