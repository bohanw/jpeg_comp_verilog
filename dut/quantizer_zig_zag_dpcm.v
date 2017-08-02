module quantizer_zig_zag_dpcm
  (input logic signed [10:0] quant_in[7:0][7:0],
   input logic clk,block_rdy_pulse, img_rst,
   output logic enable_huff_block,
   output logic signed [10:0] zz_out,
   output logic signed [11:0] dpcm);

localparam RSH_VAL = 10;
//int RSH_VAL = 10;

///////////////////////////////////////
//using QF=75; //refer quantization_fixed_point.m code, use that to generate
//these numbers

//localparam signed [RSH_VAL:0] q_matrix[0:7][0:7]=
//    '{'{11'h080,11'h0AB,11'h0CD,11'h080,11'h055,11'h033,11'h027,11'h021},
//      '{11'h0AB,11'h0AB,11'h092,11'h066,11'h04F,11'h023,11'h022,11'h025},
//      '{11'h092,11'h092,11'h080,11'h055,11'h033,11'h023,11'h01D,11'h025},
//      '{11'h092,11'h072,11'h05D,11'h044,11'h027,11'h017,11'h01A,11'h021},
//      '{11'h072,11'h05D,11'h036,11'h025,11'h01E,11'h013,11'h014,11'h01A},
//      '{11'h055,11'h039,11'h025,11'h020,11'h019,11'h014,11'h012,11'h016},
//      '{11'h029,11'h020,11'h01A,11'h017,11'h014,11'h011,11'h011,11'h014},
//      '{11'h01C,11'h016,11'h015,11'h015,11'h012,11'h014,11'h014,11'h014}};

////////////////////////////////////////



///////////////////////////////////////
//using QF=50; //refer quantization_fixed_point.m code, use that to generate
//these numbers

wire signed [RSH_VAL:0] q_matrix[0:7][0:7];
assign q_matrix =
    '{'{11'd64,11'd93,11'd102,11'd64,11'd43,11'd26,11'd20,11'd17 },
      '{11'd85,11'd85,11'd73,11'd54,11'd39,11'd18,11'd17,11'd19  },
      '{11'd73,11'd79,11'd64,11'd43,11'd26,11'd18,11'd15,11'd18  },
      '{11'd73,11'd60,11'd47,11'd35,11'd20,11'd12,11'd13,11'd17  },
      '{11'd57,11'd47,11'd28,11'd18,11'd15,11'd9,11'd10,11'd13   },
      '{11'd43,11'd29,11'd19,11'd16,11'd13,11'd10,11'd9,11'd11   },
      '{11'd21,11'd16,11'd13,11'd12,11'd10,11'd8,11'd9,11'd10    },
      '{11'd14,11'd11,11'd11,11'd10,11'd9,11'd10,11'd10,11'd10   }};
////////////////////////////////////////



logic signed [RSH_VAL+1+10:0] tmp_mul_out[7:0][7:0]; //no_of_bits input + no_of_bits coeff
logic signed [11:0] quant_out_int[7:0][7:0];
logic signed [11:0] temp;
logic signed [10:0] quant_out[7:0][7:0];
logic signed [10:0] quant_tmp[8:1][8:1];

logic signed [10:0] dc_previous; //storing last block dc value, reqd for calc dpcm

