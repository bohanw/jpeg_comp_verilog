module dct_stage1_dff_col #(parameter SIZE = 10)(
	input clk,rst,
	input [7:0] wr_en_entry,
	input signed [SIZE-1:0] data_in[7:0],
	output logic signed [SIZE-1:0] data_out[7:0]	
);

	dff #(.SIZE(SIZE)) dff0 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[0]),.d(data_in[0]),.q(data_out[0]));
	dff #(.SIZE(SIZE)) dff1 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[1]),.d(data_in[1]),.q(data_out[1]));
	dff #(.SIZE(SIZE)) dff2 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[2]),.d(data_in[2]),.q(data_out[2]));
	dff #(.SIZE(SIZE)) dff3 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[3]),.d(data_in[3]),.q(data_out[3]));
	dff #(.SIZE(SIZE)) dff4 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[4]),.d(data_in[4]),.q(data_out[4]));
	dff #(.SIZE(SIZE)) dff5 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[5]),.d(data_in[5]),.q(data_out[5]));
	dff #(.SIZE(SIZE)) dff6 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[6]),.d(data_in[6]),.q(data_out[6]));
	dff #(.SIZE(SIZE)) dff7 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[7]),.d(data_in[7]),.q(data_out[7]));
endmodule
