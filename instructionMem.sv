module instructionMem(input  logic [63:0] adr,
	 	      output logic [31:0] rd);
	
	logic [31:0] RAM [63:0]; //TODO: size of RAM?
	
	initial
	$readmemh("memfile.dat", RAM);
	
	assign rd = RAM[adr[63:2]]; //word aligned
endmodule
