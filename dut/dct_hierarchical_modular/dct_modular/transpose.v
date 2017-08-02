module transpose #(parameter SIZE = 8)(
	input  signed [SIZE-1:0]data_in[7:0][7:0],
	output logic signed[SIZE-1:0]data_out [7:0][7:0]);

	logic  signed [SIZE-1:0]trans[7:0][7:0] ;

	always_comb begin
		
		for (int i = 0; i < 8; i++) begin
	
			for(int j=0; j < 8;j++) begin
				trans[i][j] = data_in[j][i];
			end
		end


	end
	assign data_out = trans;	
endmodule // end