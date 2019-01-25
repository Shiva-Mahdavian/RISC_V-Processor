module RISCV(input  logic 	 clk, reset,
	     output logic [63:0] readDataB, ALURes,
	     output logic	 MemWrite);

	logic PCSrc, MemRead, MemtoReg, ALUSrc, RegWrite, Zero;
	logic [3:0] ALUControl;
	logic [31:0] Instr;


	dataPath    dp(reset, clk, PCSrc, MemRead, MemtoReg,
		       ALUControl, MemWrite, ALUSrc, RegWrite,
		        Zero, Instr, readDataB, ALURes);
	controlUnit controller(Instr[31:25], Instr[14:12], Instr[6:0],
			       Zero, PCSrc, MemRead, MemtoReg, ALUControl,
			        MemWrite, ALUSrc, RegWrite);

endmodule
