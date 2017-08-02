/*Level converting flip flop Verilog module*/

module lcff (
	input clk,rst,
	input signed d,
	output logic signed q
	);

	always_ff @(posedge clk) begin
		if(rst)	 			 q <= #1 0;
		else 				 q <= #1 d;
	end

endmodule