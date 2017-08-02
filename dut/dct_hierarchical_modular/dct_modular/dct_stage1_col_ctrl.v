module dct_stage1_col_ctrl (
	input clk,rst,start,wr_en_col,
	output logic col_done,
	output logic [7:0] wr_en_entry);

	logic signed [3:0] cnt, n_cnt;

	assign col_done = (cnt == 4'b0111);

		always_comb begin
			n_cnt = cnt;
			if(start || cnt == 4'b0111) 
				n_cnt = 0;
			else n_cnt = cnt + 1;
		end

		always_comb begin
			for (int i = 0; i < 8; i++) begin
				if(wr_en_col) begin
					if(cnt == i) begin
						 wr_en_entry[i] = 1'b1;
					end
					else wr_en_entry[i] = 1'b0;
				end
				else	 wr_en_entry[i] = 1'b0;
			end
		end

		//synopsys sync_set_reset "rst"
		always_ff @(posedge clk) begin
			if(rst) begin
				cnt <= #1 0;
			end 
			else if (wr_en_col) begin
				cnt <= #1 n_cnt;
			end
		end


endmodule // dct_stage1_col_ctrl