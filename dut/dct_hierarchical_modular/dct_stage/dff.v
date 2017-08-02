//Model standard D flip flop
module dff #(parameter SIZE = 10)(
	input clk,rst,wr_en,
	input signed [SIZE-1:0] d,
	output logic signed [SIZE-1:0] q
);
	/*
	genvar i;
	generate 
		for(i =0;i<SIZE;i++)begin
			dff_1bit d0(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[i]),.q(q[i]));
		end
	endgenerate
	*/
dff_1bit dff_st1_0(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[0]),.q(q[0]));
dff_1bit dff_st1_1(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[1]),.q(q[1]));
dff_1bit dff_st1_2(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[2]),.q(q[2]));
dff_1bit dff_st1_3(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[3]),.q(q[3]));
dff_1bit dff_st1_4(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[4]),.q(q[4]));
dff_1bit dff_st1_5(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[5]),.q(q[5]));
dff_1bit dff_st1_6(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[6]),.q(q[6]));
dff_1bit dff_st1_7(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[7]),.q(q[7]));
dff_1bit dff_st1_8(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[8]),.q(q[8]));
dff_1bit dff_st1_9(.clk(clk),.rst(rst),.wr_en(wr_en),.d(d[9]),.q(q[9]));

endmodule
