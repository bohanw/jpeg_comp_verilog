

/*
* n bit ripple-carry adder 
*/
module fa_nbits #(parameter SIZE = 8, APPROX_BITS = 0)(
	input signed [SIZE-1:0] a,b,approx_en,
	input signed cin,
	output logic signed [SIZE:0] sum,
	output logic signed cout
	);

	//Sign Extension to account for overflow
	logic signed [SIZE:0] a_ext, b_ext,approx_en_ext;
	assign a_ext = {{a[SIZE-1]}, a};
	assign b_ext = {{b[SIZE-1]}, b};
	assign approx_en_ext = {{1'b0},approx_en};
	logic signed [SIZE-1:0] c_internal;

	//sign extension of 
	
	full_adder f0 [SIZE:0] (.a(a_ext),.b(b_ext),.cin({c_internal, cin}),.approx_en(approx_en_ext),.sum(sum),.cout({cout, c_internal}));

endmodule // fa4


module fa_nbits_sub #(parameter SIZE = 8,APPROX_BITS = 0)(
	input signed [SIZE-1:0] a,b,approx_en,
	input signed cin,
	output logic signed [SIZE-1:0] sum,
	output logic signed cout
	);


	//sign extension of 
	logic signed [SIZE-2:0] c_internal;

	full_adder f0 [SIZE-1:0] (.a(a),.b(b),.cin({c_internal, cin}),.approx_en(approx_en),.sum(sum),.cout({cout, c_internal}));

endmodule // fa4_sub