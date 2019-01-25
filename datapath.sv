module dataPath(input  logic 	    reset, clk,
		input  logic 	    PCSrc, MemRead, MemtoReg,
		input  logic [3:0]  ALUControl,
		input  logic 	    MemWrite, ALUSrc, RegWrite,
		output logic 	    Zero,
		output logic [31:0] instr,
		output logic [63:0] readDataB, ALURes);

	logic [63:0] PC, nextPC, PCPlus4, sum;
	logic [63:0] readDataA, data, extImm,
		     SrcB, shifted, readMem;
	
	//instantiating memories
	instructionMem imem(PC, instr);
	registers 	regs(clk, RegWrite, instr[19:15], instr[24:20], instr[11:7], data, readDataA, readDataB);
	dataMem		dmem(clk, MemWrite, MemRead, ALURes, readDataB, readMem);
	
	//selecting Wd for regfile
	mux2 memOrALURes(ALURes, readMem, MemtoReg, data);
	
	//immediate extended
	extend immGen(instr, extImm);
	
	
	//PC logic
	flopReg PCReg(clk, reset, nextPC, PC);
	adder plus4(PC, 64'd4, PCPlus4);
	mux2 pcMux(PCPlus4, sum, PCSrc, nextPC);
	assign shifted = extImm << 1;
	adder bAdder(PC, shifted, sum);

	//ALU
	mux2 aluMux(readDataB, extImm, ALUSrc, SrcB);
	ALU alu(readDataA, SrcB, ALUControl, Zero, ALURes);
	
	
		
endmodule
