module ALU (input  logic signed [63:0] SrcA, SrcB,
	    input  logic [3:0]  ALUControl,
	    output logic 	Zero,
	    output logic signed [63:0]	ALURes);
	    
	always_comb begin
		case(ALUControl)
			4'b0000: ALURes = SrcA & SrcB;
			4'b0001: ALURes = SrcA | SrcB;
			4'b0010: ALURes = SrcA + SrcB;
			4'b0110: ALURes = SrcA - SrcB;
			default: ALURes = 64'b0;
		endcase
	end
	
	assign Zero = !(|ALURes);
	
endmodule
