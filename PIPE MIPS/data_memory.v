module data_memory
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=32)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output [(DATA_WIDTH-1):0] data_out
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[ADDR_WIDTH-1:0]; //??

	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;

	// Specify the initial contents.  You can also use the $readmemb
	// system task to initialize the RAM variable from a text file.
	// See the $readmemb template page for details.
	initial 
	begin : INIT
		integer i;
		for(i = 0; i < ADDR_WIDTH; i = i + 1)
			ram[i] = {DATA_WIDTH{1'b1}};
	end 

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr] <= data;

		//addr_reg <= addr;
	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign data_out = ram[addr];

endmodule