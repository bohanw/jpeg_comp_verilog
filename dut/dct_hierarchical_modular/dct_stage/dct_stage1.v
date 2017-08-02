
// Latest DCT stage 1,
// Seperate arithmetic modules and flip flops
module dct_stage1 #(parameter SIZE = 8, APPROX_BITS = 6,SIZE_MULT = SIZE+6,SIZE_OUT = SIZE+2)(
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
	logic [7:0] wr_en,wr_en_disable;
	logic  [7:0] done_cols; // Not necessary
	assign dct_stage_done = done_cols[7];//done_col &&( col_cnt == 4'b0111);

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
		wr_en = 8'b00000000;
		case(col_cnt)
			4'd0:   begin wr_en[0] = 1'b1;	  
						if(wr_en_disable[0]) wr_en[0] = 1'b0;
					end
			4'd1:   begin wr_en[1] = 1'b1;
						if(wr_en_disable[1]) wr_en[1] = 1'b0;
					end
			4'd2:  	begin wr_en[2] = 1'b1;
						if(wr_en_disable[2]) wr_en[2] = 1'b0;
					end
			4'd3:   begin 
						wr_en[3] = 1'b1;
						if(wr_en_disable[3]) wr_en[3] = 1'b0;
					end
			4'd4:   begin wr_en[4] = 1'b1;
						if(wr_en_disable[4]) wr_en[4] = 1'b0;
					end
			4'd5:   begin wr_en[5] = 1'b1;
						if(wr_en_disable[5]) wr_en[5] = 1'b0;
					end
			4'd6:   begin wr_en[6] = 1'b1;
						if(wr_en_disable[6]) wr_en[6] = 1'b0;
					end
			4'd7:   begin 
						wr_en[7] = 1'b1;
						if(wr_en_disable[7]) wr_en[7] = 1'b0;
					end
			default: wr_en = 8'b00000000;
		endcase
	end

	//Disable wr_en signal when column done is raised
	//synopsys sync_set_reset "rst"
	always_ff @(posedge clk) begin
		if(rst) wr_en_disable <= #1 8'b0;
		else begin
			for (int i = 0; i < 8; i++) begin
				if(done_cols[i]) begin
					wr_en_disable[i] <= #1 1'b1;
					if(i > 0) wr_en_disable[i-1] <= #1 1'b0;
				end
			end

		end

	end


	//synopsys sync_set_reset "rst"
	always_ff @(posedge clk) begin
		if(rst)	col_cnt <= #1 4'b1000;
		else    col_cnt <= #1 n_col_cnt;

	end
	//Control logic for wr_en bus
	
	dct_col_comb #(.SIZE(SIZE),.APPROX_BITS(APPROX_BITS),.SIZE_MULT(SIZE_MULT),.SIZE_OUT(SIZE_OUT)) col0 (
					 .data_in  (data_in), 
					 .approx_en(approx_en),
					 .data_out(data_out_col));

	dff_col #(.SIZE(SIZE_OUT)) dff_col0 (.clk     (clk),
										.rst     (rst),
										.start   (dct_en),
										.wr_en   (wr_en[0]),
										.data_in (data_out_col),
										.data_out(data_out[0]),
										.done(done_cols[0]));

		dff_col #(.SIZE(SIZE_OUT)) dff_col1 (.clk     (clk),
										.rst     (rst),
										.wr_en   (wr_en[1]),
										.start   (dct_en),
										.data_in (data_out_col),
										.data_out(data_out[1]),
										.done(done_cols[1]));
		dff_col #(.SIZE(SIZE_OUT)) dff_col2 (.clk     (clk),
										.rst     (rst),
										.wr_en   (wr_en[2]),
										.start   (dct_en),
										.data_in (data_out_col),
										.data_out(data_out[2]),
										.done(done_cols[2]));
		dff_col #(.SIZE(SIZE_OUT)) dff_col3 (.clk     (clk),
										.rst     (rst),
										.start   (dct_en),
										.wr_en   (wr_en[3]),
										.data_in (data_out_col),
										.data_out(data_out[3]),
										.done(done_cols[3]));
		dff_col #(.SIZE(SIZE_OUT)) dff_col4 (.clk     (clk),
										.rst     (rst),
										.start   (dct_en),
										.wr_en   (wr_en[4]),
										.data_in (data_out_col),
										.data_out(data_out[4]),
										.done(done_cols[4]));
		dff_col #(.SIZE(SIZE_OUT)) dff_col5 (.clk     (clk),
										.rst     (rst),
										.start   (dct_en),
										.wr_en   (wr_en[5]),
										.data_in (data_out_col),
										.data_out(data_out[5]),
										.done(done_cols[5]));
		dff_col #(.SIZE(SIZE_OUT)) dff_col6 (.clk     (clk),
										.rst     (rst),
										.start   (dct_en),
										.wr_en   (wr_en[6]),
										.data_in (data_out_col),
										.data_out(data_out[6]),
										.done(done_cols[6]));
		dff_col #(.SIZE(SIZE_OUT)) dff_col7 (.clk     (clk),
										.rst     (rst),
										.start   (dct_en),
										.wr_en   (wr_en[7]),
										.data_in (data_out_col),
										.data_out(data_out[7]),
										.done(done_cols[7]));

	
endmodule
