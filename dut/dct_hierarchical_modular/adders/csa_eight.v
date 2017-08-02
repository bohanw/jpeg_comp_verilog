module csa_eight #(parameter SIZE = 8, APPROX_BITS=0) (
	input signed [SIZE-1:0] a,b,c,d,e,f,g,h,
	input signed [SIZE-1:0] constant,
	input approx_en,
	output logic signed [SIZE+4:0] sum

);
	
	logic signed [SIZE-1:0] c1, s1, c2, s2, c3, s3;
	logic signed [SIZE:0] c1_shifted, c2_shifted, c3_shifted, s1_shifted, s2_shifted, s3_shifted;
	logic signed [SIZE:0] c4,s4,c5,s5;

	logic signed [SIZE+1:0] c4_shifted, s4_shifted, c5_shifted, s5_shifted;
	logic signed [SIZE+2:0] c6,s6;
	logic signed [SIZE+3:0] c6_shifted,s6_shifted;
	logic [SIZE+3:0] approx_en_int;
	logic signed co;

	assign c1_shifted = {c1,{1'b0}};
	assign c2_shifted = {c2,{1'b0}};
	assign c3_shifted = {c3,{1'b0}};
	assign c4_shifted = {c4,{1'b0}};
	assign c5_shifted = {c5,{1'b0}};
	assign c6_shifted = {c6,{1'b0}};
	assign s1_shifted = {{s1[SIZE-1]},s1};
	assign s2_shifted = {{s2[SIZE-1]},s2};
	assign s3_shifted = {{s3[SIZE-1]},s3};
	assign s4_shifted = {{s4[SIZE]},s4};
	assign s5_shifted = {{s5[SIZE]},s5};
	assign s6_shifted = {{s6[SIZE+2]},s6};

	//Ripple carry adder approx_en control
	always_comb begin
		for(int i =0;i < SIZE+4;i++)begin
			if(i < APPROX_BITS)	approx_en_int[i] = approx_en;
			else				approx_en_int[i] = 1'b0;
		end

	end

	comp_three_two #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS)) comp0(.a        (a),.b        (b),.cin      (c),.approx_en(approx_en),.sum      (s1),.cout     (c1));
	comp_three_two #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS)) comp1(.a        (d),.b        (e),.cin      (f),.approx_en(approx_en),.sum      (s2),.cout     (c2));
	comp_three_two #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS)) comp2(.a        (g),.b        (h),.cin      (constant),.approx_en(approx_en),.sum      (s3),.cout     (c3));



	comp_three_two #(.SIZE(SIZE+1),.APPROX_BITS(APPROX_BITS)) comp3(.a        (c1_shifted),.b        (s1_shifted),.cin      (c2_shifted),.approx_en(approx_en),.sum      (s4),.cout     (c4));

	comp_three_two #(.SIZE(SIZE+1),.APPROX_BITS(APPROX_BITS)) comp4(.a        (s2_shifted),.b        (c3_shifted),.cin      (s3_shifted),.approx_en(approx_en),.sum      (s5),.cout     (c5));

	comp_four_two #(.SIZE(SIZE+2),.APPROX_BITS(APPROX_BITS)) comp5(.a        (c4_shifted),.b        (s4_shifted),.cin     (c5_shifted),.d        (s5_shifted),.approx_en(approx_en),.sum      (s6),.cout     (c6));

	fa_nbits #(.SIZE(SIZE+4),.APPROX_BITS(APPROX_BITS)) f0(.a        (c6_shifted),.b        (s6_shifted),.approx_en(approx_en_int),.cin      (1'b0),.sum      (sum),.cout     (co));

endmodule
