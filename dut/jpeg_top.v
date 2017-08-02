module jpeg_top
  (input logic [23:0] rgb_pixel,
   input clk,rst,
   input [1:0] apprx,
   output [31:0] jpeg_bitstream,
   output [1:0] data_valid);


logic eob,eob_1,en_rgb2ycbcr, pingpong_en, dct_en;
logic [23:0] rgb_in, ycbcr_pixel;
logic [6:0] pixel_count;

logic [23:0] channel_column_input[7:0];

logic signed [7:0] dct_y_in[7:0];
logic signed [7:0] dct_cb_in[7:0];
logic signed [7:0] dct_cr_in[7:0];

logic [31:0] y_jpeg,cb_jpeg,cr_jpeg;
logic y_valid,cb_valid,cr_valid;

typedef logic unpacked_type [23:0];
typedef logic signed [7:0] packed_type;
logic [23:0] row_0;
logic [23:0] row_1;
logic [23:0] row_2;
logic [23:0] row_3;
logic [23:0] row_4;
logic [23:0] row_5;
logic [23:0] row_6;
logic [23:0] row_7;

logic img_rst;

assign eob = (pixel_count==7'd64);
assign en_rgb2ycbcr = ~(eob_1); 

always_ff @(posedge rst or posedge clk) //check whether it works after syn change todo pradeep
begin
  if (clk)
    img_rst <= 1'b0;
  else
    img_rst <= 1'b1;
end


always_ff @(posedge clk)
begin
  if (rst) begin
    eob_1 <= 1'b1;
  end else begin
    eob_1 <= eob;
 end   
end
 

always_ff @(posedge clk)
begin
  if (rst) begin
    rgb_in      <= 0;
    pixel_count <= 0;
  end else if (~eob) begin
    rgb_in <= rgb_pixel;
    pixel_count <= pixel_count+1;
  end   
end
 

//rgb2ycbcr rgb2ycbcr_inst(
//  .clk(clk),
//  .rst(rst),
//  .enable(en_rgb2ycbcr),
//  .data_in(rgb_in),
//  .data_out(ycbcr_pixel),
//  .enable_out(pingpong_en));
//
//pingpongFFs pingpongFFs_inst(
//  .clk(clk),
//  .rst(rst),
//  .enable(pingpong_en),
//  .data_in(ycbcr_pixel),
//  .data_out(channel_column_input),
//  .dct_en(dct_en));

rgb2ycbcr_pp rgb2ycbcr_pp_inst(
  .clk(clk),
  .rst(rst),
  .enable(en_rgb2ycbcr),
  .data_in(rgb_in),
  .data_out(channel_column_input),
  .enable_out(dct_en));




assign row_0 =  channel_column_input[0];
assign row_1 =  channel_column_input[1];
assign row_2 =  channel_column_input[2];
assign row_3 =  channel_column_input[3];
assign row_4 =  channel_column_input[4];
assign row_5 =  channel_column_input[5];
assign row_6 =  channel_column_input[6];
assign row_7 =  channel_column_input[7];


always_comb
begin
    dct_y_in[0] = row_0[7:0]; //not sure if this is right todo pradeep
    dct_cb_in[0] = row_0[15:8];
    dct_cr_in[0] = row_0[23:16];

    dct_y_in[1] = row_1[7:0]; 
    dct_cb_in[1] = row_1[15:8];
    dct_cr_in[1] = row_1[23:16];

    dct_y_in[2] = row_2[7:0]; 
    dct_cb_in[2] = row_2[15:8];
    dct_cr_in[2] = row_2[23:16];

    dct_y_in[3] = row_3[7:0]; 
    dct_cb_in[3] = row_3[15:8];
    dct_cr_in[3] = row_3[23:16];

    dct_y_in[4] = row_4[7:0]; 
    dct_cb_in[4] = row_4[15:8];
    dct_cr_in[4] = row_4[23:16];

    dct_y_in[5] = row_5[7:0]; 
    dct_cb_in[5] = row_5[15:8];
    dct_cr_in[5] = row_5[23:16];

    dct_y_in[6] = row_6[7:0]; 
    dct_cb_in[6] = row_6[15:8];
    dct_cr_in[6] = row_6[23:16];

    dct_y_in[7] = row_7[7:0]; 
    dct_cb_in[7] = row_7[15:8];
    dct_cr_in[7] = row_7[23:16];

end


//todo pradeep change these in a way diff quant_matrix and huff table could be used
//for each channel without writing seperate files
channel_top channel_top_y_inst(
  .clk(clk),
  .rst(rst),
  .img_rst(img_rst),
  .input_clm(dct_y_in),
  .dct_en(dct_en),
  .apprx(apprx),
  .jpeg_bitstream(y_jpeg),
  .data_valid(y_valid));

channel_top channel_top_cb_inst(
  .clk(clk),
  .rst(rst),
  .img_rst(img_rst),
  .input_clm(dct_cb_in),
  .dct_en(dct_en),
  .apprx(apprx),
  .jpeg_bitstream(cb_jpeg),
  .data_valid(cb_valid));


channel_top channel_top_cr_inst(
  .clk(clk),
  .rst(rst),
  .img_rst(img_rst),
  .input_clm(dct_cr_in),
  .dct_en(dct_en),
  .apprx(apprx),
  .jpeg_bitstream(cr_jpeg),
  .data_valid(cr_valid));


channel_merge channel_merge_inst(
  .y_jpeg(y_jpeg),
  .cb_jpeg(cb_jpeg),
  .cr_jpeg(cr_jpeg),
  .y_valid(y_valid),
  .cb_valid(cb_valid),
  .cr_valid(cr_valid),
  .clk(clk),
  .img_rst(img_rst),
  .jpeg_bitstream(jpeg_bitstream),
  .data_valid(data_valid));

endmodule
  

  

    

  
