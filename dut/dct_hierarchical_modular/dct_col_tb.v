module dut;
	parameter SIZE = 8, APPROX_BITS = 0, SIZE_MULT = SIZE+6, SIZE_OUT = SIZE+10,APPROX_BITS=0;

	logic clk,rst;

	logic signed [SIZE-1:0] data_in [7:0];

	logic approx_en;
	logic signed [SIZE+2:0] data_out [7:0];


	dct_col #(.SIZE(SIZE), .APPROX_BITS(APPROX_BITS), .SIZE_MULT(SIZE_MULT), .SIZE_OUT(SIZE_OUT)) d0 (
		.clk(clk),
		.rst(rst),
		.data_in(data_in),
		.approx_en(approx_en),
		.data_out (data_out)
		);


	always #10 ~clk = clk;

	initial begin
		clk = 0;
		rst = 0;
		approx_en = 0;

		

	end
endmodule
