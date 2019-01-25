module extend(input  logic signed [31:0] in,
	      output logic signed [63:0] out);
	      
	logic[6:0] opcode ;
	assign opcode = in[6:0];
	
	always_comb//extend immdeiate base on opcode
		case(opcode)
			//2th complement ld
			7'b0000011: out = {{52{in[31]}},in[31:20]};
			//2th complement sd
			7'b0100011: out = {{52{in[31]}},in[31:25],in[11:7]};
			//2th complement shifted branch
			7'b1100011: out = {{52{in[31]}}, in[31], in[7], in[30:25], in[11:8]};
		endcase
	      
endmodule	     
	      
	
