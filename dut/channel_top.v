module channel_top
  (input logic signed [7:0] input_clm[7:0],
   input logic dct_en,
   input logic clk,rst, img_rst,
   input [1:0] apprx,
   output logic [31:0] jpeg_bitstream,
   output logic data_valid);

//DCT parameters
parameter SIZE = 8, APPROX_BITS_ST1 = 6, APPROX_BITS_ST2 = 8,SIZE_MULT = SIZE+6,SIZE_OUT = SIZE+2, SIZE_FINAL = SIZE+4;


logic signed [10:0] dct_out_block[7:0][7:0]; 
//logic signed [13:0] dct_out_block_int[7:0][7:0]; 

logic dct_complete, enable_huff_block;
logic signed [10:0] zz_out; 
logic signed [11:0] dpcm;

//commented by pradeep to make it compile thru and run top level checks

dct_top dct_top_inst(
  .data_in(input_clm),
  .dct_en(dct_en),
 .data_out(dct_out_block),
  //  .data_out(dct_out_block_int),
  .dct_done(dct_complete),
  .clk(clk),
  .rst(rst),
  .approx_en(apprx));


//todo remove later pradeep bohan
//Bohan:REMOVE after matched bit width 3/7
/*
always_comb 
begin
     for (int i = 0; i < 8; i++) begin    
      for(int j=0; j < 8;j++) begin
        dct_out_block[i][j] = dct_out_block_int[i][j][10:0];
      end
    end
end
*/



quantizer_zig_zag_dpcm quantizer_zig_zag_dpcm_inst(
  .quant_in(dct_out_block),
  .clk(clk),
  .img_rst(img_rst),
  .block_rdy_pulse(dct_complete),
  .enable_huff_block(enable_huff_block),
  .zz_out(zz_out),
  .dpcm(dpcm));

huffman_coding huffman_coding_inst(
  .ac_input(zz_out),
  .dc_input(dpcm),
  .enable(enable_huff_block),
  .clk(clk),
  .img_rst(img_rst),
  .jpeg_bitstream(jpeg_bitstream),
  .dataready(data_valid));



endmodule
