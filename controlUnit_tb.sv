module ControlUnit_testbench();

	//inputs and outputs
	logic [6:0] f7;
	logic [2:0] f3;
	logic [6:0] op;
	logic [3:0] aluOp;
	logic  b, mR, m2r, mW, aluSrc, rW, z;
	
	//instantiate device under test
	controlUnit dut(f7, f3, op, z, b, mR, m2r, aluOp, mW, aluSrc, rW);
	
	initial begin
		//R-type
		op = 7'b0110011; #10;
		{f7, f3} = 10'b0000000000; #10;
		assert (aluOp === 4'b0010) else $error("add failed %b", aluOp);
		assert ( b === 1'b0) else $error("add branch is 1");
		assert ( mR === 1'b0) else $error("add memRead is 1");
		assert ( m2r === 1'b0) else $error("add memtoReg is 1");
		assert ( mW === 1'b0) else $error("add memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("add aluSrc is 1");
		assert ( rW === 1'b1) else $error("add RegWrite is 0");
		{f7, f3} = 10'b0100000000; #10;
		assert (aluOp === 4'b0110) else $error("sub failed %b", aluOp);
		assert ( b === 1'b0) else $error("sub branch is 1");
		assert ( mR === 1'b0) else $error("sub memRead is 1");
		assert ( m2r === 1'b0) else $error("sub memtoReg is 1");
		assert ( mW === 1'b0) else $error("sub memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("sub aluSrc is 1");
		assert ( rW === 1'b1) else $error("sub RegWrite is 0");
		{f7, f3} = 10'b0000000111; #10;
		assert (aluOp === 4'b0000) else $error("and failed %b", aluOp);
		assert ( b === 1'b0) else $error("and branch is 1");
		assert ( mR === 1'b0) else $error("and memRead is 1");
		assert ( m2r === 1'b0) else $error("and memtoReg is 1");
		assert ( mW === 1'b0) else $error("and memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("and aluSrc is 1");
		assert ( rW === 1'b1) else $error("and RegWrite is 0");
		{f7, f3} = 10'b0000000110; #10;
		assert (aluOp === 4'b0001) else $error("or failed %b", aluOp);
		assert ( b === 1'b0) else $error("or branch is 1");
		assert ( mR === 1'b0) else $error("or memRead is 1");
		assert ( m2r === 1'b0) else $error("or memtoReg is 1");
		assert ( mW === 1'b0) else $error("or memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("or aluSrc is 1");
		assert ( rW === 1'b1) else $error("or RegWrite is 0");
		//ld
		op = 7'b0000011; #10;
		assert ( b === 1'b0) else $error("load branch is 1");
		assert ( mR === 1'b1) else $error("load memRead is 0");
		assert ( m2r === 1'b1) else $error("load memtoReg is 0");
		assert (aluOp === 4'b0010) else $error("memory, add failed %b", aluOp);
		assert ( mW === 1'b0) else $error("load memWrite is 1");
		assert ( aluSrc === 1'b1) else $error("load aluSrc is 0");
		assert ( rW === 1'b1) else $error("load RegWrite is 0");
		//sd
		op = 7'b0100011; #10;
		assert ( b === 1'b0) else $error("store branch is 1");
		assert ( mR === 1'b0) else $error("store memRead is 1");
		assert (aluOp === 4'b0010) else $error("memory, add failed %b", aluOp);
		assert ( mW === 1'b1) else $error("store memWrite is 0");
		assert ( aluSrc === 1'b1) else $error("store aluSrc is 0");
		assert ( rW === 1'b0) else $error("store RegWrite is 1");
		//beq
		//beq taken
		op = 7'b1100011; z = 1; #10;
		assert ( b === 1'b1) else $error("beq branch is 0");
		assert ( mR === 1'b0) else $error("beq memRead is 1");
		assert (aluOp === 4'b0110) else $error("branch, sub failed %b", aluOp);
		assert ( mW === 1'b0) else $error("beq memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("beq aluSrc is 1");
		assert ( rW === 1'b0) else $error("beq RegWrite is 1");
		//beq not taken
		z = 0; #10;
		assert ( b === 1'b0) else $error("beq not taken branch is 1");
		assert ( mR === 1'b0) else $error("beq memRead is 1");
		assert (aluOp === 4'b0110) else $error("branch, sub failed %b", aluOp);
		assert ( mW === 1'b0) else $error("beq memWrite is 1");
		assert ( aluSrc === 1'b0) else $error("beq aluSrc is 1");
		assert ( rW === 1'b0) else $error("beq RegWrite is 1");
	end
endmodule
