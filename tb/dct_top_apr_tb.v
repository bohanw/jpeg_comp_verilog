//Single 8x8 blockiteration of random generated pixel number for power evaluation
module dut;
	logic signed  [63:0]data_in;
	logic clk,rst,dct_en;

	logic [1:0] approx_en;
	logic signed [703:0] data_out;

	logic dct_done;

	
	logic [3:0] cnt,n_cnt,cycle_cnt, n_cycle_cnt;

	always #5  clk = ~clk;

	always @(posedge clk) begin
		if(rst) cycle_cnt <=#3 0;
		else cycle_cnt <= #3 n_cycle_cnt;
	end
	assign approx_en = 2'b00;
	assign n_cycle_cnt = (cycle_cnt == 4'b0111 ) ? 0 :cycle_cnt + 1;
	assign n_cnt =   cnt + 1;
	assign dct_en = (cycle_cnt == 4'b0111) && (cnt <= 4'b0111) ;
	always @(posedge clk) begin
		if(rst ) cnt<= #3 4'b0;
		else if(dct_en) 
			cnt <= #3 n_cnt;
		else cnt <= #3 cnt;
	end

//post_synth sim 


/*`ifdef SYN
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/syn/dct_col_comb.syn.sdf", dct_top_inst.dct_st1 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/syn/dct_modules_vdd2.syn.sdf",dct_top_inst.dct_mod2 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/syn/dct_stage2_dff.syn.sdf", dct_top_inst.lcff0 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/syn/dct_top.syn.sdf", dct_top_inst );
`endif

*/

`ifdef APR
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/apr/dct_col_comb.apr.sdf", dct_top_inst.dct_st1 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/apr/dct_modules_vdd2.apr.sdf",dct_top_inst.dct_mod2 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/apr/dct_stage2_dff.apr.sdf", dct_top_inst.lcff0 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_ar/apr/dct_top.apr.sdf", dct_top_inst );

`endif 

	initial begin
		$dumpfile("dct_top_final.vcd");
		$dumpvars();
		clk = 1;
		rst = 1;
		data_in = 0;
		@(negedge clk);
		@(negedge clk);
		rst = 0;
		data_in[7:0] = 10;//($random)% 128;
		data_in[15:8] = 20;//($random)% 128;
		data_in[23:16] = 30;//($random)% 128;
		data_in[31:24] = 40;//($random)% 128;
		data_in[39:32] = 50;//($random)% 128;
		data_in[47:40] = -60;//($random)% 128;
		data_in[55:48] =70;// ($random)% 128;
		data_in[63:56] = 5;//($random)% 128;

		#850;
		$finish;
		end

	initial begin
		forever @(negedge dct_en) begin
			/*
			data_in[7:0] = ($random)% 128;
			data_in[15:8] = ($random)% 128;
			data_in[23:16] = ($random)% 128;
			data_in[31:24] = ($random)% 128;
			data_in[39:32] = ($random)% 128;
			data_in[47:40] = ($random)% 128;
			data_in[55:48] = ($random)% 128;
			data_in[63:56] = ($random)% 128;
			*/
		data_in[7:0] = 5;//($random)% 128;
		data_in[15:8] = 20;//($random)% 128;
		data_in[23:16] = 30;//($random)% 128;
		data_in[31:24] = 40;//($random)% 128;
		data_in[39:32] = 50;//($random)% 128;
		data_in[47:40] = -60;//($random)% 128;
		data_in[55:48] =70;// ($random)% 128;
		data_in[63:56] = 5;//($random)% 128;
		end

	end

	
dct_top dct_top_inst(.data_in  (data_in),.clk      (clk),
		.rst      (rst),.dct_en   (dct_en),
		.approx_en(approx_en),
		.data_out (data_out),
		.dct_done (dct_done));

endmodule
