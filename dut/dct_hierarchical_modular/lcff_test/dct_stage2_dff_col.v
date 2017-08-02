module dct_stage2_dff_col #(parameter SIZE = 2) (
	input clk,rst,
	input  wr_en,
	input signed [SIZE-1:0] data_in[7:0],
	output logic signed [SIZE-1:0] data_out[7:0]
	);
		dff_level_convert  #(.SIZE(SIZE)) dff0 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[0]),.q(data_out[0]));
		dff_level_convert  #(.SIZE(SIZE)) dff1 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[1]),.q(data_out[1]));
dff_level_convert  #(.SIZE(SIZE)) dff2 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[2]),.q(data_out[2]));
dff_level_convert  #(.SIZE(SIZE)) dff3 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[3]),.q(data_out[3]));
dff_level_convert  #(.SIZE(SIZE)) dff4 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[4]),.q(data_out[4]));
dff_level_convert  #(.SIZE(SIZE)) dff5 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[5]),.q(data_out[5]));
dff_level_convert  #(.SIZE(SIZE)) dff6 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[6]),.q(data_out[6]));
dff_level_convert  #(.SIZE(SIZE)) dff7 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(data_in[7]),.q(data_out[7]));

endmodule
