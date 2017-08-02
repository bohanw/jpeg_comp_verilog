//TODO: modify dct_col to dct_col_Stage2

module dct_stage2  #(parameter SIZE = 10, APPROX_BITS = 8,SIZE_MULT = SIZE+6,SIZE_OUT = SIZE+2)(
	input signed [SIZE-1:0] data_in [7:0][7:0],
	input signed dct_en, //dct_start signal
	input approx_en,clk,rst,
	output logic signed [SIZE_OUT-1:0] data_out [7:0][7:0],
	output logic dct_stage_done 
	);


	logic wr_en, next_wr_en;

	assign next_wr_en = (dct_en) ? 1'b1 : (dct_stage_done ? 0 : wr_en);

	always_ff @(posedge clk) begin
		if(rst) wr_en <= #1 0;

		else    wr_en <= #1 next_wr_en;
	end


	logic [7:0] dct_col_done; // Purely to solve multiple column dones signal to drive to same done output

	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col0 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[0]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[0]),
					 .done(dct_col_done[0]));

	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col1 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[1]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[1]),
					 .done(dct_col_done[1]));
	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col2 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[2]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[2]),
					 .done(dct_col_done[2]));
	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col3 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[3]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[3]),
					 .done(dct_col_done[3]));
	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col4(.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[4]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[4]),
					 .done(dct_col_done[4]));
	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col5 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[5]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[5]),
					 .done(dct_col_done[5]));
	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col6 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[6]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[6]),
					 .done(dct_col_done[6]));
	dct_col_stage2 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col7 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in[7]), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out[7]),
					 .done(dct_col_done[7]));

	assign dct_stage_done = dct_col_done[7];
	
endmodule 
