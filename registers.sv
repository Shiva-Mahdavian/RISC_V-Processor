module registers(input  logic 	     clk,
		 input  logic 	     RegWrite,
		 input  logic [5:0]  ReadReg1,  ReadReg2, WriteReg,
		 input  logic [63:0] WriteData,
		 output logic [63:0] ReadData1, ReadData2);
		 
	logic [63:0] regs[63:0];
	
	//assign regs[0] = 0; //TODO: x0 is always zero :-?
	
	always_ff @(posedge clk)
		if (RegWrite) regs[WriteReg] <= WriteData;
	
	assign ReadData1 = regs[ReadReg1];
	assign ReadData2 = regs[ReadReg2];
		 
endmodule		 
