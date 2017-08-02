//Single 8x8 blockiteration of random generated pixel number for power evaluation
module dut;
	logic signed  [7:0]data_in[7:0];
	logic clk,rst,dct_en;

	logic [1:0] approx_en;
	logic signed [10:0] data_out [7:0] [7:0] ;

	logic dct_done;

	
	logic [3:0] cnt,n_cnt,cycle_cnt, n_cycle_cnt;

	always #10 clk = ~clk;

	always @(posedge clk) begin
		if(rst) cycle_cnt <=0;
		else cycle_cnt <= n_cycle_cnt;
	end
	assign approx_en = 2'b11;
	assign n_cycle_cnt = (cycle_cnt == 4'b0111 ) ? 0 :cycle_cnt + 1;
	assign n_cnt =   cnt + 1;
	assign dct_en = (cycle_cnt == 4'b0111) && (cnt <= 4'b0111) ;
	always @(posedge clk) begin
		if(rst ) cnt<= 4'b0;
		else if(dct_en) 
			cnt <= n_cnt;
		else cnt <= cnt;
	end
	always #10 clk = ~clk;

//post_synth sim 
//initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/syn/dct_col_comb.syn.sdf", dct_inst.dct_st1 );
//initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/syn/dct_modules_vdd2.syn.sdf",dct_inst.dct_mod2 );
//initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/syn/dct_stage2_dff.syn.sdf", dct_inst.lcff0 );
//initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/syn/dct_top.syn.sdf", dct_inst );

	initial begin
		$dumpfile("test.vcd");
		$dumpvars();
		clk = 0;
		rst = 1;

		for(int i=0;i<8;i++) begin
			data_in[i] = 0;
		end
		@(negedge clk);
		rst = 0;
		for(int i=0;i<8;i++) begin
			data_in[i] = ($random)% 128;
		end


		#1000;
		$finish;

	end

	initial begin
		forever @(negedge dct_en) begin
			for(int i=0;i<8;i++) begin
			data_in[i] = ($random)% 128;
			end
		end

	end

dct_top dct_inst(.data_in  (data_in),.clk      (clk),
		.rst      (rst),.dct_en   (dct_en),
		.approx_en(approx_en),
		.data_out (data_out),
		.dct_done (dct_done));

endmodule
