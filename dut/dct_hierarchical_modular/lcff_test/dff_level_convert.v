//Model level-conversion d flip flop
module dff_level_convert #(parameter SIZE = 2)(
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

endmodule
