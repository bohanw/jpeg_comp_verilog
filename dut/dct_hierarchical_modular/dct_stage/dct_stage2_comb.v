module dct_stage2_comb #(parameter SIZE = 10, APPROX_BITS = 0, SIZE_MULT = SIZE+6, SIZE_OUT	= SIZE+2)(
	input signed [SIZE-1:0] data_in [7:0][7:0],
	input approx_en,
	output logic signed [SIZE_OUT-1:0] data_out [7:0][7:0]
);


	dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col0(
		.data_in  (data_in[0]),
		.approx_en(approx_en),
		.data_out (data_out[0]));

		dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col1(
		.data_in  (data_in[1]),
		.approx_en(approx_en),
		.data_out (data_out[1]));

		dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col2(
		.data_in  (data_in[2]),
		.approx_en(approx_en),
		.data_out (data_out[2]));
		dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col3(
		.data_in  (data_in[3]),
		.approx_en(approx_en),
		.data_out (data_out[3]));
		dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col4(
		.data_in  (data_in[4]),
		.approx_en(approx_en),
		.data_out (data_out[4]));
		dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col5(
		.data_in  (data_in[5]),
		.approx_en(approx_en),
		.data_out (data_out[5]));
		dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col6(
		.data_in  (data_in[6]),
		.approx_en(approx_en),
		.data_out (data_out[6]));
		dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) comb_col7(
		.data_in  (data_in[7]),
		.approx_en(approx_en),
		.data_out (data_out[7]));


	

endmodule