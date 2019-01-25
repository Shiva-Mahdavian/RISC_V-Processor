module dataMem(input  logic 	clk, we, re,
	       input  logic [63:0] a,
	       input  logic [63:0] wd,
	       output logic [63:0] rd);
				
	logic [63:0] RAM[63:0];
	
	initial begin
		$readmemb("dmem.dat",RAM); //initialize data memory
	end
	
	always_ff @(posedge clk) begin
		if (we) RAM[a[63:3]] <= wd;
		if (re) rd = RAM[a[63:3]]; // double-word aligned
	end 

endmodule
