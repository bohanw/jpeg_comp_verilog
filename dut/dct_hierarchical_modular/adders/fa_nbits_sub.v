/*
* n bit ripple-carry adder 
*/
module fa_nbits_sub #(parameter SIZE = 8,APPROX_BITS = 0)(
	input signed [SIZE-1:0] a,b,approx_en,
	input signed cin,
	output logic signed [SIZE-1:0] sum,
	output logic signed cout
	);




  logic cin_internal [SIZE:0];

	assign cin_internal[0] = cin;

	genvar i;
	generate
		for(i =0; i < SIZE;i++) begin
			if(i < APPROX_BITS) 
				full_adder fa(.a(a[i]),.b(b[i]),.cin(cin_internal[i]),.approx_en(approx_en[0]),.sum(sum[i]),.cout(cin_internal[i+1]));
			else
				stdcell_full_adder fa_std(.a(a[i]),.b(b[i]),.cin(cin_internal[i]),.sum(sum[i]),.cout(cin_internal[i+1]));
		end
	endgenerate

  assign cout = cin_internal[SIZE];


endmodule // fa4_sub
