
/*1 bit full adder
"3:2 compresor"
*/

module full_adder(
	input logic a,b,cin,approx_en,
	output logic signed sum,cout);

always_comb begin
	if(approx_en) begin
		//use approximate adder
		sum = b;
		cout = a;

	end
	else begin
		sum = a ^ b ^ cin;
		cout =  (a & b )|(cin & (a ^ b)); 
	end
end

endmodule // full_adder
