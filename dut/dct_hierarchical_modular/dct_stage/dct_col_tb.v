module dut;
	parameter SIZE = 8, APPROX_BITS = 0, SIZE_MULT = SIZE+6, SIZE_OUT = SIZE+2;

	logic clk,rst,start,done;

	logic signed [SIZE-1:0] data_in [7:0];

	logic approx_en,wr_en;
	logic signed [SIZE_OUT-1:0] data_out [7:0]; // after scalings


	dct_col #(.SIZE(SIZE), .APPROX_BITS(APPROX_BITS), .SIZE_MULT(SIZE_MULT), .SIZE_OUT(SIZE_OUT)) d0 (
		.start(start),
		.done(done),
		.clk(clk),
		.rst(rst),
		.wr_en(wr_en),
		.data_in(data_in),
		.approx_en(approx_en),
		.data_out (data_out)
		);
	logic signed [SIZE+10:0] sum [7:0];
	assign sum = d0.sum;
	logic signed [9:0] data_out_prereg [7:0];
	assign data_out_prereg = d0.sum_scaled;
	logic signed [18:0] data_out_ref [7:0];
	logic signed [9:0] data_out_ref_scale [7:0];
	//parameter signed [7:0] dct_coeff [0:6] = '{8'd64,8'd60, 8'd56, 8'd45, 8'd36, 8'd24, 8'd12};//a,b,c,d,e,f,g
	logic signed [7:0] dct_coeff[0:6];
	assign dct_coeff[0] = 64;
	assign dct_coeff[1] = 60;
	assign dct_coeff[2] = 56;
	assign dct_coeff[3] = 45;
	assign dct_coeff[4] = 36;
	assign dct_coeff[5] = 24;
	assign dct_coeff[6] = 12;

	assign data_out_ref[0] = dct_coeff[3] * (data_in[0] + data_in[1]+data_in[2]+data_in[3]+data_in[4]+data_in[5]+data_in[6]+data_in[7]);
	assign data_out_ref[1] = dct_coeff[0]*data_in[0] + dct_coeff[2]*data_in[1] + dct_coeff[4]*data_in[2] + dct_coeff[6]*data_in[3] - dct_coeff[6]*data_in[4] - dct_coeff[4]*data_in[5] - dct_coeff[2]*data_in[6] - dct_coeff[0]*data_in[7];
	assign data_out_ref[2] = dct_coeff[1]*data_in[0] + dct_coeff[5]*data_in[1] - dct_coeff[5]*data_in[2] - dct_coeff[1]*data_in[3] - dct_coeff[1]*data_in[4] - dct_coeff[5]*data_in[5] + dct_coeff[5]*data_in[6] + dct_coeff[1]*data_in[7];
	assign data_out_ref[3] = dct_coeff[2]*data_in[0] - dct_coeff[6]*data_in[1] - dct_coeff[0]*data_in[2] - dct_coeff[4]*data_in[3] + dct_coeff[4]*data_in[4] + dct_coeff[0]*data_in[5] + dct_coeff[6]*data_in[6] - dct_coeff[2]*data_in[7];
	assign data_out_ref[4] = dct_coeff[3]*(data_in[0]-data_in[1]-data_in[2]+data_in[3]+data_in[4]-data_in[5]-data_in[6]+data_in[7]);
	assign data_out_ref[5] = dct_coeff[4]*data_in[0] - dct_coeff[0]*data_in[1] + dct_coeff[6]*data_in[2] + dct_coeff[2]*data_in[3] - dct_coeff[2]*data_in[4] - dct_coeff[6]*data_in[5] + dct_coeff[0]*data_in[6] - dct_coeff[4]*data_in[7];
	assign data_out_ref[6] = dct_coeff[5]*data_in[0] - dct_coeff[1]*data_in[1] + dct_coeff[1]*data_in[2] - dct_coeff[5]*data_in[3] - dct_coeff[5]*data_in[4] + dct_coeff[1]*data_in[5] - dct_coeff[1]*data_in[6] + dct_coeff[5]* data_in[7];
	assign data_out_ref[7] = dct_coeff[6]*data_in[0] - dct_coeff[4]*data_in[1] + dct_coeff[2]*data_in[2] - dct_coeff[0]*data_in[3] + dct_coeff[0]*data_in[4] - dct_coeff[2]*data_in[5] + dct_coeff[4]*data_in[6] - dct_coeff[6]*data_in[7];

	always_comb 
		begin

			for(int i = 0; i < 8;i++) begin
				data_out_ref_scale[i] = data_out_ref[i][SIZE_OUT+6:7];
			end

		end

	always #5 clk = ~clk;

	integer out;

	always @(posedge done) begin
		$fwrite(out,"new col\n");

		for (int i = 0; i < 8; i++) begin
			$fwrite(out,"%b \n", data_out[i]);
		end

	end

	initial begin
	out = $fopen("./col_out.txt","w");

		clk = 0;
		rst = 0;
		approx_en = 0;
		wr_en = 0;
		start = 0;
		@(negedge clk);
		rst = 1;
		@(negedge clk);
		rst = 0;
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -34;
		data_in[1]=-38;
		data_in[2]=-39;
		data_in[3]=-35;
		data_in[4]=-39;
		data_in[5]=-38;

		data_in[6]=-40;
		data_in[7]=-36;
		@(negedge clk );
		start = 0;
		assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;


		/*Write 2nd time8*/


		@(negedge clk);
				wr_en = 0;
		@(negedge clk);

		@(negedge clk);

		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -35;
		data_in[1]=-39;
		data_in[2]=-36;
		data_in[3]=-33;
		data_in[4]=-34;
		data_in[5]=-37;

		data_in[6]=-37;
		data_in[7]=-8'd37;
		@(negedge clk);
		start = 0;
		assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;
			
		@(negedge clk);
		wr_en = 0;
		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -8'd38;
		data_in[1]=-8'd39;
		data_in[2]=-8'd32;
		data_in[3]=-8'd38;
		data_in[4]=-8'd34;
		data_in[5]=-8'd35;

		data_in[6]=-8'd37;
		data_in[7]=-8'd37;
		
		@(negedge clk);
		start = 0;
		assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;

		@(negedge clk);

		//
		@(negedge clk);
		wr_en = 0;
		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -8'd39;
		data_in[1]=-8'd34;
		data_in[2]=-8'd36;
		data_in[3]=-8'd39;
		data_in[4]=-8'd38;
		data_in[5]=-8'd38;

		data_in[6]=-8'd38;
		data_in[7]=-8'd42;
		
		@(negedge clk);
		start = 0;
				assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;

		@(negedge clk);

		//
		@(negedge clk);
		wr_en = 0;
		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -8'd38;
		data_in[1]=-8'd36;
		data_in[2]=-8'd36;
		data_in[3]=-8'd34;
		data_in[4]=-8'd38;
		data_in[5]=-8'd38;
		data_in[6]=-8'd36;
		data_in[7]=-8'd40;
		
		@(negedge clk);
		start = 0;
				assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;

		@(negedge clk);

		//
		@(negedge clk);
		wr_en = 0;
		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -8'd35;
		data_in[1]=-8'd39;
		data_in[2]=-8'd35;
		data_in[3]=-8'd36;
		data_in[4]=-8'd38;
		data_in[5]=-8'd34;
		data_in[6]=-8'd36;
		data_in[7]=-8'd34;
		
		@(negedge clk);
		start = 0;
				assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;

		@(negedge clk);

		//
		@(negedge clk);
		wr_en = 0;
		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -8'd35;
		data_in[1]=-8'd35;
		data_in[2]=-8'd38;
		data_in[3]=-8'd38;
		data_in[4]=-8'd35;
		data_in[5]=-8'd35;
		data_in[6]=-8'd38;
		data_in[7]=-8'd35;
		
		@(negedge clk);
		start = 0;
				assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;
		@(negedge clk);

		//
		@(negedge clk);
		wr_en = 0;
		@(negedge clk);
		wr_en = 1;
		start = 1;
		data_in[0] = -8'd34;
		data_in[1]=-8'd33;
		data_in[2]=-8'd36;
		data_in[3]=-8'd35;
		data_in[4]=-8'd36;
		data_in[5]=-8'd39;
		data_in[6]=-8'd38;
		data_in[7]=-8'd38;
		
		@(negedge clk);
		start = 0;
				assert (data_out_prereg[0] == data_out_ref_scale[0]);
assert (data_out_prereg[1] == data_out_ref_scale[1]);
assert (data_out_prereg[2] == data_out_ref_scale[2]);
assert (data_out_prereg[3] == data_out_ref_scale[3]);
assert (data_out_prereg[4] == data_out_ref_scale[4]);
assert (data_out_prereg[5] == data_out_ref_scale[5]);
assert (data_out_prereg[6] == data_out_ref_scale[6]);
assert (data_out_prereg[7] == data_out_ref_scale[7]);
		#80;
		@(negedge clk);
		$fclose(out);
		$finish;

	end
endmodule
