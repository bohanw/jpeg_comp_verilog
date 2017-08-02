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
	logic signed [SIZE:0] a_ext, b_ext;
	assign a_ext = {{a[SIZE-1]}, a};
	assign b_ext = {{b[SIZE-1]}, b};
	

  logic cin_internal[SIZE+1:0];

	assign cin_internal[0] = cin;

	genvar i;
	generate
		for(i =0; i < SIZE+1;i++) begin
			if(i < APPROX_BITS) 
				full_adder fa(.a(a_ext[i]),.b(b_ext[i]),.cin(cin_internal[i]),.approx_en(approx_en[0]),.sum(sum[i]),.cout(cin_internal[i+1]));
			else
				stdcell_full_adder fa_std(.a(a_ext[i]),.b(b_ext[i]),.cin(cin_internal[i]),.sum(sum[i]),.cout(cin_internal[i+1]));
		end
	endgenerate

  assign cout = cin_internal[SIZE+1];

endmodule // fa4



