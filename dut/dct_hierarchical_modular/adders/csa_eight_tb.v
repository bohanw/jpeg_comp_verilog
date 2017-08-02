module dut;
	
	parameter SIZE = 8,APPROXI_BITS = 0;


	logic signed [SIZE-1:0] a,b,c,d,e,f,g,h,constant,b_inv, f_inv;
	logic signed approx_en;
	logic signed [SIZE-1:0] a_i, b_i, c_i, d_i, e_i, f_i, g_i,h_i;
	logic signed [SIZE+4:0] sum;

	assign a_i = (a > 0) ? a : ~a;
	assign b_i = (b > 0) ? b : ~b;
assign c_i = (c > 0) ? c : ~c;
assign d_i = (d > 0) ? d : ~d;
assign e_i = (e > 0) ? e : ~e;
assign f_i = (f > 0) ? f : ~f;
assign g_i = (g > 0) ? g : ~g;
assign h_i = (h > 0) ? h : ~h;
	wire  signed [SIZE+4:0] s = a_i+b_i+c_i+d_i+e_i+f_i+g_i+h_i + constant;

	wire signed [SIZE+4:0] s1 = a+b+c+d+e+f+g+h;


	assign b_inv = ~b;





	csa_eight #(.SIZE(SIZE),.APPROX_BITS(0)) c0 (.a        (a_i),.b        (b_i),.c        (c_i),
												.d        (d_i),.e        (e_i),.f        (f_i),
												.g        (g_i),.h        (h_i),.constant (constant),.approx_en(approx_en),.sum      (sum));
	initial begin
		$monitor("a %d b%d c%d d%d sum %d",a,b,c,d,sum);
		a= 0;
		b=0;
		c=0;
		d=0;
		e=0;
		f=0;
		g=0;
		h=0;
		constant=8'd0;
		approx_en=0;

		#10;
		a = 127;
		b=8'd60;
		c=8'd45;
		d=8'd35;
		e=8'd100;
		f=8'd120;

		g=8'd127;
		h=8'd90;
		constant=8'd3;
		#10;
		assert (s == sum);

		#10;
		a = -1;
		b=121;
		c=1;
		d=1;
		e=-128;
		f=-128;
		g=5;
		h=2;
		constant=8'd3;
		#10;
		assert (s == sum);

		#10;
		a = 127;
		b = 127;
		c = 127;
		d = 127;
		e = 127;
		f = 127;
		g = 127;
		h = 127;

		constant = 0;
	assert (s == sum);
		#10;
		a = -128;
		b = -128;
		c = -128;
		d = -128;
		e = -128;
		f = -128;
		g = -128;
		h = -128;
		constant = 8;
			assert (s == sum);
		#10;

		$finish;

	end
endmodule 