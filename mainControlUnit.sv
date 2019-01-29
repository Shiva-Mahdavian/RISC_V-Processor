module mainControlUnit(input  logic [6:0] OPCode,
		       output logic 	  Branch,
		       output logic 	  MemRead,
		       output logic 	  MemtoReg,
		       output logic [1:0] ALUOp,
		       output logic 	  MemWrite,
		       output logic 	  ALUSrc,
		       output logic 	  RegWrite);
		       
	logic [7:0] controls; //Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite		       
	always_comb
		casex(OPCode)
			7'b0110011: controls = 8'b00010001; //R-type: DataProcessing with register
			7'b0000011: controls = 8'b01100011; //Load
			7'b0100011: controls = 8'b00x00110; //Store
			7'b1100011: controls = 8'b10x01000; //Branch equal
			default: controls = 8'b00000000;
		endcase
		
	assign {Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite} = controls;
endmodule
