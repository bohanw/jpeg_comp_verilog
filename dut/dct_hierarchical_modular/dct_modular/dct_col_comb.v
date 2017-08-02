
//DCT stage 1
//TODO: Get sequential correct 

module dct_col_comb #(parameter SIZE = 8, APPROX_BITS = 6, SIZE_MULT = SIZE+6, SIZE_OUT	= SIZE+2)(
	input signed [SIZE-1:0] data_in [7:0],
	input approx_en,
	output logic signed [SIZE_OUT-1:0] data_out [7:0]
	);
	
	//parameter [7:0] dct_coeff [0:6] = '{8'd64,8'd60, 8'd56, 8'd45, 8'd36, 8'd24, 8'd12};//a,b,c,d,e,f,g
	localparam [7:0] dct_coeff [0:6] = '{8'd64,8'd60, 8'd56, 8'd45, 8'd36, 8'd24, 8'd12};//a,b,c,d,e,f,g //pradeep change based synth warning

	logic signed [SIZE_MULT-1:0] m[7:0][7:0];

	logic signed [SIZE_MULT + 4:0] sum[7:0];

	//logic wr_en_int;
	//assign wr_en_int = wr_en && !done;

	//First entry i.e., w0
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i00(.coeff_in(dct_coeff[3]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[0][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i01(.coeff_in(dct_coeff[3]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[0][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i02(.coeff_in(dct_coeff[3]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[0][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i03(.coeff_in(dct_coeff[3]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[0][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i04(.coeff_in(dct_coeff[3]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[0][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i05(.coeff_in(dct_coeff[3]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[0][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i06(.coeff_in(dct_coeff[3]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[0][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i07(.coeff_in(dct_coeff[3]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[0][7]));

	//Second entry, w1
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i10(.coeff_in(dct_coeff[0]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[1][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i11(.coeff_in(dct_coeff[2]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[1][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i12(.coeff_in(dct_coeff[4]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[1][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i13(.coeff_in(dct_coeff[6]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[1][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i14(.coeff_in(dct_coeff[6]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[1][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i15(.coeff_in(dct_coeff[4]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[1][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i16(.coeff_in(dct_coeff[2]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[1][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i17(.coeff_in(dct_coeff[0]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[1][7]));
	//Third row w2
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i20(.coeff_in(dct_coeff[1]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[2][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i21(.coeff_in(dct_coeff[5]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[2][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i22(.coeff_in(dct_coeff[5]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[2][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i23(.coeff_in(dct_coeff[1]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[2][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i24(.coeff_in(dct_coeff[1]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[2][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i25(.coeff_in(dct_coeff[5]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[2][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i26(.coeff_in(dct_coeff[5]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[2][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i27(.coeff_in(dct_coeff[1]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[2][7]));

	//w3
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i30(.coeff_in(dct_coeff[2]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[3][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i31(.coeff_in(dct_coeff[6]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[3][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i32(.coeff_in(dct_coeff[0]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[3][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i33(.coeff_in(dct_coeff[4]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[3][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i34(.coeff_in(dct_coeff[4]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[3][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i35(.coeff_in(dct_coeff[0]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[3][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i36(.coeff_in(dct_coeff[6]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[3][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i37(.coeff_in(dct_coeff[2]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[3][7]));

	//w4
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i40(.coeff_in(dct_coeff[3]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[4][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i41(.coeff_in(dct_coeff[3]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[4][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i42(.coeff_in(dct_coeff[3]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[4][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i43(.coeff_in(dct_coeff[3]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[4][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i44(.coeff_in(dct_coeff[3]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[4][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i45(.coeff_in(dct_coeff[3]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[4][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i46(.coeff_in(dct_coeff[3]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[4][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i47(.coeff_in(dct_coeff[3]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[4][7]));

	//w5
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i50(.coeff_in(dct_coeff[4]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[5][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i51(.coeff_in(dct_coeff[0]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[5][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i52(.coeff_in(dct_coeff[6]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[5][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i53(.coeff_in(dct_coeff[2]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[5][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i54(.coeff_in(dct_coeff[2]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[5][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i55(.coeff_in(dct_coeff[6]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[5][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i56(.coeff_in(dct_coeff[0]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[5][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i57(.coeff_in(dct_coeff[4]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[5][7]));

	//w6
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i60(.coeff_in(dct_coeff[5]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[6][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i61(.coeff_in(dct_coeff[1]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[6][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i62(.coeff_in(dct_coeff[1]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[6][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i63(.coeff_in(dct_coeff[5]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[6][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i64(.coeff_in(dct_coeff[5]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[6][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i65(.coeff_in(dct_coeff[1]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[6][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i66(.coeff_in(dct_coeff[1]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[6][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i67(.coeff_in(dct_coeff[5]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[6][7]));

	//w7
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i70(.coeff_in(dct_coeff[6]),.mcand   (data_in[0]),.approx_en(approx_en),.result  (m[7][0]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i71(.coeff_in(dct_coeff[4]),.mcand   (data_in[1]),.approx_en(approx_en),.result  (m[7][1]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i72(.coeff_in(dct_coeff[2]),.mcand   (data_in[2]),.approx_en(approx_en),.result  (m[7][2]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i73(.coeff_in(dct_coeff[0]),.mcand   (data_in[3]),.approx_en(approx_en),.result  (m[7][3]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i74(.coeff_in(dct_coeff[0]),.mcand   (data_in[4]),.approx_en(approx_en),.result  (m[7][4]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i75(.coeff_in(dct_coeff[2]),.mcand   (data_in[5]),.approx_en(approx_en),.result  (m[7][5]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i76(.coeff_in(dct_coeff[4]),.mcand   (data_in[6]),.approx_en(approx_en),.result  (m[7][6]));
	mult #(.SIZE(SIZE),.SIZE_MULT(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) i77(.coeff_in(dct_coeff[6]),.mcand   (data_in[7]),.approx_en(approx_en),.result  (m[7][7]));



	csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w0(.a(m[0][0]),
					 .b        (m[0][1]),
					 .c        (m[0][2]),
					 .d        (m[0][3]),
					 .e        (m[0][4]),
					 .f        (m[0][5]),
					 .g        (m[0][6]),
					 .h        (m[0][7]),
					 .constant ({SIZE_MULT{1'b0}}),
					 .approx_en(approx_en),
					 .sum      (sum[0]));
		csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w1(.a(m[1][0]),
					 .b        (m[1][1]),
					 .c        (m[1][2]),
					 .d        (m[1][3]),
					 .e        (~m[1][4]),
					 .f        (~m[1][5]),
					 .g        (~m[1][6]),
					 .h        (~m[1][7]),
					 .constant ({{SIZE_MULT-3{1'b0}},{3'b100}}),
					 .approx_en(approx_en),
					 .sum      (sum[1]));

		csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w2(.a        (m[2][0]), 

					 .b        (m[2][1]),
					 .c        (~m[2][2]),
					 .d        (~m[2][3]),
					 .e        (~m[2][4]),
					 .f        (~m[2][5]),
					 .g        (m[2][6]),
					 .h        (m[2][7]),
					 .constant ({{SIZE_MULT-3{1'b0}},{3'b100}}),
					 .approx_en(approx_en),
					 .sum      (sum[2]));
		csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w3(.a        (m[3][0]),
					 .b        (~m[3][1]),
					 .c        (~m[3][2]),
					 .d        (~m[3][3]),
					 .e        (m[3][4]),
					 .f        (m[3][5]),
					 .g        (m[3][6]),
					 .h        (~m[3][7]),
					 .constant ({{SIZE_MULT-3{1'b0}},{3'b100}}),
					 .approx_en(approx_en),
					 .sum      (sum[3]));
		csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w4(.a        (m[4][0]),
					 .b        (~m[4][1]),
					 .c        (~m[4][2]),
					 .d        (m[4][3]),
					 .e        (m[4][4]),
					 .f        (~m[4][5]),
					 .g        (~m[4][6]),
					 .h        (m[4][7]),
					 .constant ({{SIZE_MULT-3{1'b0}},{3'b100}}),
					 .approx_en(approx_en),
					 .sum      (sum[4]));
		csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w5(.a        (m[5][0]),
					 .b        (~m[5][1]),
					 .c        (m[5][2]),
					 .d        (m[5][3]),
					 .e        (~m[5][4]),
					 .f        (~m[5][5]),
					 .g        (m[5][6]),
					 .h        (~m[5][7]),
					 .constant ({{SIZE_MULT-3{1'b0}},{3'b100}}),
					 .approx_en(approx_en),
					 .sum      (sum[5]));
		csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w6(.a        (m[6][0]),
					 .b        (~m[6][1]),
					 .c        (m[6][2]),
					 .d        (~m[6][3]),
					 .e        (~m[6][4]),
					 .f        (m[6][5]),
					 .g        (~m[6][6]),
					 .h        (m[6][7]),
					 .constant ({{SIZE_MULT-3{1'b0}},{3'b100}}),
					 .approx_en(approx_en),
					 .sum      (sum[6]));
		csa_eight #(.SIZE(SIZE_MULT),.APPROX_BITS(APPROX_BITS)) w7(.a        (m[7][0]),
					 .b        (~m[7][1]),
					 .c        (m[7][2]),
					 .d        (~m[7][3]),
					 .e        (m[7][4]),
					 .f        (~m[7][5]),
					 .g        (m[7][6]),
					 .h        (~m[7][7]),
					 .constant ({{SIZE_MULT-3{1'b0}},{3'b100}}),
					 .approx_en(approx_en),
					 .sum      (sum[7]));

		//scaled by 2^7=128
		always_comb begin
			for (int i = 0; i < 8; i++) begin
				/* code */
				data_out[i] = sum[i][SIZE_OUT+7-1:7];
			end

		end
		/*
		genvar i;
		generate 
			for(i = 0;i < 8;i++) begin
				dff #(.SIZE(SIZE_OUT)) dff0 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[i]),.q(data_out[i]));
			end
		endgenerate
		*/
endmodule


