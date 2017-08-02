module dff_1bit_level_convert (
	input clk,rst,wr_en,
	input signed d,
	output logic signed q
);
	//synopsys sync_set_reset "rst"
	always_ff @(posedge clk) begin
		if(rst)	 			 q <= #1 0;
		else if (wr_en) 	 q <= #1 d;

	end

endmodule
