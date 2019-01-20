module registers_tb();
	
	//inputs and outputs
	logic clk;
	logic we;
	logic [5:0]  rr1,  rr2, wr;
	logic [63:0] rd1, rd2, wd;
	
	//instantiating device under test
	registers rf(clk, we, rr1, rr2, wr, wd, rd1, rd2);
	
	//generate clock
	always
		begin
			clk <= 1; #5ns; clk <= 0; #5ns;
		end
	
	initial begin
		rr1 = 5'd2; rr2 = 5'd5; #10ns;
		$display("x2 = %d ", rd1);
		we = 0; wd = 63'd10; wr = 5'd2; #10ns;
		$display("x2 = %d ", rd1);
		we = 1; wd = 63'd10; wr = 5'd2; #10ns;
		$display("x2 = %d ", rd1);
		$display("x5 = %d ", rd2);
	end


endmodule
