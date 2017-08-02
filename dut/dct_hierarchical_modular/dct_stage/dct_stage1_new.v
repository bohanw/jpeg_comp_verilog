
module dct_stage1 #(parameter SIZE = 8, APPROX_BITS = 0,SIZE_MULT = SIZE+6,SIZE_OUT = SIZE+2)(
	input signed [SIZE-1:0] data_in [7:0],
	input signed dct_en, //dct_start signal
	input approx_en,clk,rst,
	output logic signed [SIZE_OUT-1:0] data_out [7:0][7:0],
	output logic dct_stage_done
);


	//counter, enable and all control sigals and FFs
	parameter DIM = 8;

	logic signed [SIZE_OUT-1:0] data_out_col [7:0];
	logic signed [3:0] col_cnt, n_col_cnt;
	logic wr_en,wr_en_disable;
	logic  done_col; // Not necessary
	assign dct_stage_done = done_col &&( col_cnt == 4'b0111);

	always_comb begin
		n_col_cnt = col_cnt;
		if(dct_en) begin
			if(col_cnt == 4'b0111  || col_cnt == 4'b1000 ) 
				 n_col_cnt = 4'b0;
			else 
				 n_col_cnt = col_cnt + 1;
		end 

	end

	always_comb begin
		wr_en = 0;
		if(col_cnt != 4'b1000) begin
			wr_en = 1'b1;
			if(wr_en_disable) wr_en = 1'b0;
		end
	end

	//synopsys sync_set_reset "rst"
	always_ff @(posedge clk) begin
		if(rst) wr_en_disable <= #1 0;
		else begin
			if(dct_stage_done)
				wr_en_disable <= #1 1'b1;
		end

	end
	//synopsys sync_set_reset "rst"
	always_ff @(posedge clk) begin
		if(rst)	col_cnt <= #1 4'b1000;
		else    col_cnt <= #1 n_col_cnt;

	end
	//Control logic for wr_en bus
	
	dct_col #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col0 (.clk      (clk),
					 .rst      (rst), 
					 .data_in  (data_in), 
					 .start(dct_en),
					 .wr_en(wr_en),
					 .approx_en(approx_en),
					 .data_out(data_out_col),
					 .done(done_col));

	always_comb begin
		case (col_cnt)
			4'd0: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[0][i] = data_out_col[i];
						end	
					end
				  end
			4'd1: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[1][i] = data_out_col[i];
						end	
					end
				  end
		    4'd2: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[2][i] = data_out_col[i];
						end	
					end
		    	  end
		    4'd3: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[3][i] = data_out_col[i];
						end	
					end
		    	  end
		    4'd4: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[4][i] = data_out_col[i];
						end	
					end
		    	  end	
		    4'd5: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[5][i] = data_out_col[i];
						end	
					end
		    	  end
		    4'd6: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[6][i] = data_out_col[i];
						end	
					end
		    	  end
		    4'd7: begin
					if(done_col) begin
						for (int i = 0; i < 8; i++) begin
								/* code */
							data_out[7][i] = data_out_col[i];
						end	
					end
		    	  end		    		    	  
			default: begin
				for (int i = 0; i < 8; i++) begin
					/* code */
					for (int j = 0; j < 8; j++) begin
						/* code */
						data_out[i][j] = 0;
					end
				end
			end
		endcase

	end
endmodule
