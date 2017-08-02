//Model level-conversion d flip flop
module dff_level_convert #(parameter SIZE = 12)(
	input clk,rst, wr_en,
	input signed [SIZE-1:0] d,
	output logic signed [SIZE-1:0] q
);
	/*
	genvar i;
	generate 
		for(i =0;i<SIZE;i++)begin
			dff_1bit_level_convert  d0(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[i]),.q(q[i]));
		end

	endgenerate
	*/
	dff_1bit_level_convert  dff_lc0(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[0]),.q(q[0]));
	dff_1bit_level_convert  dff_lc1(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[1]),.q(q[1]));
	dff_1bit_level_convert  dff_lc2(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[2]),.q(q[2]));
	dff_1bit_level_convert  dff_lc3(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[3]),.q(q[3]));
	dff_1bit_level_convert  dff_lc4(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[4]),.q(q[4]));
	dff_1bit_level_convert  dff_lc5(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[5]),.q(q[5]));
	dff_1bit_level_convert  dff_lc6(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[6]),.q(q[6]));
	dff_1bit_level_convert  dff_lc7(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[7]),.q(q[7]));
	dff_1bit_level_convert  dff_lc8(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[8]),.q(q[8]));
	dff_1bit_level_convert  dff_lc9(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[9]),.q(q[9]));
	dff_1bit_level_convert  dff_lc10(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[10]),.q(q[10]));
	dff_1bit_level_convert  dff_lc11(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[11]),.q(q[11]));
endmodule
