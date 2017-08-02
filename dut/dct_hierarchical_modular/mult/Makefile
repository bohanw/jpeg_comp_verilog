STD_CELLS = /afs/umich.edu/class/eecs627/ibm13/artisan/2005q3v1/aci/sc-x/verilog/ibm13_neg.v
TESTBENCH =  mult_tb.v
SIM_FILES =  mult.v \
			../adders/fa4.v \
			../adders/fa_1bit.v \
			../adders/comp_four_two.v \
			../adders/comp_three_two.v \
			../adders/comp_eight_two.v



VV         = SW_VCS=2015.09 vcs  -Mupdate -line +lint=PCWM
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

