STD_CELLS = /afs/umich.edu/class/eecs627/ibm13/artisan/2005q3v1/aci/sc-x/verilog/ibm13_neg.v
# dct_stage tb
#TESTBENCH =  dct_col_tb.v
#SIM_FILES =  ./dct_col.v \
			../mult/mult.v \
			../adders/fa4.v \
			../adders/fa_1bit.v \
			../adders/comp_four_two.v \
			../adders/comp_three_two.v \
			../adders/carry_save_eight.v

#STESTBENCH =  dct_stage1_tb.v
#SIM_FILES =  ./dct_col.v \
			./dct_stage1.v \
			../mult/mult.v \
			../adders/fa4.v \
			../adders/fa_1bit.v \
			../adders/comp_four_two.v \
			../adders/comp_three_two.v \
			../adders/carry_save_eight.v
TESTBENCH =  dct_tb.v
SIM_FILES =   ./dct_stage1.v \
			./dct_stage2.v \
			./dct.v \
			./dff.v \
			./dff_level_convert.v \
			./dct_col.v \
			./dct_col_stage2.v \
			../mult/mult.v \
			../adders/fa4.v \
			../adders/fa_1bit.v \
			../adders/comp_four_two.v \
			../adders/comp_three_two.v \
			../adders/carry_save_eight.v

VV         = SW_VCS=2015.09 vcs  -Mupdate -line +lint=PCWM +lint=TFIPC-L
VVOPTS     = -o $@ +v2k +vc -sverilog -timescale=1ns/1ps +vcs+lic+wait +multisource_int_delays                    \
	       	+neg_tchk +incdir+$(VERIF) +plusarg_save +overlap +warn=noSDFCOM_UHICD,noSDFCOM_IWSBA,noSDFCOM_IANE,noSDFCOM_PONF -full64 -cc gcc +libext+.v+.vlib+.vh 

ifdef WAVES
VVOPTS += +define+DUMP_VCD=1 +memcbk +vcs+dumparrays +sdfverbose
endif

ifdef 
VVOPTS += -gui
endif

all:	sim
	./sim | tee program.out

clean:
	rm -rvf *.daidir csrc vcs.key 
	rm -rf ucli.key
	rm -rf sim
	rm -rf *.in *.out
	rm -rf *.trn *.vcd


sim:	
	$(VV) $(VVOPTS) $(SIM_FILES) $(TESTBENCH) ;  ./$@

