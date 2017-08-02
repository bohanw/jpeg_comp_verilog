//Top-level DCT module
//TODO: test and verify precision after truncation for bid width matching
//		Parameterize 
//		Approximation
//		Modularize combination and sequential blocks to accomodate diff. voltage supplies 

module dct_top(data_in,clk, rst, dct_en,approx_en,data_out,dct_done);
	
//DCT parameters
parameter SIZE = 8, APPROX_BITS_ST1 = 6, APPROX_BITS_ST2 = 8,SIZE_MULT = SIZE+6,SIZE_OUT = SIZE+2, SIZE_FINAL = SIZE+4;

input signed [SIZE-1:0] data_in [7:0];
input clk, rst, dct_en;
input [1:0] approx_en;
output logic signed [SIZE_FINAL-2:0] data_out [7:0][7:0];
output logic dct_done;


	
	logic dct_stage_done;
	logic signed [SIZE_OUT-1:0] data_out_stage1[8-1:0][8-1:0];
	logic signed [SIZE_OUT-1:0] data_in_stage2 [8-1:0][8-1:0];
	logic signed [SIZE_FINAL-1:0] data_out_stage2[8-1:0][8-1:0];
	logic signed [SIZE_FINAL-1:0] data_out_internal[7:0][7:0];

  logic dct_done_int, gate; //todo remove pradeep

	dct_stage1 #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS_ST1),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) d1 (
		.data_in       (data_in),
		.dct_en        (dct_en),
		.approx_en     (approx_en[0]),
		.clk           (clk),
		.rst           (rst),
		.data_out      (data_out_stage1),
		.dct_stage_done(dct_stage_done)

		);

	transpose #(.SIZE(SIZE_OUT)) t0 (
		.data_in(data_out_stage1),
		.data_out(data_in_stage2)
		);

	dct_stage2 #(.SIZE(SIZE_OUT),.APPROX_BITS(APPROX_BITS_ST2),.SIZE_MULT(SIZE_OUT+6),.SIZE_OUT(SIZE_FINAL)) d2 (
		.data_in       (data_in_stage2),
		.dct_en        (dct_stage_done),
		.approx_en     (approx_en[1]),
		.clk           (clk),
		.rst           (rst),
		.data_out      (data_out_stage2),
		.dct_stage_done(dct_done_int)
		);

	transpose #(.SIZE(SIZE_FINAL)) t1 (
		.data_in(data_out_stage2),
		.data_out(data_out_internal)
		);

	//Discard MSB to match quantization module
	always_comb begin
		for (int i = 0; i < 8; i++) begin
			for (int j = 0; j < 8; j++) begin
				data_out[i][j] = data_out_internal[i][j][SIZE_FINAL-2:0];
			end
		end
	end
//pradeep todo temp fix to go ahead with other checks
//////////////////////////////////
assign dct_done = dct_done_int;// &  gate;

//synopsys sync_set_reset "rst"
/*
always_ff @(posedge clk)
begin
  if (rst)
    gate <= 1;
  else if (dct_done_int)
    gate <= 0;
end*/
///////////////////////////////////


endmodule



module transpose #(parameter SIZE = 21)(
	input  signed [SIZE-1:0]data_in[7:0][7:0],
	output logic signed[SIZE-1:0]data_out [7:0][7:0]);

	logic  signed [SIZE-1:0]trans[7:0][7:0] ;

	always_comb begin
		
		for (int i = 0; i < 8; i++) begin
	
			for(int j=0; j < 8;j++) begin
				trans[i][j] = data_in[j][i];
			end
		end


	end
	assign data_out = trans;	
endmodule // end
