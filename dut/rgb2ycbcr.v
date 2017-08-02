
/* This module converts the incoming Red, Green, and Blue 8-bit pixel data
into Y, Cb, and Cr 8-bit values in 2 cycles. 
-The output values will be unsigned in the range of 0 to 255. 
-data_in contains the Red pixel value in bits [7:0], Green in bits [15:8],
and Blue in bits [23:16].
-data_out contains the Y value in bits [7:0], Cb value in bits [15:8],
and Cr balue in bits [23:16].*/

`timescale 1ns / 100ps
`define SD #1

module rgb2ycbcr(clk, rst, enable, data_in, data_out,
enable_out);
input		clk;
input		rst;
input		enable;
input	[23:0]	data_in;
output	[23:0]	data_out;
output	enable_out;


wire [13:0] Y1 = 14'd4899;
wire [13:0] Y2 = 14'd9617;
wire [13:0] Y3 = 14'd1868;
wire [13:0] CB1 = 14'd2765;
wire [13:0] CB2 = 14'd5427;
wire [13:0] CB3 = 14'd8192;
wire [13:0] CR1 = 14'd8192;
wire [13:0] CR2 = 14'd6860;
wire [13:0] CR3 = 14'd1332;

wire unsigned [21:0] Y_temp, CB_temp, CR_temp;

reg signed [21:0] Y1_product, Y2_product, Y3_product;
reg signed [21:0] CB1_product, CB2_product, CB3_product;
reg signed [21:0] CR1_product, CR2_product, CR3_product;
wire signed [7:0] Y, CB, CR;
reg unsigned [7:0] Y_int, CB_int, CR_int;

reg	enable_1, enable_out;

wire [23:0] data_out = {CR, CB, Y};

assign Y_temp	= Y1_product + Y2_product + Y3_product;
assign CB_temp	= 22'd2097152 - CB1_product - CB2_product + CB3_product;
assign CR_temp	= 22'd2097152 + CR1_product - CR2_product - CR3_product; 

always @(posedge clk)
begin
	if (rst) begin
		Y1_product	<= `SD 0;	
		Y2_product	<= `SD 0;
		Y3_product	<= `SD 0;   
		CB1_product	<= `SD 0;	
		CB2_product	<= `SD 0;
		CB3_product	<= `SD 0;
		CR1_product	<= `SD 0;
		CR2_product	<= `SD 0;
		CR3_product	<= `SD 0;
		end
	else if (enable) begin
		Y1_product	<= `SD Y1 * data_in[7:0];	
		Y2_product	<= `SD Y2 * data_in[15:8];
		Y3_product	<= `SD Y3 * data_in[23:16];   
		CB1_product	<= `SD CB1 * data_in[7:0];	
		CB2_product	<= `SD CB2 * data_in[15:8];
		CB3_product	<= `SD CB3 * data_in[23:16];
		CR1_product	<= `SD CR1 * data_in[7:0];	
		CR2_product	<= `SD CR2 * data_in[15:8];
		CR3_product	<= `SD CR3 * data_in[23:16];
		end
end 
 
/* Rounding of Y, CB, CR requires looking at bit 13.  If there is a '1' in bit 13,
then the value in bits [21:14] needs to be rounded up by adding 1 to the value
in those bits */

always @(posedge clk)
begin
	if (rst) begin
		Y_int	<= `SD 0;
		CB_int	<= `SD 0;
		CR_int	<= `SD 0;
		end
	else if (enable_1) begin
		Y_int	<= `SD Y_temp[13] & (Y_temp[21:14] != 8'd255) ? Y_temp[21:14] + 1: Y_temp[21:14];
		CB_int	<= `SD CB_temp[13] & (CB_temp[21:14] != 8'd255) ? CB_temp[21:14] + 1: CB_temp[21:14];
		CR_int	<= `SD CR_temp[13] & (CR_temp[21:14] != 8'd255) ? CR_temp[21:14] + 1: CR_temp[21:14]; 
		// Need to avoid rounding if the value in the top 8 bits is 255, otherwise
		// the value would rollover from 255 to 0
		end
end

assign Y = Y_int - 8'd128;
assign CB = CB_int - 8'd128;
assign CR = CR_int - 8'd128;



// Propagate enable signal to next stage (takes 2 cycles)
always @(posedge clk)
begin
	if (rst) begin
		enable_1	<= `SD 0;
		enable_out	<= `SD 0;   
		end
	else begin
		enable_1	<= `SD enable;
		enable_out	<= `SD enable_1;
		end
end
endmodule
