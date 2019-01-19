module ALUControlUnit(input  logic [6:0] funct7,
		      input  logic [2:0] funct3,
		      input  logic [1:0] ALUOp,
		      output logic [3:0] ALUOperation);
			     
	always_comb
		if (ALUOp[1]) begin //for Data Processing instructions
			case({funct7,funct3})
				10'b0000000000: ALUOperation = 4'b0010; //add
				10'b0100000000: ALUOperation = 4'b0110; //sub
				10'b0000000111: ALUOperation = 4'b0000; //and
				10'b0000000110: ALUOperation = 4'b0001; //or
				default	      : ALUOperation = 4'b1111; //unimplemented, for ease of debugging
			endcase
		end else begin // for Memory and Branch intstructions
			ALUOperation = (ALUOp[0] ? 4'b0110 : 4'b0010); // 00 (load and store) -> add; 01 (branch equal) -> sub
		end
endmodule		
