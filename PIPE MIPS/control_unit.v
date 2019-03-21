module control_unit(
input       [5:0] i_opCode,
output reg        o_regDst,
output reg        o_regWrite,
output reg        o_jump,
output reg        o_br_beq,
output reg        o_br_bne,
output reg        o_extOp,
output reg        o_aluSrc,
output reg        o_memWrite,
output reg        o_memToReg
  );


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



always @(i_opCode) begin
  // Default values placeholder
    o_br_beq    = 1'b0;
    o_br_bne    = 1'b0;
    o_jump      = 1'b0;
    o_memWrite  = 1'b0;
  // Match logic
  casez(i_opCode)
    // R-type common instructions
    OP_RTYPE  : begin                  
                  o_regDst    = 1'b1; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'bx; 
                  o_aluSrc    = 1'b0; 
                  o_memToReg  = 1'b0; 
                end
                
    // I-type instructions
    OP_ADDI   : begin
                  o_regDst    = 1'b0; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'b1; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'b0; 
                end
                
    OP_ADDIU  : begin
                  o_regDst    = 1'b0; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'b0; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'b0; 
                end
                
    OP_SLTI   : begin
                  o_regDst    = 1'b0; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'b1; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'b0; 
                end
                
    OP_ANDI   : begin
                  o_regDst    = 1'b0; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'b0; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'b0; 
                end
                
    OP_ORI    : begin
                  o_regDst    = 1'b0; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'b0; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'b0; 
                end
                
    OP_XORI   : begin
                  o_regDst    = 1'b0; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'b0; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'b0; 
                end
                
    
    OP_J      : begin
                  o_jump      = 1'b1;
                  
                  o_regDst    = 1'bx; 
                  o_regWrite  = 1'b0; 
                  o_extOp     = 1'bx; 
                  o_aluSrc    = 1'bx; 
                  o_memToReg  = 1'bx; 
                end
                
    OP_BEQ    : begin
                  o_br_beq    = 1'b1;
                                    
                  o_regDst    = 1'bx; 
                  o_regWrite  = 1'b0; 
                  o_extOp     = 1'bx; 
                  o_aluSrc    = 1'b0; 
                  o_memToReg  = 1'bx; 
                end
                
    OP_BNE    : begin
                  o_br_bne    = 1'b1;
                  
                  o_regDst    = 1'bx; 
                  o_regWrite  = 1'b0; 
                  o_extOp     = 1'bx; 
                  o_aluSrc    = 1'b0; 
                  o_memToReg  = 1'bx; 
                end
                
    OP_LW     : begin
                  o_regDst    = 1'b0; 
                  o_regWrite  = 1'b1; 
                  o_extOp     = 1'b1; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'b1; 
                end
                
    OP_SW     : begin
                  o_memWrite  = 1'b1;
                  o_regDst    = 1'bx; 
                  o_regWrite  = 1'b0; 
                  o_extOp     = 1'b1; 
                  o_aluSrc    = 1'b1; 
                  o_memToReg  = 1'bx; 
                end
                

    default   : begin
                  .
                  o_regDst    = 1'bx;
                  o_regWrite  = 1'bx;
                  o_jump      = 1'bx;
                  o_br_beq    = 1'bx;
                  o_br_bne    = 1'bx;
                  o_extOp     = 1'bx;
                  o_aluSrc    = 1'bx;
                  o_memWrite  = 1'bx;
                  o_memToReg  = 1'bx;
                end
    
  endcase
end
endmodule