/*Flip-flop banks(implemented as LCFF)*/

module dct_stage2_dff #(parameter SIZE = 12) (
	input clk,rst,
	input [7:0] wr_en,
	input signed [SIZE-1:0] data_in[7:0][7:0],
	output logic signed [SIZE-1:0] data_out[7:0][7:0]
	);

		dct_stage2_dff_col  #(.SIZE(SIZE)) dff0 (.clk(clk),.rst(rst),.wr_en(wr_en[0]),.data_in(data_in[0]),.data_out(data_out[0]));
		dct_stage2_dff_col  #(.SIZE(SIZE)) dff1 (.clk(clk),.rst(rst),.wr_en(wr_en[1]),.data_in(data_in[1]),.data_out(data_out[1]));
		dct_stage2_dff_col  #(.SIZE(SIZE)) dff2 (.clk(clk),.rst(rst),.wr_en(wr_en[2]),.data_in(data_in[2]),.data_out(data_out[2]));
		dct_stage2_dff_col  #(.SIZE(SIZE)) dff3 (.clk(clk),.rst(rst),.wr_en(wr_en[3]),.data_in(data_in[3]),.data_out(data_out[3]));
		dct_stage2_dff_col  #(.SIZE(SIZE)) dff4 (.clk(clk),.rst(rst),.wr_en(wr_en[4]),.data_in(data_in[4]),.data_out(data_out[4]));
		dct_stage2_dff_col  #(.SIZE(SIZE)) dff5 (.clk(clk),.rst(rst),.wr_en(wr_en[5]),.data_in(data_in[5]),.data_out(data_out[5]));
		dct_stage2_dff_col  #(.SIZE(SIZE)) dff6 (.clk(clk),.rst(rst),.wr_en(wr_en[6]),.data_in(data_in[6]),.data_out(data_out[6]));
		dct_stage2_dff_col  #(.SIZE(SIZE)) dff7 (.clk(clk),.rst(rst),.wr_en(wr_en[7]),.data_in(data_in[7]),.data_out(data_out[7]));
endmodule