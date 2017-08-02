module mult_tb;

	parameter SIZE = 8, SIZE_MULT = SIZE+6,APPROX_BITS = 0;
	logic signed [SIZE-1:0] coeff_in;
	logic  signed  [SIZE-1:0] mcand;
	logic signed [SIZE_MULT-1:0] result;
	logic clk;

	parameter signed [7:0] dct_coeff [0:6] = '{8'd64,8'd60, 8'd56, 8'd45, 8'd36, 8'd24, 8'd12};

	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(0)) m0 (.coeff_in(coeff_in), .mcand(mcand), .result  (result));

	always #10 clk = ~clk;

	logic signed [31:0] temp;
	logic signed [7:0] c;
	assign c = 8'd60;


	integer i;
	logic signed [7:0] one;
	assign one = 8'b00000001;
	logic signed [3:0] t1, t2, r;
	assign t1 = -7;
	assign t2 = -6;
	assign r = t1+ t2;

	initial begin
		coeff_in = dct_coeff[1];
		clk = 0;
		
		mcand = -8'b10000000;

		for(i = 0 ;i < 256;i++) begin
			#10;
			temp = mcand* c;
			if(result == temp) $display("mcand %b result%dtemp %dCORRRECT", mcand, result, temp);
			else $display("mcand %b result%dtemp %d WRONG",mcand, result, temp);
			mcand = mcand + one;
		end
		//$monitor("coeff_in %b mcand %b temp %b dec %d",coeff_in, mcand,temp, temp);
		/*
		#10;
		coeff_in = dct_coeff[0];
		mcand = -8'd2;

		#10;
		mcand = 8'd10;

		#10;
		coeff_in = dct_coeff[1];
		mcand = -8'd2;

		#10;
		mcand = 3;
		coeff_in = dct_coeff[2];
		#10;
		mcand = -10;
		#10;
		*/
		#10;
		assert (r == -13);
		$finish;



	end


endmodule