logic [10:0] zz11;           
logic [10:0] zz12;           
logic [10:0] zz13;           
logic [10:0] zz14;           
logic [10:0] zz15;           
logic [10:0] zz16;           
logic [10:0] zz17;           
logic [10:0] zz18;           
logic [10:0] zz21;           
logic [10:0] zz22;           
logic [10:0] zz23;           
logic [10:0] zz24;           
logic [10:0] zz25;           
logic [10:0] zz26;           
logic [10:0] zz27;           
logic [10:0] zz28;           
logic [10:0] zz31;           
logic [10:0] zz32;           
logic [10:0] zz33;           
logic [10:0] zz34;           
logic [10:0] zz35;           
logic [10:0] zz36;           
logic [10:0] zz37;           
logic [10:0] zz38;           
logic [10:0] zz41;           
logic [10:0] zz42;           
logic [10:0] zz43;           
logic [10:0] zz44;           
logic [10:0] zz45;           
logic [10:0] zz46;           
logic [10:0] zz47;           
logic [10:0] zz48;           
logic [10:0] zz51;           
logic [10:0] zz52;           
logic [10:0] zz53;           
logic [10:0] zz54;           
logic [10:0] zz55;           
logic [10:0] zz56;           
logic [10:0] zz57;           
logic [10:0] zz58;           
logic [10:0] zz61;           
logic [10:0] zz62;           
logic [10:0] zz63;           
logic [10:0] zz64;           
logic [10:0] zz65;           
logic [10:0] zz66;           
logic [10:0] zz67;           
logic [10:0] zz68;           
logic [10:0] zz71;           
logic [10:0] zz72;           
logic [10:0] zz73;           
logic [10:0] zz74;           
logic [10:0] zz75;           
logic [10:0] zz76;           
logic [10:0] zz77;           
logic [10:0] zz78;           
logic [10:0] zz81;           
logic [10:0] zz82;           
logic [10:0] zz83;           
logic [10:0] zz84;           
logic [10:0] zz85;           
logic [10:0] zz86;           
logic [10:0] zz87;           
logic [10:0] zz88;           



///////quantization step

always_comb 
begin
  if (~block_rdy_pulse) begin
     for (int i = 0; i < 8; i++) begin    
      for(int j=0; j < 8;j++) begin
        quant_out_int[i][j] = 0;
        tmp_mul_out[i][j]=0;        
      end
    end
  end else begin
      for (int i = 0; i < 8; i++) begin    
        for(int j=0; j < 8;j++) begin
          tmp_mul_out[i][j] = (q_matrix[i][j]*quant_in[i][j]); // tmp_mul_out is 12.x = 11.0*1.x 
          if (tmp_mul_out[i][j][RSH_VAL-1]) //we are doing a rounding
            quant_out_int[i][j] = tmp_mul_out[i][j][RSH_VAL+1+10:RSH_VAL] + 12'd1 ;
          else
            quant_out_int[i][j] = tmp_mul_out[i][j][RSH_VAL+1+10:RSH_VAL]; //quantisation loss => quant_out_int is 12.0
        end
      end
  end
end


always_comb
begin
   for (int i = 0; i < 8; i++) begin    
    for(int j=0; j < 8;j++) begin
      temp = quant_out_int[i][j];
      quant_out[i][j] = temp[10:0]; //bit reduction without saturation since multiplier term is always positive => 11.0
    end
  end 
end


///////zig-zagging step (DPCM is embedded in the same code)

assign quant_tmp=quant_out;

assign zz_out = zz11;


