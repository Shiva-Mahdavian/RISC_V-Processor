module controlUnit(input  logic [6:0] funct7,
		   input  logic [2:0] funct3,
		   input  logic [6:0] OPCode,
		   input  logic       Zero,
		   output logic       PCSrc, //beq
		   output logic       MemRead,
		   output logic       MemtoReg,
		   output logic [3:0] ALUOperation,
		   output logic       MemWrite,
		   output logic       ALUSrc,
		   output logic       RegWrite);
	
	logic [1:0] ALUOp;
	logic Branch;
	
	mainControlUnit mainCon(OPCode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
	ALUControlUnit  aluCon (funct7, funct3, ALUOp, ALUOperation);
	assign PCSrc = Branch & Zero;
	
endmodule
