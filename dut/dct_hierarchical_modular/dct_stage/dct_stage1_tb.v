module dut;
	parameter SIZE = 8, APPROX_BITS = 0,SIZE_MULT = SIZE+6,SIZE_OUT = SIZE+3,DIM = 8;
	logic signed [SIZE-1:0] data_in [7:0];
	logic  dct_en,clk,rst; //dct_start signal
	logic approx_en;
	 logic signed [SIZE_OUT-1:0] data_out [7:0][7:0];
	 logic dct_stage_done;
	

	logic [3:0] cnt;

	logic dct_en_internal;
	dct_stage1 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) dct0(
		.clk(clk),
		.rst           (rst),
		.data_in       (data_in),
		.dct_en        (dct_en_internal),
		.approx_en     (approx_en),
		.data_out      (data_out),
		.dct_stage_done(dct_stage_done)
		);

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
		clk = 1;
		rst = 0;
		for(int i = 0; i< 8;i++)begin
			data_in[i] = 0;
		end
		approx_en=0;
		dct_en=0;

		@(negedge clk);
		rst = 1;
		@(negedge clk);
		rst = 0;

		@(negedge clk);
		dct_en = 1;
		data_in[0] = 80;
		data_in[1] = -120;
		data_in[2] = 12;
		data_in[3] = 5;
		data_in[4] = -90;
		data_in[5] = 127;
		data_in[6] = 34;
		data_in[7] = 2;
		@(negedge clk);
		dct_en=0;
		
		#6000;

		$finish;

	end
endmodule