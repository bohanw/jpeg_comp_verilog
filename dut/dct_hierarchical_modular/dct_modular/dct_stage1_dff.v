/*dct stage 1 power supply by vdd2 */
module dct_stage1_dff #(parameter SIZE = 10)(

	input clk,rst,
	//input [7:0] wr_en,
	input [7:0] wr_en_entry[7:0],
	input signed [SIZE-1:0]data_in [7:0],
	output logic signed [SIZE-1:0] data_out[7:0][7:0]
	);

	
	dct_stage1_dff_col #(.SIZE(SIZE)) dff_col0 (.clk     (clk),
										.rst     (rst),
										//.wr_en   (wr_en[0]),
										.wr_en_entry(wr_en_entry[0]),
										.data_in (data_in),
										.data_out(data_out[0]));

		dct_stage1_dff_col #(.SIZE(SIZE)) dff_col1 (.clk     (clk),
										.rst     (rst),
										//.wr_en   (wr_en[1]),
										.wr_en_entry(wr_en_entry[1]),
										.data_in (data_in),
										.data_out(data_out[1]));
		dct_stage1_dff_col #(.SIZE(SIZE)) dff_col2 (.clk     (clk),
										.rst     (rst),
										//.wr_en   (wr_en[2]),
										.wr_en_entry(wr_en_entry[2]),
										.data_in (data_in),
										.data_out(data_out[2]));
		dct_stage1_dff_col #(.SIZE(SIZE)) dff_col3 (.clk     (clk),
										.rst     (rst),
										//.wr_en   (wr_en[3]),
										.wr_en_entry(wr_en_entry[3]),
										.data_in (data_in),
										.data_out(data_out[3]));
		dct_stage1_dff_col #(.SIZE(SIZE)) dff_col4 (.clk     (clk),
										.rst     (rst),
										//.wr_en   (wr_en[4]),
										.wr_en_entry(wr_en_entry[4]),
										.data_in (data_in),
										.data_out(data_out[4]));
		dct_stage1_dff_col #(.SIZE(SIZE)) dff_col5 (.clk     (clk),
										.rst     (rst),
										//.wr_en   (wr_en[5]),
										.wr_en_entry(wr_en_entry[5]),
										.data_in (data_in),
										.data_out(data_out[5]));
		dct_stage1_dff_col #(.SIZE(SIZE)) dff_col6 (.clk     (clk),
										.rst     (rst),
										///.wr_en   (wr_en[6]),
										.wr_en_entry(wr_en_entry[6]),
										.data_in (data_in),
										.data_out(data_out[6]));
		dct_stage1_dff_col #(.SIZE(SIZE)) dff_col7 (.clk     (clk),
										.rst     (rst),
										//.wr_en   (wr_en[7]),
										.wr_en_entry(wr_en_entry[7]),
										.data_in (data_in),
										.data_out(data_out[7]));

endmodule // dct_stage1_ff