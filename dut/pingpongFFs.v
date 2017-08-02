
/* This module instantiates two 8x24 flipflops (actually implemented as a single 16x24) that act as a buffer before the DCT stage. The 1st 8x24 flop (ping) is filled in 8 cycles, then sends a signal to the DCT saying it can take all the data and use it in parallel. Meanwhile, while the DCT is performed in 8 cycles, the 2nd 8x24 flop (pong) is filled in preparation for the next DCT. We need two of these buffers because the DCT will be a multi-cycle block, so the data in the first flop must remain constant for 8 cycles. A whole pixel block (64 pixels) takes 2+8+64 = 74 cycles to complete from color conversion to output of DCT.*/

`timescale 1ns / 100ps
`define SD #1
`define ENTRIES 16

module pingpongFFs(clk, rst, enable, data_in, data_out,dct_en);
input	logic	clk;
input	logic	rst;
input	logic	enable;
input	logic  [23:0]	data_in; //pixel data must be signed 
output 	logic  [23:0]	data_out[7:0];// pixel data must be signed
output logic	dct_en;

logic [23:0]	ffs[`ENTRIES-1:0];
logic [3:0] counter, next_counter;
logic ping_pong_sel,enable_dct;
//logic dct_en_shift[7:0];

assign next_counter = counter + 1'd1;
//assign data_out		= enable_out & (counter < 4'd8) ? ffs[`ENTRIES-1:8] : ffs[7:0];
assign data_out = (ping_pong_sel) ? ffs[`ENTRIES-1:8] : ffs[7:0];


//synopsys sync_set_reset "rst"
always_ff @(posedge clk) begin
	if (rst) begin
    	for (int i=0;i<`ENTRIES;i=i+1) begin
		  ffs[i]			<= `SD ({24{1'b0}});  // can this be removed to save power and area ?? todo pradeep
    	end
		counter		<= `SD 0;
		enable_dct	<= `SD 0;
    	ping_pong_sel <= `SD 1'b1;
	end else if (enable) begin
		ffs[counter]<= `SD data_in;
		counter 	<= `SD next_counter;
		if (counter[2:0] == 3'd6) begin
			enable_dct <= `SD 1; //enable_dct is a pulse once in every 8 cycles
		end else begin
      	enable_dct <= `SD 0;
    end
    if (enable_dct) begin
      ping_pong_sel <= `SD ~ping_pong_sel; //switch between ping-pong every 8 cycles
    end

	end
end

assign dct_en = enable_dct;

//always_ff @(posedge clk) begin
//  if (rst) 
//    dct_en_shift<= `SD '{8{1'b0}};
//  else
//    dct_en_shift <= `SD {dct_en_shift[6:0],enable_dct} ; // to generate 8 cycle delay
//end
//
//assign dct_en = dct_en_shift[7]; // this signal to be used by dct 1st stage flop to latch the data

endmodule
