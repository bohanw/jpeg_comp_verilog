module dut;

	parameter SIZE = 8, APPROX_BITS_ST1= 4, APPROX_BITS_ST2 = 8, SIZE_MULT = SIZE+6,SIZE_OUT = SIZE+2, SIZE_FINAL = SIZE+4;

	logic [SIZE-1:0] data_in [8-1:0];
	logic clk, rst,dct_en;
	logic [1:0] approx_en;
	logic signed [SIZE_FINAL-2:0] data_out [8-1:0][8-1:0];
	logic dct_done ;

	logic dct_en_internal;
logic [2:0] cnt;
	
	dct_top #(.SIZE(SIZE),.APPROX_BITS_ST1(APPROX_BITS_ST1),.APPROX_BITS_ST2(APPROX_BITS_ST2),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT),.SIZE_FINAL(SIZE_FINAL)) d0 (.data_in  (data_in),
		.clk      (clk),
		.rst      (rst),
		.dct_en   (dct_en_internal),
		.approx_en(approx_en),
		.data_out (data_out),
		.dct_done (dct_done));	




assign dct_en_internal = (rst) ? 0 : (cnt == 3'b0 ? 1 : 0);
	always #5 clk = ~clk;

	always_ff @(posedge clk) begin
		if(rst) cnt <= #1 0;

		else begin
			if(cnt == 3'b111)  cnt <= #1 0;
			else cnt <= #1 cnt + 1;

		end
	end

	initial begin
		
		clk = 0;
		rst = 1;
		dct_en =0;
		approx_en = 0;

		@(negedge clk);
		rst = 0;
		@(negedge clk);
		dct_en = 1;
		approx_en = 2'b10;
		data_in[0] = 80;
		data_in[1] = -120;
		data_in[2] = 12;
		data_in[3] = 5;
		data_in[4] = -90;
		data_in[5] = 127;
		data_in[6] = 34;
		data_in[7] = 2;
		@(negedge clk);
		dct_en = 0;

		#6000;

		$finish;

	end
endmodule