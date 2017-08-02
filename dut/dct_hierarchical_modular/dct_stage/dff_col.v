module dff_col #(parameter SIZE = 8)
(
	input clk,rst,wr_en,start,
	input signed [SIZE-1:0] data_in[7:0],
	output logic signed [SIZE-1:0] data_out[7:0],
	output logic done
);

	logic signed [3:0] cnt, n_cnt;
	logic signed [SIZE-1:0] next_data_out [7:0];
	assign done = (cnt == 4'b0111) ;

	//test
	logic [7:0] wr_en_entry;

	always_comb begin
		for (int i = 0; i < 8; i++) begin
			if(wr_en) begin
				if(cnt == i) begin
					wr_en_entry[i] = 1'b1;
				end
				else wr_en_entry[i] = 1'b0;
			end
			else	wr_en_entry[i] = 1'b0;
		end

	end

	always_comb begin
			n_cnt = cnt;
			if(start || cnt == 4'b0111) 
				n_cnt = 0;
			else n_cnt = cnt + 1;
		end

		/*
		always_comb begin
			for (int i = 0; i < 8; i++) begin
				if(cnt == i) begin
					next_data_out[i] = data_in[i];
				end
				else next_data_out[i] = data_out[i];
			end
		end
		*/

		//Update counter and store dct output in flops
		//synopsys sync_set_reset "rst"
		always_ff @(posedge clk) begin
			if(rst) begin
				cnt <= #1 0;
			end 
			else if (wr_en) begin
				cnt <= #1 n_cnt;
			end
		end
	/*
	dff #(.SIZE(SIZE)) dff0 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[0]),.q(data_out[0]));
	dff #(.SIZE(SIZE)) dff1 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[1]),.q(data_out[1]));
	dff #(.SIZE(SIZE)) dff2 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[2]),.q(data_out[2]));
	dff #(.SIZE(SIZE)) dff3 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[3]),.q(data_out[3]));
	dff #(.SIZE(SIZE)) dff4 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[4]),.q(data_out[4]));
	dff #(.SIZE(SIZE)) dff5 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[5]),.q(data_out[5]));
	dff #(.SIZE(SIZE)) dff6 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[6]),.q(data_out[6]));
	dff #(.SIZE(SIZE)) dff7 (.clk(clk),.rst(rst),.wr_en(wr_en),.d(next_data_out[7]),.q(data_out[7]));
	*/
	dff #(.SIZE(SIZE)) dff0 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[0]),.d(data_in[0]),.q(data_out[0]));
	dff #(.SIZE(SIZE)) dff1 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[1]),.d(data_in[1]),.q(data_out[1]));
	dff #(.SIZE(SIZE)) dff2 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[2]),.d(data_in[2]),.q(data_out[2]));
	dff #(.SIZE(SIZE)) dff3 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[3]),.d(data_in[3]),.q(data_out[3]));
	dff #(.SIZE(SIZE)) dff4 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[4]),.d(data_in[4]),.q(data_out[4]));
	dff #(.SIZE(SIZE)) dff5 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[5]),.d(data_in[5]),.q(data_out[5]));
	dff #(.SIZE(SIZE)) dff6 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[6]),.d(data_in[6]),.q(data_out[6]));
	dff #(.SIZE(SIZE)) dff7 (.clk(clk),.rst(rst),.wr_en(wr_en_entry[7]),.d(data_in[7]),.q(data_out[7]));

endmodule