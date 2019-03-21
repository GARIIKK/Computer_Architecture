//Source from Harris
module reg_file(clk,we,adress_A, adress_B, wa,wd,data_A, data_B,rst);
input		rst;
input           clk;
integer         i;
input          we;
input  wire  [4:0]  adress_A, adress_B, wa; 
input  wire [31:0] wd;
output wire [31:0] data_A, data_B;
reg [31:0] regi_file[31:0]; 

  always @(posedge clk,negedge rst)begin
	 if(!rst)begin
	 for(i = 0; i < 32; i = i + 1) regi_file[i] <= 32'h0;
    end else if (we) regi_file[wa] <= wd; 
	 else for(i = 0; i < 32; i = i + 1) regi_file[i] <= regi_file[i];
	end
	
   assign data_A = regi_file[adress_A];
   assign data_B = regi_file[adress_B];
  
endmodule