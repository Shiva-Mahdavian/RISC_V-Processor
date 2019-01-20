module ALU_testbench();
	
	//input output
	logic signed [63:0] a, b, res;
	logic zero;
	logic [3:0] control;
	
	//instantiating device under test
	ALU dut(a, b, control, zero, res);
	
	initial begin
		//sub
		control = 4'b0110;
		a = 63'd5; b = 63'd5; #10ns;
		$display("%d - %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd5; #10ns;
		$display("%d - %d = %d and zero is %b", a, b, res, zero);
		a = 63'd25; b = 63'd5; #10ns;
		$display("%d - %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd0; #10ns;
		$display("%d - %d = %d and zero is %b", a, b, res, zero);
		a = 63'd1245; b = 63'd976; #10ns;
		$display("%d - %d = %d and zero is %b", a, b, res, zero);
		//sum
		control = 4'b0010;
		a = 63'd5; b = 63'd5; #10ns;
		$display("%d + %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd5; #10ns;
		$display("%d + %d = %d and zero is %b", a, b, res, zero);
		a = 63'd25; b = 63'd5; #10ns;
		$display("%d + %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd0; #10ns;
		$display("%d + %d = %d and zero is %b", a, b, res, zero);
		a = 63'd1245; b = 63'd976; #10ns;
		$display("%d + %d = %d and zero is %b", a, b, res, zero);
		//and
		control = 4'b0000;
		a = 63'd5; b = 63'd5; #10ns;
		$display("%d & %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd5; #10ns;
		$display("%d & %d = %d and zero is %b", a, b, res, zero);
		a = 63'd25; b = 63'd5; #10ns;
		$display("%d & %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd0; #10ns;
		$display("%d & %d = %d and zero is %b", a, b, res, zero);
		a = 63'd1245; b = 63'd976; #10ns;
		$display("%d & %d = %d and zero is %b", a, b, res, zero);
		//or
		control = 4'b0001;
		a = 63'd5; b = 63'd5; #10ns;
		$display("%d | %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd5; #10ns;
		$display("%d | %d = %d and zero is %b", a, b, res, zero);
		a = 63'd25; b = 63'd5; #10ns;
		$display("%d | %d = %d and zero is %b", a, b, res, zero);
		a = 63'd0; b = 63'd0; #10ns;
		$display("%d | %d = %d and zero is %b", a, b, res, zero);
		a = 63'd1245; b = 63'd976; #10ns;
		$display("%d | %d = %d and zero is %b", a, b, res, zero);	
	end
	
endmodule
