module tb;
	parameter SIZE = 8, APPROX_BITS = 0;

	logic signed [SIZE-1:0] a,b,cin;
	logic signed approx_en;
	logic signed [SIZE-1:0] sum,cout;


	comp_three_two #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS)) c0(a,b,cin,approx_en,sum,cout);

	initial begin
		a = 0;
		b = 0;
		cin = 0;
		approx_en = 0;

		#10;
		a = 8'd5;
		b = 8'd9;
		cin = 8'b00000001;
	
		#10;
		a = -8'd23;
		b = 8'd44;
		cin = 8'b00100000;

		#10;
		approx_en = 1'b1;
		#10;
		$finish;

	end

endmodule
