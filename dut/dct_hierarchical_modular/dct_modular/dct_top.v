module dct_top #(parameter SIZE_STAGE1 = 8, SIZE_STAGE2 = 10,APPROX_BITS_ST1 = 6, APPROX_BITS_ST2 = 8, SIZE_OUT = 12)(
	input signed [SIZE_STAGE1-1:0] data_in [7:0],
	input clk,rst, dct_en,
	input [1:0] approx_en,
	output logic signed [SIZE_OUT-2:0] data_out[7:0][7:0],
	output logic dct_done
	);


	//internal nets
	logic signed [SIZE_STAGE2-1:0] data_out_st1[7:0];
	logic signed [SIZE_OUT-1:0] data_out_st2[7:0][7:0];
	logic signed [SIZE_OUT-1:0] data_out_st2_reg[7:0][7:0];

	//internal control

	logic stage2_en,stage2_wr_en;

	logic dct_st1_done,dct_st2_start, dct_st2_done;
	//*************************************************************************
	//Stage 1 control


	//*************************************************************************8
	logic [7:0] wr_en_st1, wr_en_disable_st1;
	logic [7:0] wr_en_entry[7:0];
	logic [3:0] col_cnt_st1, n_col_cnt_st1;
	logic [7:0] done_cols_st1;

	//**************************************************************************
	logic [3:0] cnt_st2, n_cnt_st2;

	//Stage 1 control
	assign dct_st1_done = done_cols_st1[7];
	assign dct_st2_start = dct_st1_done;


	always_comb begin
		n_col_cnt_st1 = col_cnt_st1;
		if(dct_en) begin
			if(col_cnt_st1 == 4'b0111  || col_cnt_st1 == 4'b1000 ) 
				 n_col_cnt_st1 = 4'b0;
			else 
				 n_col_cnt_st1 = col_cnt_st1 + 1;
		end 
	end

	always_comb begin
		wr_en_st1 = 8'b00000000;
		case(col_cnt_st1)
			4'd0:   begin wr_en_st1[0] = 1'b1;	  
						if(wr_en_disable_st1[0]) wr_en_st1[0] = 1'b0;
					end
			4'd1:   begin wr_en_st1[1] = 1'b1;
						if(wr_en_disable_st1[1]) wr_en_st1[1] = 1'b0;
					end
			4'd2:  	begin wr_en_st1[2] = 1'b1;
						if(wr_en_disable_st1[2]) wr_en_st1[2] = 1'b0;
					end
			4'd3:   begin 
						wr_en_st1[3] = 1'b1;
						if(wr_en_disable_st1[3]) wr_en_st1[3] = 1'b0;
					end
			4'd4:   begin wr_en_st1[4] = 1'b1;
						if(wr_en_disable_st1[4]) wr_en_st1[4] = 1'b0;
					end
			4'd5:   begin wr_en_st1[5] = 1'b1;
						if(wr_en_disable_st1[5]) wr_en_st1[5] = 1'b0;
					end
			4'd6:   begin wr_en_st1[6] = 1'b1;
						if(wr_en_disable_st1[6]) wr_en_st1[6] = 1'b0;
					end
			4'd7:   begin 
						wr_en_st1[7] = 1'b1;
						if(wr_en_disable_st1[7]) wr_en_st1[7] = 1'b0;
					end
			default: wr_en_st1 = 8'b00000000;
		endcase
	end

	//Disable wr_en signal when column done is raised
	//synopsys sync_set_reset "rst"
	always_ff @(posedge clk) begin
		if(rst) wr_en_disable_st1 <= #1 8'b0;
		else begin
			for (int i = 0; i < 8; i++) begin
				if(done_cols_st1[i]) begin
					wr_en_disable_st1[i] <= #1 1'b1;
					if(i > 0) wr_en_disable_st1[i-1] <= #1 1'b0;
				end
			end

		end

	end

	//synopsys sync_set_reset "rst"
	always_ff @(posedge clk) begin
		if(rst)	col_cnt_st1 <= #1 4'b1000;
		else    col_cnt_st1 <= #1 n_col_cnt_st1;

	end

	dct_stage1_col_ctrl st1_col_ctrl0 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[0]),.col_done   (done_cols_st1[0]),.wr_en_entry(wr_en_entry[0]));
	dct_stage1_col_ctrl st1_col_ctrl1 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[1]),.col_done   (done_cols_st1[1]),.wr_en_entry(wr_en_entry[1]));
	dct_stage1_col_ctrl st1_col_ctrl2 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[2]),.col_done   (done_cols_st1[2]),.wr_en_entry(wr_en_entry[2]));
	dct_stage1_col_ctrl st1_col_ctrl3 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[3]),.col_done   (done_cols_st1[3]),.wr_en_entry(wr_en_entry[3]));
	dct_stage1_col_ctrl st1_col_ctrl4 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[4]),.col_done   (done_cols_st1[4]),.wr_en_entry(wr_en_entry[4]));
	dct_stage1_col_ctrl st1_col_ctrl5 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[5]),.col_done   (done_cols_st1[5]),.wr_en_entry(wr_en_entry[5]));
	dct_stage1_col_ctrl st1_col_ctrl6 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[6]),.col_done   (done_cols_st1[6]),.wr_en_entry(wr_en_entry[6]));
	dct_stage1_col_ctrl st1_col_ctrl7 (.clk        (clk),.rst        (rst),.start      (dct_en),.wr_en_col  (wr_en_st1[7]),.col_done   (done_cols_st1[7]),.wr_en_entry(wr_en_entry[7]));


	//***************************************************************************************
	//Stage2 control

	logic next_st2_wr_en;
	logic [7:0] st2_wr_en_entry;

	assign next_st2_wr_en = (dct_st2_start) ? 1'b1: ((dct_st2_done ? 1'b0 : stage2_wr_en));

	assign dct_st2_done = (cnt_st2 == 4'b0111);

	assign dct_done = dct_st2_done;

	always_comb begin
		n_cnt_st2 = cnt_st2;
		if(dct_st2_start || cnt_st2 == 4'b0111) 
			n_cnt_st2 = 0;
		else n_cnt_st2 = cnt_st2 + 1;
	end

	always_comb begin
		for(int i = 0; i < 8;i++) begin
			if(stage2_wr_en) begin
				if(cnt_st2 == i)	st2_wr_en_entry[i] = 1'b1;
				else 				st2_wr_en_entry[i] = 1'b0;
			end
			else 					st2_wr_en_entry[i] = 1'b0;
		end

	end
	always_ff @(posedge clk) begin
		if(rst) stage2_wr_en <= #1 0;
		else 	stage2_wr_en <= #1 next_st2_wr_en;
	end

	always_ff @(posedge clk) begin
		if(rst)	cnt_st2 <= #1 0;
		else if (stage2_wr_en) cnt_st2 <= #1 n_cnt_st2;
	end

	//************************************************************************************************************
	//dct_stage 1 comb
	dct_col_comb #(.SIZE(SIZE_STAGE1),.APPROX_BITS(APPROX_BITS_ST1),.SIZE_MULT(SIZE_STAGE1+6),.SIZE_OUT(SIZE_STAGE2)) dct_st1 (
					.data_in  (data_in),
					.approx_en(approx_en[0]),
					.data_out (data_out_st1));

	//dct_stage1_ff+dct_stage2_comb
	dct_modules_vdd2 #(.SIZE(SIZE_STAGE2),.APPROX_BITS(APPROX_BITS_ST2),.SIZE_OUT(SIZE_OUT))  dct_mod2 (
					.rst      (rst),
					.clk      (clk),
					.wr_en_entry   (wr_en_entry), // all stage 1 dff wr_en
					.approx_en(approx_en[1]),
					.stage2_en(stage2_wr_en),
					.data_in  (data_out_st1),
					.data_out (data_out_st2));

	//level converting flip flop
	dct_stage2_dff #(.SIZE(SIZE_OUT)) lcff0 (
					.clk    (clk),
					.rst    (rst),
					.wr_en  (st2_wr_en_entry),
					.data_in(data_out_st2),
					.data_out(data_out_st2_reg));

	//transpose and truncation by discarding MSBs

	always_comb begin	
		for (int i = 0; i < 8; i++) begin
			for(int j=0; j < 8;j++) begin
				data_out[i][j] = data_out_st2_reg[j][i][SIZE_OUT-2:0];
			end
		end
	end
	 
endmodule // dct_top