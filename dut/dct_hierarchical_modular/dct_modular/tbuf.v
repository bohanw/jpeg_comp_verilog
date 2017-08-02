`timescale 1ns/1ps
`celldefine
module TBUFX1TR (Y, A, OE);
output Y;
input A, OE;

  bufif1 I0(Y, A, OE);
  specify
    // delay parameters
    specparam
      tplh$A$Y = 1.0,
      tphl$A$Y = 1.0,
      tplh$OE$Y = 1.0,
      tphl$OE$Y = 1.0;

    // path delays
    (A *> Y) = (tplh$A$Y, tphl$A$Y);
    (OE *> Y) = (tplh$OE$Y, tphl$OE$Y);
  endspecify

endmodule // TBUFX1TR
`endcelldefine
