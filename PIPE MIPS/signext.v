module signext(i_data,i_sign,o_data);
input 	i_sign;
input  wire [15:0] i_data; 
output wire  [31:0] o_data;
wire  upper_bits;
assign  upper_bits = i_sign & i_data[15];
 assign o_data = {{16{upper_bits}}, i_data}; 
endmodule 