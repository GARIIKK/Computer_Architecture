module program_counter(pc_next, pc_result,we, reset, clk);
	parameter BITS = 32;
	input       [BITS-3:0]  pc_next;
	input       reset, clk,we;
	output   [BITS-1:0]  pc_result;
	
reg [29:0] pc;
	
 always @(posedge clk,negedge reset)begin
    if (!reset)begin
    		pc <= 30'h0;
	end else if(we)begin
				pc <= pc;
					
   end else begin
				pc <= pc_next;
			end
 end 
 
assign pc_result = {pc, 2'b00};

endmodule