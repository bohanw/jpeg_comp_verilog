
module rgb2ycbcr_pp(clk, rst, enable, data_in, data_out, enable_out);
input		clk;
input		rst;
input		enable;
input	[23:0]	data_in;
output logic	[23:0]	data_out[7:0];
output logic	enable_out;

logic [23:0] data;
logic en;

rgb2ycbcr rgb0 (
	.clk(clk),
	.rst(rst),
	.enable(enable),
	.data_in(data_in),
	.data_out(data),
	.enable_out(en)
);

pingpongFFs pp0 (
	.clk(clk),
	.rst(rst),
	.enable(en),
	.data_in(data),
	.data_out(data_out),
	.dct_en(enable_out)
);

endmodule
