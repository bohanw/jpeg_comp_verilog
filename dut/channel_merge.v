module channel_merge
  (input logic [31:0] y_jpeg,cb_jpeg,cr_jpeg,
   input logic y_valid,cb_valid,cr_valid,
   input logic clk,img_rst,
   output logic [31:0] jpeg_bitstream,
   output logic [1:0] data_valid);


logic [1:0] mux_sel, mux_sel_1;
logic y_read_req,cb_read_req,cr_read_req;
logic y_read_ok,cb_read_ok,cr_read_ok;
logic [31:0] y_fifo_out,cb_fifo_out,cr_fifo_out;




always_ff @(posedge clk)
begin
  if (img_rst)
    mux_sel <= 2'b01;
  else if (mux_sel == 2'b11)
    mux_sel <= 2'b01;
  else
    mux_sel <= mux_sel+1;
end

always_ff @(posedge clk)
begin
  if (img_rst)
    mux_sel_1 <= 2'b11;
  else
    mux_sel_1 <= mux_sel; //delayed version of mux_sel
end



always_comb
begin
  case(mux_sel)
    1 : begin 
          y_read_req = 1'b1; 
          cb_read_req = 1'b0;
          cr_read_req = 1'b0; end
    2 : begin 
          y_read_req = 1'b0; 
          cb_read_req = 1'b1;
          cr_read_req = 1'b0; end
    3 : begin 
          y_read_req = 1'b0; 
          cb_read_req = 1'b0;
          cr_read_req = 1'b1; end
    default : begin 
          y_read_req = 1'b0; 
          cb_read_req = 1'b0;
          cr_read_req = 1'b0; end
  endcase            
end


//////////////////NOTE
//In the test bench when we latch the data, 
//if data_valid = 1 => y channel
///if data_valid = 2 => cb channel
///if data_valid = 3 => cr channel
///////////////////

always_comb
begin
  case(mux_sel_1)
    1 : begin
         jpeg_bitstream = y_fifo_out;
         data_valid = ({y_read_ok,y_read_ok}) & mux_sel_1; end
    2 : begin
         jpeg_bitstream = cb_fifo_out;
         data_valid = ({cb_read_ok,cb_read_ok}) & mux_sel_1; end
    3 : begin
         jpeg_bitstream = cr_fifo_out;
         data_valid = ({cr_read_ok,cr_read_ok}) & mux_sel_1; end
    default : begin
         jpeg_bitstream = 0;
         data_valid = 2'b00; end
  endcase  
end


sync_fifo sync_fifo_y_inst(
  .clk(clk),
  .img_rst(img_rst),
  .jpeg_in(y_jpeg),
  .write_req(y_valid),
  .read_req(y_read_req),
  .read_ok(y_read_ok),
  .jpeg_out(y_fifo_out));

sync_fifo sync_fifo_cb_inst(
  .clk(clk),
  .img_rst(img_rst),
  .jpeg_in(cb_jpeg),
  .write_req(cb_valid),
  .read_req(cb_read_req),
  .read_ok(cb_read_ok),
  .jpeg_out(cb_fifo_out));

sync_fifo sync_fifo_cr_inst(
  .clk(clk),
  .img_rst(img_rst),
  .jpeg_in(cr_jpeg),
  .write_req(cr_valid),
  .read_req(cr_read_req),
  .read_ok(cr_read_ok),
  .jpeg_out(cr_fifo_out));

endmodule
