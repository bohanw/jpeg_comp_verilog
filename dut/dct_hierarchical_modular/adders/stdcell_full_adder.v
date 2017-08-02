
/*1 bit full adder std cell*/

module stdcell_full_adder(
	input logic a,b,cin,
	output logic sum,cout);

always_comb begin
	{cout,sum}= a+b+cin;
end

endmodule // stdcell_full_adder
