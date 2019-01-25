module registers(input  logic 	     clk,
		 input  logic 	     RegWrite,
		 input  logic [5:0]  ReadReg1,  ReadReg2, WriteReg,
		 input  logic [63:0] WriteData,
		 output logic [63:0] ReadData1, ReadData2);
		 
	logic [63:0] regs[31:0];
	

	initial begin
		$readmemb("regfile.dat", regs);//X0 always is zero
	end
	
	always_ff @(posedge clk)
		if (RegWrite & WriteReg != 0) regs[WriteReg] <= WriteData; //Reg != X0
	
	assign ReadData1 = regs[ReadReg1];
	assign ReadData2 = regs[ReadReg2];
		 
endmodule		 