always_ff @(posedge clk)
begin
  if (img_rst)
    dc_previous <= 0;
  else if (block_rdy_pulse) begin
    dc_previous <= quant_tmp[1][1];
    dpcm <= quant_tmp[1][1] - dc_previous; 
    enable_huff_block <= 1'b1;   
		zz11 <= quant_tmp[1][1];           
		zz12 <= quant_tmp[1][2];           
		zz13 <= quant_tmp[1][3];           
		zz14 <= quant_tmp[1][4];           
		zz15 <= quant_tmp[1][5];           
		zz16 <= quant_tmp[1][6];           
		zz17 <= quant_tmp[1][7];           
		zz18 <= quant_tmp[1][8];           
		zz21 <= quant_tmp[2][1];           
		zz22 <= quant_tmp[2][2];           
		zz23 <= quant_tmp[2][3];           
		zz24 <= quant_tmp[2][4];           
		zz25 <= quant_tmp[2][5];           
		zz26 <= quant_tmp[2][6];           
		zz27 <= quant_tmp[2][7];           
		zz28 <= quant_tmp[2][8];           
		zz31 <= quant_tmp[3][1];           
		zz32 <= quant_tmp[3][2];           
		zz33 <= quant_tmp[3][3];           
		zz34 <= quant_tmp[3][4];           
		zz35 <= quant_tmp[3][5];           
		zz36 <= quant_tmp[3][6];           
		zz37 <= quant_tmp[3][7];           
		zz38 <= quant_tmp[3][8];           
		zz41 <= quant_tmp[4][1];           
		zz42 <= quant_tmp[4][2];           
		zz43 <= quant_tmp[4][3];           
		zz44 <= quant_tmp[4][4];           
		zz45 <= quant_tmp[4][5];           
		zz46 <= quant_tmp[4][6];           
		zz47 <= quant_tmp[4][7];           
		zz48 <= quant_tmp[4][8];           
		zz51 <= quant_tmp[5][1];           
		zz52 <= quant_tmp[5][2];           
		zz53 <= quant_tmp[5][3];           
		zz54 <= quant_tmp[5][4];           
		zz55 <= quant_tmp[5][5];           
		zz56 <= quant_tmp[5][6];           
		zz57 <= quant_tmp[5][7];           
		zz58 <= quant_tmp[5][8];           
		zz61 <= quant_tmp[6][1];           
		zz62 <= quant_tmp[6][2];           
		zz63 <= quant_tmp[6][3];           
		zz64 <= quant_tmp[6][4];           
		zz65 <= quant_tmp[6][5];           
		zz66 <= quant_tmp[6][6];           
		zz67 <= quant_tmp[6][7];           
		zz68 <= quant_tmp[6][8];           
		zz71 <= quant_tmp[7][1];           
		zz72 <= quant_tmp[7][2];           
		zz73 <= quant_tmp[7][3];           
		zz74 <= quant_tmp[7][4];           
		zz75 <= quant_tmp[7][5];           
		zz76 <= quant_tmp[7][6];           
		zz77 <= quant_tmp[7][7];           
		zz78 <= quant_tmp[7][8];           
		zz81 <= quant_tmp[8][1];           
		zz82 <= quant_tmp[8][2];           
		zz83 <= quant_tmp[8][3];           
		zz84 <= quant_tmp[8][4];           
		zz85 <= quant_tmp[8][5];           
		zz86 <= quant_tmp[8][6];           
		zz87 <= quant_tmp[8][7];           
		zz88 <= quant_tmp[8][8];       
  end
  else begin
    enable_huff_block <= 0;
		zz11 <= zz12; 
		zz12 <= zz21; 
		zz21 <= zz31; 
		zz31 <= zz22; 
		zz22 <= zz13; 
		zz13 <= zz14; 
		zz14 <= zz23; 
		zz23 <= zz32; 
		zz32 <= zz41; 
		zz41 <= zz51; 
		zz51 <= zz42; 
		zz42 <= zz33; 
		zz33 <= zz24; 
		zz24 <= zz15; 
		zz15 <= zz16; 
		zz16 <= zz25; 
		zz25 <= zz34; 
		zz34 <= zz43; 
		zz43 <= zz52; 
		zz52 <= zz61; 
		zz61 <= zz71; 
		zz71 <= zz62; 
		zz62 <= zz53; 
		zz53 <= zz44; 
		zz44 <= zz35; 
		zz35 <= zz26; 
		zz26 <= zz17; 
		zz17 <= zz18; 
		zz18 <= zz27; 
		zz27 <= zz36; 
		zz36 <= zz45; 
		zz45 <= zz54; 
		zz54 <= zz63; 
		zz63 <= zz72; 
		zz72 <= zz81; 
		zz81 <= zz82; 
		zz82 <= zz73; 
		zz73 <= zz64; 
		zz64 <= zz55; 
		zz55 <= zz46; 
		zz46 <= zz37; 
		zz37 <= zz28; 
		zz28 <= zz38; 
		zz38 <= zz47; 
		zz47 <= zz56; 
		zz56 <= zz65; 
		zz65 <= zz74; 
		zz74 <= zz83; 
		zz83 <= zz84; 
		zz84 <= zz75; 
		zz75 <= zz66; 
		zz66 <= zz57; 
		zz57 <= zz48; 
		zz48 <= zz58; 
		zz58 <= zz67; 
		zz67 <= zz76; 
		zz76 <= zz85; 
		zz85 <= zz86; 
		zz86 <= zz77; 
		zz77 <= zz68; 
		zz68 <= zz78; 
		zz78 <= zz87; 
		zz87 <= zz88; 
    zz88 <= 11'b0;  
  end
end

endmodule
