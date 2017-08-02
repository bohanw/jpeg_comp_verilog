module comp_four_two(a,b,cin,d,approx_en,cout,sum);



parameter SIZE = 8;
parameter APPROX_BITS = 0;
	input [SIZE-1:0] a,b,cin,d;
	input approx_en;
	output logic signed [SIZE:0] cout;
	output logic signed [SIZE:0] sum;

	logic signed [SIZE-1:0] s1, cout1;
	logic [SIZE:0] c_pad, sum_pad,d_pad;
	comp_three_two #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS)) c0(.a(a),.b(b),.cin(cin),.approx_en(approx_en),.sum(s1),.cout(cout1));


	assign c_pad = {{cout1},{1'b0}};
	assign sum_pad = {{s1[SIZE-1]},{s1}};
	assign d_pad = {{d[SIZE-1]},{d}};

	comp_three_two #(.SIZE(SIZE+1),.APPROX_BITS(APPROX_BITS)) c1(.a(c_pad),.b(sum_pad),.cin(d_pad),.approx_en(approx_en),.sum(sum),.cout(cout));
	

endmodule // comp_four_to_two

