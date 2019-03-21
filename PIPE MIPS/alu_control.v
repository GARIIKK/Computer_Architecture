module alu_control (
input [5:0] op_code,
input [5:0] funct,
output reg [3:0] alu_cntrl);
/*
parameter OP_RTYPE = 6'b000000;
parameter OP_ADDI = 6'b001000;
parameter OP_ADDIU = 6'b001001;
parameter OP_SLTI = 6'b001010;
parameter OP_ANDI = 6'b001100;
parameter OP_ORI = 6'b001101;
parameter OP_XORI = 6'b001110;
parameter OP_J = 6'b000010;
parameter OP_BEQ = 6'b000100;
parameter OP_BNE = 6'b000101;
parameter OP_LW = 6'b100011;
parameter OP_SW = 6'b101011;

parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter AND = 6'b100100;
parameter OR = 6'b100101;
parameter XOR = 6'b100110;
parameter SLT = 6'b101010;
parameter SLL = 6'b000000;
parameter SRL = 6'b000010;
parameter SRA = 6'b000011;
parameter NOR = 6'b100111;
*/
//reg [3:0] functout;
reg [11:0] control;

always@* begin
control = {op_code,funct};
end

always @(op_code,funct)begin
	casez(control)
	12'b000000_000000 : begin
								alu_cntrl = 4'b0000;
								end
	12'b000000_100000 :begin
								alu_cntrl = 4'b1000;
								end
	12'b000000_100010 : begin
								alu_cntrl = 4'b1001;
								end
	12'b000000_100100 : begin
								alu_cntrl = 4'b1100;
								end
	12'b000000_100101 : begin
								alu_cntrl = 4'b1101;
								end
	12'b000000_100110 : begin
								alu_cntrl = 4'b1111;
								end
	12'b000000_101010 : begin
								alu_cntrl = 4'b0101;
								end
	12'b000000_000010 : begin
								alu_cntrl = 4'b0010;
								end
	12'b000000_000011 : begin
								alu_cntrl = 4'b0001;
								end
	12'b001000_?????? : begin
								alu_cntrl = 4'b1000;
								end
	12'b001010_?????? : begin
								alu_cntrl = 4'b0101;
								end
	12'b001100_?????? : begin
								alu_cntrl = 4'b1100;
								end
	12'b001101_?????? : begin
								alu_cntrl = 4'b1101;
								end
	12'b001110_?????? : begin
								alu_cntrl = 4'b1111;
								end
	12'b100011_?????? : begin
								alu_cntrl = 4'b1000;
								end
	12'b101011_?????? : begin
								alu_cntrl = 4'b1000;
								end
	12'b000100_?????? : begin
								alu_cntrl = 4'b1001;
								end
	12'b000101_?????? : begin
								alu_cntrl = 4'b1001;
								end
	12'b000010_?????? : begin
								alu_cntrl = 4'bxxxx;
								end							
				 default : alu_cntrl = 4'bxxxx;	//?	 
		endcase							
end
/*
always @(funct) begin
	casez(funct)	
						SLL : begin
								functout = 4'b0000;
						end
						ADD : begin
								functout = 4'b1000;
						end
						SUB : begin
								functout = 4'b1001;
						end
						AND : begin
								functout = 4'b1100;
						end
						OR : begin
								functout = 4'b1101;
						end
						XOR : begin
								functout = 4'b1111;
						end
						NOR : begin
								functout = 4'b1110;
						end
						SLT : begin
								functout = 4'b0101;
						end
						
						SRL : begin
								functout = 4'b0010;
						end
						SRA : begin
								functout = 4'b0001;
						end
						default:
								begin
								functout = 4'bxxxx; // ??
								end
					endcase
end


always @(op_code) begin
  // Match logic
  casez(op_code)
    // R-type common instructions
    OP_RTYPE  : begin
               alu_cntrl = functout;
					end
					 
	OP_ADDI : begin
					alu_cntrl = 4'b1000;
				 end
	OP_SLTI : begin
					alu_cntrl = 4'b0101;
				 end
	OP_ANDI : begin
					alu_cntrl = 4'b1100;
				 end
	OP_ORI : begin
					alu_cntrl = 4'b1101;
				 end
	OP_XORI : begin
					alu_cntrl = 4'b1111;
				 end
	OP_LW : begin
					alu_cntrl = 4'b1000;
				 end
	OP_SW : begin
					alu_cntrl = 4'b1000;
				 end
	OP_BEQ : begin
					alu_cntrl = 4'b1001;
				 end
	OP_BNE : begin
					alu_cntrl = 4'b1001;
				 end
	OP_J : begin
					alu_cntrl = 4'bxxxx;
				 end
				 
		default : alu_cntrl = 4'bxxxx;	//?	 
		endcase
*/		
 
endmodule