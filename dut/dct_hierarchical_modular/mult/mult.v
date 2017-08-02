
//Multiplier implemented in approximate DCT with fixed coeffs
//using adders adn shifters
//TODO: Done except the MULT BY 45 (REQUIRE 4:2 COMPRESSOR)

module mult #(parameter SIZE = 8, SIZE_MULT = SIZE+6,APPROX_BITS = 0)(
	input signed [7:0] coeff_in,
	input signed  [SIZE-1:0] mcand,
	input approx_en,
	output logic signed [SIZE_MULT-1:0] result);

	//logic signed [7:0]dct_coeff [7:0];

	logic signed [SIZE_MULT-1:0] result0, result1, result2, result3, result4, result5, result6; //SIZE parameterized to be SIZE (8) + 6 
	logic signed cout0, cout1, cout2, cout3, cout4, cout5, cout6;

	parameter [7:0] dct_coeff [0:6] = '{8'd64,8'd60, 8'd56, 8'd45, 8'd36, 8'd24, 8'd12};//a,b,c,d,e,f,g

	logic signed sign; 
	assign sign = mcand[SIZE-1];
	logic signed [SIZE_MULT+1:0] rca_approx_en;
	logic signed [SIZE_MULT-2:0] mcand_extend1, approx_en_add ;
	logic signed [SIZE_MULT-1:0] mcand_extend2, approx_en_sub ;
	logic signed [SIZE_MULT-1:0] cout_45;
	logic signed [SIZE_MULT+1:0] cout_45_shifted,sum_45_shifted;
	logic signed [SIZE_MULT+2:0] sum_45;
	assign mcand_extend1 = {{5{sign}},mcand};
	assign mcand_extend2 = {{6{sign}},mcand};


	always_comb begin
		for(int i = 0;i <SIZE_MULT;i++)begin
			if(i < APPROX_BITS)	approx_en_sub[i] = approx_en;
			else				approx_en_sub[i] = 1'b0;
		end
		for(int j = 0;j <SIZE_MULT-1;j++)begin
			if(j < APPROX_BITS)	approx_en_add[j] = approx_en;
			else				approx_en_add[j] = 1'b0;
		end
		for(int k = 0;k < SIZE_MULT+2;k++)begin
			if(k< APPROX_BITS) rca_approx_en[k] = approx_en;
			else 				rca_approx_en[k] = 1'b0;
		end
	end

	//mcand*64
	assign result0 = mcand << 6;
	//mcand * 60;
	fa_nbits_sub  #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) f1 (.a(mcand_extend2 << 6),.b(~(mcand_extend2 << 2)),.approx_en(approx_en_sub),.cin(1'b1),.sum(result1),.cout(cout1));
	//mcand* 56
	fa_nbits_sub  #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) f2 (.a(mcand_extend2 << 6),.b(~(mcand_extend2 << 3)),.approx_en(approx_en_sub),.cin(1'b1),.sum(result2),.cout(cout2));
	//mcand * 36
	fa_nbits  #(.SIZE(SIZE_MULT-1),.APPROX_BITS(APPROX_BITS)) f4 (.a(mcand_extend1 << 2),.b(mcand_extend1 << 5),.approx_en(approx_en_add),.cin(1'b0),.sum(result4),.cout(cout4));
	//mult * 24
	fa_nbits  #(.SIZE(SIZE_MULT-1),.APPROX_BITS(APPROX_BITS)) f5 (.a(mcand_extend1 << 3),.b(mcand_extend1 << 4),.approx_en(approx_en_add),.cin(1'b0),.sum(result5),.cout(cout5));

	// mult*12
	fa_nbits  #(.SIZE(SIZE_MULT-1),.APPROX_BITS(APPROX_BITS)) f6 (.a(mcand_extend1<< 2),.b(mcand_extend1 << 3),.approx_en(approx_en_add),.cin(1'b0),.sum(result6),.cout(cout6));

	// mult * 45
	
	comp_four_two #(.SIZE(SIZE_MULT-1), .APPROX_BITS(APPROX_BITS)) c0(.a(mcand_extend1),.b(mcand_extend1 << 2),.cin(mcand_extend1 << 3),.d(mcand_extend1 << 5),
														 .approx_en(approx_en),.cout(cout_45),.sum(result3));

	assign cout_45_shifted = {cout_45,{1'b0}};
	assign sum_45_shifted = {{result3[SIZE_MULT-1]},result3};

	fa_nbits #(.SIZE(SIZE_MULT+2),.APPROX_BITS(APPROX_BITS)) f3(.a(cout_45_shifted),.b(sum_45_shifted),.approx_en(rca_approx_en),
													.cin(1'b0),.sum(sum_45),.cout(cout3));

	always_comb begin
		case(coeff_in)
			dct_coeff[0]: begin result = result0; end
			dct_coeff[1]: begin result = result1; end
			dct_coeff[3]: begin result = sum_45[SIZE_MULT-1:0]; end
			dct_coeff[2]: begin result = result2; end
			dct_coeff[4]: begin result = result4; end
			dct_coeff[5]: begin result = result5; end
			dct_coeff[6]: begin result = result6; end 
			default:result = mcand;
		endcase
	end



endmodule