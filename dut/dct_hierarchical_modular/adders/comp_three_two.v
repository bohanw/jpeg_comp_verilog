module comp_three_two(a,b,cin,approx_en,sum,cout);

parameter SIZE = 8;
parameter APPROX_BITS = 0;
	input [SIZE-1:0] a,b, cin;
	input approx_en;
	output logic signed [SIZE-1:0] sum, cout;

  

	genvar i;
	generate
		for(i =0; i < SIZE;i++) begin
			if(i < APPROX_BITS) 
				full_adder fa(.a(a[i]),.b(b[i]),.cin(cin[i]),.approx_en(approx_en),.sum(sum[i]),.cout(cout[i]));
			else
				stdcell_full_adder fa_std(.a(a[i]),.b(b[i]),.cin(cin[i]),.sum(sum[i]),.cout(cout[i]));
		end
	endgenerate

endmodule
