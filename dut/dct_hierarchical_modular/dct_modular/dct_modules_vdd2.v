/*instantiate dct_stage1 ff banks and dct_stage 2 arithmetic units
	supplied by VDD2*/

module dct_modules_vdd2 #(parameter SIZE=10, APPROX_BITS = 8, SIZE_OUT= SIZE+2 ) (
	input rst,clk,
	//input [7:0] wr_en,
	input [7:0] wr_en_entry[7:0],
	input approx_en, // stage 2 approx_en
	input stage2_en, // enable computation 
	input signed [SIZE-1:0]data_in[7:0],
	output logic signed [SIZE_OUT-1:0]data_out[7:0][7:0]
);


	logic signed [SIZE-1:0]data_out_st1[7:0][7:0];
	logic signed [SIZE-1:0]data_in_st2[7:0][7:0];

	logic signed [SIZE-1:0]data_in_st2_buff[7:0][7:0];


dct_stage1_dff #(.SIZE(SIZE)) dct_st1_dff (.clk     (clk),
	.rst     (rst),
	//.wr_en   (wr_en),
	.wr_en_entry(wr_en_entry),
	.data_in (data_in),
	.data_out(data_out_st1));



transpose #(.SIZE(SIZE)) t0(
	.data_in (data_out_st1),
	.data_out(data_in_st2));



dct_stage2_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE+6),.SIZE_OUT(SIZE_OUT)) dct_st2_comb (
	.data_in  (data_in_st2_buff),
	.approx_en(approx_en),
	.data_out (data_out)
	);


//Insert tri-state buffer 
genvar i,j,k;
generate
	for(i = 0;i < 8;i ++) begin
		for(j=0;j<8;j++) begin
			for(k=0;k < SIZE;k++) begin
				TBUFX1TR buf0 (.A(data_in_st2[i][j][k]),.OE(stage2_en),.Y(data_in_st2_buff[i][j][k]));	
			end
		end
	end	

endgenerate

endmodule
