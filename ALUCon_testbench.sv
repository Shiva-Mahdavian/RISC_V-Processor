module ALUCon_testbench();

	//inputs and outputs
	logic [6:0] f7;
	logic [2:0] f3;
	logic [1:0] aluOp;
	logic [3:0] con;
	
	//instantiate device under test
	ALUControlUnit dut(f7, f3, aluOp, con);
	
	initial begin
		aluOp = 2'b10;
		{f7, f3} = 10'b0000000000; #10;
		assert (con === 4'b0010) else $error("dp 10, add failed %b", con);
		{f7, f3} = 10'b0100000000; #10;
		assert (con === 4'b0110) else $error("dp 10, sub failed %b", con);
		{f7, f3} = 10'b0000000111; #10;
		assert (con === 4'b0000) else $error("dp 10, and failed %b", con);
		{f7, f3} = 10'b0000000110; #10;
		assert (con === 4'b0001) else $error("dp 10, or failed %b", con);
		aluOp = 2'b00; #10;
		assert (con === 4'b0010) else $error("memory, add failed %b", con);
		aluOp = 2'b01; #10;
		assert (con === 4'b0110) else $error("branch, sub failed %b", con);
		aluOp = 2'b11;
		{f7, f3} = 10'b0000000000; #10;
		assert (con === 4'b0010) else $error("dp 11, add failed %b", con);
		{f7, f3} = 10'b0100000000; #10;
		assert (con === 4'b0110) else $error("dp 11, sub failed %b", con);
		{f7, f3} = 10'b0000000111; #10;
		assert (con === 4'b0000) else $error("dp 11, and failed %b", con);
		{f7, f3} = 10'b0000000110; #10;
		assert (con === 4'b0001) else $error("dp 11, or failed %b", con);
	end
endmodule
