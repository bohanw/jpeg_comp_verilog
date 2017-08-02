module jpeg_tb;

localparam SIZE_INPUT = 1024; //find this size by executing wc -l red_hex.txt (this is in matlab_files directory)
localparam SIZE_OUTPUT = SIZE_INPUT*10;
localparam EXTRA_DELAY = 7'd40;
integer i, fid;

logic unsigned [7:0] red_array[SIZE_INPUT-1:0];
logic unsigned [7:0] green_array[SIZE_INPUT-1:0];
logic unsigned [7:0] blue_array[SIZE_INPUT-1:0];

typedef logic unpacked_type [31:0];

logic clk, gate_clk, rst, rst_int, rst_dut, img_rst;
logic [23:0] rgb_pixel;
logic [1:0] apprx;
logic [31:0] jpeg_bitstream;
logic jpeg_bitstream_flipped[0:31];
logic [1:0] data_valid;

logic [6:0] pixel_count;
logic [6:0] buffer_count;
logic allow_block, started, write_to_file;

logic [50:0] y_index,cb_index,cr_index;
logic  y_compressed_array[0:SIZE_OUTPUT-1];
logic cb_compressed_array[0:SIZE_OUTPUT-1];
logic cr_compressed_array[0:SIZE_OUTPUT-1];


always_comb
begin
  jpeg_bitstream_flipped[0:31] = unpacked_type'(jpeg_bitstream);
end

//************Assign enable approx control*****
assign apprx = 2'b00;
//*********************************************

initial $readmemh("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/matlab_files/red_hex.txt",red_array);
initial $readmemh("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/matlab_files/green_hex.txt",green_array);
initial $readmemh("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/matlab_files/blue_hex.txt",blue_array);

//SDF annotation

`ifdef SYN
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/syn/dct_col_comb.syn.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst.dct_st1 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/syn/dct_col_comb.syn.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst.dct_st1 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/syn/dct_col_comb.syn.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst.dct_st1 );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/syn/dct_modules_vdd2.syn.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst.dct_mod2 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/syn/dct_modules_vdd2.syn.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst.dct_mod2 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/syn/dct_modules_vdd2.syn.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst.dct_mod2 );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/syn/dct_stage2_dff.syn.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst.lcff0 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/syn/dct_stage2_dff.syn.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst.lcff0 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/syn/dct_stage2_dff.syn.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst.lcff0 );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/syn/dct_top.syn.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/syn/dct_top.syn.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/syn/dct_top.syn.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_top_syn_apr/syn/channel_top.syn.sdf", jpeg_top_inst.channel_top_y_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_top_syn_apr/syn/channel_top.syn.sdf", jpeg_top_inst.channel_top_cb_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_top_syn_apr/syn/channel_top.syn.sdf", jpeg_top_inst.channel_top_cr_inst );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/rgb2ycbcr_pp_syn_apr/syn/rgb2ycbcr_pp.syn.sdf", jpeg_top_inst.rgb2ycbcr_pp_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_merge_syn_apr/syn/channel_merge.syn.sdf", jpeg_top_inst.channel_merge_inst );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/jpeg_top_syn_apr/syn/jpeg_top.syn.sdf", jpeg_top_inst);
`endif


`ifdef APR
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/apr/dct_col_comb.apr.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst.dct_st1 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/apr/dct_col_comb.apr.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst.dct_st1 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_col_comb_syn_apr/apr/dct_col_comb.apr.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst.dct_st1 );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/apr/dct_modules_vdd2.apr.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst.dct_mod2 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/apr/dct_modules_vdd2.apr.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst.dct_mod2 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_modules_vdd2_syn_apr/apr/dct_modules_vdd2.apr.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst.dct_mod2 );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/apr/dct_stage2_dff.apr.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst.lcff0 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/apr/dct_stage2_dff.apr.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst.lcff0 );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_stage2_dff_syn_apr/apr/dct_stage2_dff.apr.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst.lcff0 );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/apr/dct_top.apr.sdf", jpeg_top_inst.channel_top_y_inst.dct_top_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/apr/dct_top.apr.sdf", jpeg_top_inst.channel_top_cb_inst.dct_top_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dct_top_syn_apr/apr/dct_top.apr.sdf", jpeg_top_inst.channel_top_cr_inst.dct_top_inst );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_top_syn_apr/apr/channel_top.apr.sdf", jpeg_top_inst.channel_top_y_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_top_syn_apr/apr/channel_top.apr.sdf", jpeg_top_inst.channel_top_cb_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_top_syn_apr/apr/channel_top.apr.sdf", jpeg_top_inst.channel_top_cr_inst );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/rgb2ycbcr_pp_syn_apr/apr/rgb2ycbcr_pp.apr.sdf", jpeg_top_inst.rgb2ycbcr_pp_inst );
initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/channel_merge_syn_apr/apr/channel_merge.apr.sdf", jpeg_top_inst.channel_merge_inst );

initial $sdf_annotate("/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/jpeg_top_syn_apr/apr/jpeg_top.apr.sdf", jpeg_top_inst);
`endif


