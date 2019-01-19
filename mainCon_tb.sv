module mainCon_testbench();

	//inputs and outputs
	logic [6:0] op;
	logic [1:0] aluOp;
	logic  b, mR, m2r, mW, aluSrc, rW;
	
	//instantiate device under test
	mainControlUnit dut(op, b, mR, m2r, aluOp, mW, aluSrc, rW);
	
	initial begin
		//R-type
		op = 7'b0110011; #10;
		assert ( b === 1'b0) else $error("R-type branch is 1");
		assert ( mR === 1'b0) else $error("R-type memRead is 1");
		assert ( m2r === 1'b0) else $error("R-type memtoReg is 1");
		assert ( aluOp === 2'b10) else $error("R-type ALUOp is %b", aluOp);
		assert ( mW === 1'b0) else $error("R-type memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("R-type aluSrc is 1");
		assert ( rW === 1'b1) else $error("R-type RegWrite is 0");
		//ld
		op = 7'b0000011; #10;
		assert ( b === 1'b0) else $error("load branch is 1");
		assert ( mR === 1'b1) else $error("load memRead is 0");
		assert ( m2r === 1'b1) else $error("load memtoReg is 0");
		assert ( aluOp === 2'b00) else $error("load ALUOp is %b", aluOp);
		assert ( mW === 1'b0) else $error("load memWrite is 1");
		assert ( aluSrc === 1'b1) else $error("load aluSrc is 0");
		assert ( rW === 1'b1) else $error("load RegWrite is 0");
		//sd
		op = 7'b0100011; #10;
		assert ( b === 1'b0) else $error("store branch is 1");
		assert ( mR === 1'b0) else $error("store memRead is 1");
		//assert ( m2r === 1'b0) else $error("store memtoReg is 1");
		assert ( aluOp === 2'b00) else $error("store ALUOp is %b", aluOp);
		assert ( mW === 1'b1) else $error("store memWrite is 0");
		assert ( aluSrc === 1'b1) else $error("store aluSrc is 0");
		assert ( rW === 1'b0) else $error("store RegWrite is 1");
		//beq
		op = 7'b1100011; #10;
		assert ( b === 1'b1) else $error("beq branch is 0");
		assert ( mR === 1'b0) else $error("beq memRead is 1");
		//assert ( m2r === 1'b0) else $error("beq memtoReg is 1");
		assert ( aluOp === 2'b01) else $error("beq ALUOp is %b", aluOp);
		assert ( mW === 1'b0) else $error("beq memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("beq aluSrc is 1");
		assert ( rW === 1'b0) else $error("beq RegWrite is 1");
	end
endmodule
