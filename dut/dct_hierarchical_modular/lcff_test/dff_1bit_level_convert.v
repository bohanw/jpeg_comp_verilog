module dff_1bit_level_convert (
	input clk,rst,wr_en,
	input signed d,
	output logic signed q
);

	logic signed next_q;
	assign next_q = (wr_en) ? d : q;
	lcff l0 (.clk(clk),.rst(rst),.d  (next_q), .q  (q));

endmodule


