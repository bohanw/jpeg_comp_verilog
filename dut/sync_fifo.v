module sync_fifo
  (input logic clk,img_rst,
   input logic [31:0] jpeg_in,
   input logic write_req,
   input logic read_req,
   output logic read_ok,
   output logic [31:0] jpeg_out);

 localparam FIFO_DEPTH=8;
 localparam PTR_WIDTH=4;

logic fifo_full,fifo_empty,wrptr_msb,rdptr_msb;
logic [31:0] fifo[FIFO_DEPTH-1:0]; //fifo with depth = fifo_depth and each location being 32 bit
logic [PTR_WIDTH-1:0] wrptr,rdptr, past_rdptr;
logic [PTR_WIDTH-2:0] wrptr_lsb,rdptr_lsb,past_rdptr_lsb;
logic error_pulse; //only for debug , to be removed todo pradeep


assign rdptr = past_rdptr+1; 
assign rdptr_lsb = rdptr[PTR_WIDTH-2:0];
assign past_rdptr_lsb = past_rdptr[PTR_WIDTH-2:0];
assign wrptr_lsb = wrptr[PTR_WIDTH-2:0];
assign rdptr_msb = rdptr[PTR_WIDTH-1];
assign wrptr_msb = wrptr[PTR_WIDTH-1];



assign fifo_full  = (rdptr_lsb==wrptr_lsb) && (wrptr_msb != rdptr_msb);
assign fifo_empty = (rdptr_lsb==wrptr_lsb) && (wrptr_msb == rdptr_msb);
assign jpeg_out = fifo[past_rdptr_lsb]; //check if this works todo pradeep


always_ff @(posedge clk)
begin
  if (img_rst) begin
    for (int i=0; i< FIFO_DEPTH; i++) begin
      fifo[i] <= 0;
    end
    wrptr <= 0;
    error_pulse <= 0;
  end else begin
    if ((write_req)&&(fifo_full))
      error_pulse <= 1'b1;
    else if (write_req) begin
      fifo[wrptr_lsb] <= jpeg_in;
      wrptr <= wrptr+1;
    end
  end    
end

always_ff @(posedge clk)
begin
  if (img_rst) begin
    past_rdptr <= {PTR_WIDTH{1'b1}};
    read_ok <= 0;
  end else if ((read_req)&&(~fifo_empty)) begin
    read_ok <= 1'b1;
    past_rdptr <= past_rdptr+1;
  end else
    read_ok <= 1'b0;
end


endmodule