task toggle;
  #10 clk = ~clk;
endtask



initial
begin
  clk=1;
  started=0;
  #31 started=1; //this delay should match with just after 2nd posedge
//  #211 started=1;  //x debug
end

initial
begin
  gate_clk=1;
  #31 gate_clk=0;
end

initial
begin
  img_rst=0;
  #11 img_rst=1; //to make sure we incorporate clk-q delay which is important for this specific functionality
  #20 img_rst=0;
 // #200 img_rst=0;  //x debug
end

initial 
begin
  $dumpfile("/tmp/bohanw/jpeg_top_accu.vcd");
  $dumpvars();
  forever @(posedge write_to_file) begin
      #10000; //delay to allow the last set of outputs from DUT to be stored
      fid= $fopen("./y_compressed.txt","w");
      for (int tmp_index=0; tmp_index<y_index; tmp_index=tmp_index+1) begin
        $fwrite(fid,"%b\n", y_compressed_array[tmp_index]); end
      $fclose(fid);

      fid= $fopen("./cb_compressed.txt","w");
      for (int tmp_index=0; tmp_index<cb_index; tmp_index=tmp_index+1) begin
        $fwrite(fid,"%b\n", cb_compressed_array[tmp_index]); end
      $fclose(fid);

      fid= $fopen("./cr_compressed.txt","w");
      for (int tmp_index=0; tmp_index<cr_index; tmp_index=tmp_index+1) begin
        $fwrite(fid,"%b\n", cr_compressed_array[tmp_index]); end
      $fclose(fid);

      $finish; 
  end
end
    

initial begin
  rgb_pixel = 0;
forever @(posedge clk) begin
if (rst) begin
  rgb_pixel <= #1 0;
  pixel_count <= #1 0;
  buffer_count <= #1 0;
  if (~started) begin
    i <= #1 0;
  write_to_file <= #1 1'b0; end
end else if (allow_block) begin
  if (i<SIZE_INPUT) begin
    pixel_count<= #1 pixel_count+1;
    rgb_pixel[7:0]   <= #1 red_array[i];
    rgb_pixel[15:8]  <= #1 green_array[i];
    rgb_pixel[23:16] <= #1 blue_array[i];
    i <= #1 i+1;
  end else begin
    write_to_file <= #1 1'b1;
  end
end else if (i==SIZE_INPUT)
    write_to_file <= #1 1'b1;
else 
  buffer_count <= #1 buffer_count+1;
end end

assign allow_block = ~(pixel_count==7'd64);
assign rst = (started ? ((i<(SIZE_INPUT)) ? (buffer_count==EXTRA_DELAY) : 1'b0) : img_rst);

    
always
begin
  #10 clk = ~clk;
end    

initial
begin
  rst_int = 0;
 #1;
forever @(rst) begin
 #20 rst_int = rst;
//   #200 rst_int = rst; //x debug
end
end

assign rst_dut = (~rst) & rst_int;

//assign clk_dut = gate_clk | clk;
assign clk_dut = clk;

jpeg_top jpeg_top_inst(
  .rgb_pixel(rgb_pixel),
  .clk(clk_dut),
  .rst(rst_dut),
  .apprx(apprx),
  .jpeg_bitstream(jpeg_bitstream),
  .data_valid(data_valid));


always_ff @(negedge clk)
begin
  if (img_rst) begin
    if (~started) begin
      y_index <= #1 0;
      y_compressed_array<= #1  '{(SIZE_OUTPUT){1'b0}};
      cb_index <=#1  0;
      cb_compressed_array<=#1 '{(SIZE_OUTPUT){1'b0}};
      cr_index <=#1  0;
      cr_compressed_array<= #1 '{(SIZE_OUTPUT){1'b0}};
     end
  end else if (|data_valid) begin
    case (data_valid)
      2'b01: begin 
        y_compressed_array[y_index +:32] <= #1 jpeg_bitstream_flipped; //NOTE the order reversal
        y_index <= #1 y_index+32; end 
      2'b10: begin 
        cb_compressed_array[cb_index +: 32] <= #1 jpeg_bitstream_flipped; //NOTE the order reversal
        cb_index <= #1 cb_index+32; end 
      2'b11: begin 
        cr_compressed_array[cr_index +: 32] <=#1  jpeg_bitstream_flipped; //NOTE the order reversal
        cr_index <= #1 cr_index+32; end 
      default : begin end 
    endcase
  end
end







endmodule

