module comp_eight_two #(parameter SIZE = 8, APPROX_BITS = 0)(
	input [SIZE-1:0] a,b,c,d,e,f,g,h,
	input approx_en,
	output logic signed  [SIZE+2:0] sum, cout
	);

	logic signed [SIZE:0] c1,s1,c2,s2;
	logic signed [SIZE+1:0] c1_shifted, s1_shifted,c2_shifted, s2_shifted;

	comp_four_two #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS)) comp0(.a(a),.b(b),.cin (c),.d(d),
													.approx_en(approx_en),.cout(c1),.sum(s1));


	comp_four_two #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS)) comp1(.a        (e),.b        (f),.cin      (g),.d        (h),
													.approx_en(approx_en),.cout     (c2),.sum      (s2));

	assign c1_shifted = {c1,{1'b0}};
	assign c2_shifted = {c2,{1'b0}};
	assign s1_shifted = {{s1[SIZE]},s1};
	assign s2_shifted = {{s2[SIZE]},s2};

	comp_four_two #(.SIZE(SIZE+2),.APPROX_BITS(APPROX_BITS)) comp2(.a        (c1_shifted),.b        (c2_shifted),.cin      (s1_shifted),.d        (s2_shifted),
													.approx_en(approx_en),.cout     (cout),.sum      (sum));

endmodule
