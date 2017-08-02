# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Thu Mar 16 16:52:52 2017
# Designs open: 1
#   Sim: /afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dut/dct_hierarchical_modular/dct_stage/dve
# Toplevel windows open: 1
# 	TopLevel.1
#   Source.1: dut
#   Group count = 13
#   Group Group1 signal count = 10
#   Group col0 signal count = 16
#   Group col1 signal count = 19
#   Group Group2 signal count = 9
#   Group Group3 signal count = 1
#   Group Group4 signal count = 3
#   Group Group5 signal count = 0
#   Group i00 signal count = 32
#   Group Group6 signal count = 2
#   Group Group7 signal count = 7
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#<Session mode="Full" path="/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dut/dct_hierarchical_modular/dct_stage/DVEfiles/session.tcl" type="Debug">

gui_set_loading_session_type Post
gui_continuetime_set

# Close design
if { [gui_sim_state -check active] } {
    gui_sim_terminate
}
gui_close_db -all
gui_expr_clear_all

# Close all windows
gui_close_window -type Console
gui_close_window -type Wave
gui_close_window -type Source
gui_close_window -type Schematic
gui_close_window -type Data
gui_close_window -type DriverLoad
gui_close_window -type List
gui_close_window -type Memory
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Assertion
gui_close_window -type CovHier
gui_close_window -type CoverageTable
gui_close_window -type CoverageMap
gui_close_window -type CovDetail
gui_close_window -type Local
gui_close_window -type Stack
gui_close_window -type Watch
gui_close_window -type Group
gui_close_window -type Transaction



# Application preferences
gui_set_pref_value -key app_default_font -value {Helvetica,10,-1,5,50,0,0,0,0,0}
gui_src_preferences -tabstop 8 -maxbits 24 -windownumber 1
#<WindowLayout>

# DVE top-level session


# Create and position top-level window: TopLevel.1

if {![gui_exist_window -window TopLevel.1]} {
    set TopLevel.1 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.1 TopLevel.1
}
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{2969 141} {4268 1428}}

# ToolBar settings
gui_set_toolbar_attributes -toolbar {TimeOperations} -dock_state top
gui_set_toolbar_attributes -toolbar {TimeOperations} -offset 0
gui_show_toolbar -toolbar {TimeOperations}
gui_hide_toolbar -toolbar {&File}
gui_set_toolbar_attributes -toolbar {&Edit} -dock_state top
gui_set_toolbar_attributes -toolbar {&Edit} -offset 0
gui_show_toolbar -toolbar {&Edit}
gui_hide_toolbar -toolbar {CopyPaste}
gui_set_toolbar_attributes -toolbar {&Trace} -dock_state top
gui_set_toolbar_attributes -toolbar {&Trace} -offset 0
gui_show_toolbar -toolbar {&Trace}
gui_hide_toolbar -toolbar {TraceInstance}
gui_hide_toolbar -toolbar {BackTrace}
gui_set_toolbar_attributes -toolbar {&Scope} -dock_state top
gui_set_toolbar_attributes -toolbar {&Scope} -offset 0
gui_show_toolbar -toolbar {&Scope}
gui_set_toolbar_attributes -toolbar {&Window} -dock_state top
gui_set_toolbar_attributes -toolbar {&Window} -offset 0
gui_show_toolbar -toolbar {&Window}
gui_set_toolbar_attributes -toolbar {Signal} -dock_state top
gui_set_toolbar_attributes -toolbar {Signal} -offset 0
gui_show_toolbar -toolbar {Signal}
gui_set_toolbar_attributes -toolbar {Zoom} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom} -offset 0
gui_show_toolbar -toolbar {Zoom}
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -dock_state top
gui_set_toolbar_attributes -toolbar {Zoom And Pan History} -offset 0
gui_show_toolbar -toolbar {Zoom And Pan History}
gui_set_toolbar_attributes -toolbar {Grid} -dock_state top
gui_set_toolbar_attributes -toolbar {Grid} -offset 0
gui_show_toolbar -toolbar {Grid}
gui_set_toolbar_attributes -toolbar {Simulator} -dock_state top
gui_set_toolbar_attributes -toolbar {Simulator} -offset 0
gui_show_toolbar -toolbar {Simulator}
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -dock_state top
gui_set_toolbar_attributes -toolbar {Interactive Rewind} -offset 0
gui_show_toolbar -toolbar {Interactive Rewind}
gui_set_toolbar_attributes -toolbar {Testbench} -dock_state top
gui_set_toolbar_attributes -toolbar {Testbench} -offset 0
gui_show_toolbar -toolbar {Testbench}

# End ToolBar settings

# Docked window settings
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 344]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 344
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 343} {height 794} {dock_state left} {dock_on_new_line true} {child_hier_colhier 293} {child_hier_coltype 113} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 350]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 350
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 794
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 349} {height 794} {dock_state left} {dock_on_new_line true} {child_data_colvariable 258} {child_data_colvalue 83} {child_data_coltype 135} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 395]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 1300
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 395
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1299} {height 394} {dock_state bottom} {dock_on_new_line true}}
#### Start - Readjusting docked view's offset / size
set dockAreaList { top left right bottom }
foreach dockArea $dockAreaList {
  set viewList [gui_ekki_get_window_ids -active_parent -dock_area $dockArea]
  foreach view $viewList {
      if {[lsearch -exact [gui_get_window_pref_keys -window $view] dock_width] != -1} {
        set dockWidth [gui_get_window_pref_value -window $view -key dock_width]
        set dockHeight [gui_get_window_pref_value -window $view -key dock_height]
        set offset [gui_get_window_pref_value -window $view -key dock_offset]
        if { [string equal "top" $dockArea] || [string equal "bottom" $dockArea]} {
          gui_set_window_attributes -window $view -dock_offset $offset -width $dockWidth
        } else {
          gui_set_window_attributes -window $view -dock_offset $offset -height $dockHeight
        }
      }
  }
}
#### End - Readjusting docked view's offset / size
gui_sync_global -id ${TopLevel.1} -option true

# MDI window settings
set Source.1 [gui_create_window -type {Source}  -parent ${TopLevel.1}]
gui_show_window -window ${Source.1} -show_state maximized
gui_update_layout -id ${Source.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{-ucligui +vc +define+ +lint=PCWM +memcbk}}
gui_set_env SIMSETUP::SIMEXE {/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dut/dct_hierarchical_modular/dct_stage/dve}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {/afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dut/dct_hierarchical_modular/dct_stage/dve}] } {
gui_sim_run Ucli -exe dve -args {-ucligui +vc +define+ +lint=PCWM +memcbk} -dir /afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dut/dct_hierarchical_modular/dct_stage -nosource
}
}
if { ![gui_sim_state -check active] } {error "Simulator did not start correctly" error}
gui_set_precision 1s
gui_set_time_units 1s
#</Database>

# DVE Global setting session: 


# Global: Breakpoints

# Global: Bus

# Global: Expressions

# Global: Signal Time Shift

# Global: Signal Compare

# Global: Signal Groups
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[0]}
gui_load_child_values {dut.d0.d2.col0.i00.c0}
gui_load_child_values {dut.d0.d2.col0}
gui_load_child_values {dut.d0.d2.col1}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[7]}
gui_load_child_values {dut.d0.d2.col0.i00.c0.c1.genblk1[8].genblk1.fa}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[2]}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[9]}
gui_load_child_values {dut.d0.d2.col0.i00.c0.c1.genblk1[7].genblk1.fa}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[15]}
gui_load_child_values {dut.d0.d1.col0[0]}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[4]}
gui_load_child_values {dut.d0.d1.col0[7]}
gui_load_child_values {dut.d0.d1.col0[0].i00}
gui_load_child_values {dut.d0.d1.col0[0].i01}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[1]}
gui_load_child_values {dut.d0.d2}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[8]}
gui_load_child_values {dut.d0.d2.col0.i00.f1.f0[3]}
gui_load_child_values {dut.d0.d2.col0.i00.c0.c1.genblk1[9].genblk1.fa}


set _session_group_90 Group1
gui_sg_create "$_session_group_90"
set Group1 "$_session_group_90"

gui_sg_addsignal -group "$_session_group_90" { dut.d0.d2.data_in dut.d0.d2.dct_en dut.d0.d2.approx_en dut.d0.d2.clk dut.d0.d2.rst dut.d0.d2.data_out dut.d0.d2.dct_stage_done dut.d0.d2.wr_en dut.d0.d2.dct_col_done }

set _session_group_91 $_session_group_90|
append _session_group_91 {col0[7]}
gui_sg_create "$_session_group_91"
set {Group1|col0[7]} "$_session_group_91"

gui_sg_addsignal -group "$_session_group_91" { {dut.d0.d1.col0[7].APPROX_BITS} {dut.d0.d1.col0[7].SIZE_OUT} {dut.d0.d1.col0[7].approx_en} {dut.d0.d1.col0[7].cnt} {dut.d0.d1.col0[7].next_data_out} {dut.d0.d1.col0[7].sum} {dut.d0.d1.col0[7].n_cnt} {dut.d0.d1.col0[7].data_out} {dut.d0.d1.col0[7].dct_coeff} {dut.d0.d1.col0[7].SIZE} {dut.d0.d1.col0[7].m} {dut.d0.d1.col0[7].data_in} {dut.d0.d1.col0[7].wr_en} {dut.d0.d1.col0[7].clk} {dut.d0.d1.col0[7].sum_scaled} {dut.d0.d1.col0[7].done} {dut.d0.d1.col0[7].start} {dut.d0.d1.col0[7].SIZE_MULT} {dut.d0.d1.col0[7].rst} }
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.d1.col0[7].APPROX_BITS}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.d1.col0[7].APPROX_BITS}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.d1.col0[7].SIZE_OUT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.d1.col0[7].SIZE_OUT}}
gui_set_radix -radix enum -signals {{Sim:dut.d0.d1.col0[7].dct_coeff}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.d1.col0[7].SIZE}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.d1.col0[7].SIZE}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.d1.col0[7].SIZE_MULT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.d1.col0[7].SIZE_MULT}}

gui_sg_move "$_session_group_91" -after "$_session_group_90" -pos 9 

set _session_group_92 col0
gui_sg_create "$_session_group_92"
set col0 "$_session_group_92"

gui_sg_addsignal -group "$_session_group_92" { dut.d0.d2.col0.cnt dut.d0.d2.col0.next_data_out dut.d0.d2.col0.sum dut.d0.d2.col0.n_cnt dut.d0.d2.col0.data_out dut.d0.d2.col0.dct_coeff dut.d0.d2.col0.SIZE dut.d0.d2.col0.m dut.d0.d2.col0.data_in dut.d0.d2.col0.wr_en dut.d0.d2.col0.clk dut.d0.d2.col0.sum_scaled dut.d0.d2.col0.done dut.d0.d2.col0.start dut.d0.d2.col0.SIZE_MULT dut.d0.d2.col0.rst }
gui_set_radix -radix enum -signals {Sim:dut.d0.d2.col0.dct_coeff}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col0.SIZE}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col0.SIZE}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col0.SIZE_MULT}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col0.SIZE_MULT}

set _session_group_93 col1
gui_sg_create "$_session_group_93"
set col1 "$_session_group_93"

gui_sg_addsignal -group "$_session_group_93" { dut.d0.d2.col1.APPROX_BITS dut.d0.d2.col1.SIZE_OUT dut.d0.d2.col1.approx_en dut.d0.d2.col1.cnt dut.d0.d2.col1.next_data_out dut.d0.d2.col1.sum dut.d0.d2.col1.n_cnt dut.d0.d2.col1.data_out dut.d0.d2.col1.dct_coeff dut.d0.d2.col1.SIZE dut.d0.d2.col1.m dut.d0.d2.col1.data_in dut.d0.d2.col1.wr_en dut.d0.d2.col1.clk dut.d0.d2.col1.sum_scaled dut.d0.d2.col1.done dut.d0.d2.col1.start dut.d0.d2.col1.SIZE_MULT dut.d0.d2.col1.rst }
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col1.APPROX_BITS}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col1.APPROX_BITS}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col1.SIZE_OUT}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col1.SIZE_OUT}
gui_set_radix -radix enum -signals {Sim:dut.d0.d2.col1.dct_coeff}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col1.SIZE}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col1.SIZE}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col1.SIZE_MULT}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col1.SIZE_MULT}

set _session_group_94 Group2
gui_sg_create "$_session_group_94"
set Group2 "$_session_group_94"

gui_sg_addsignal -group "$_session_group_94" { dut.d0.d2.dct_en dut.d0.d2.data_out dut.d0.d2.dct_stage_done dut.d0.d2.data_in dut.d0.d2.wr_en dut.d0.d2.clk dut.d0.d2.dct_col_done dut.d0.d2.rst dut.d0.d2.next_wr_en }

set _session_group_95 Group3
gui_sg_create "$_session_group_95"
set Group3 "$_session_group_95"

gui_sg_addsignal -group "$_session_group_95" { {dut.d0.d1.col0[0].APPROX_BITS} }
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.d1.col0[0].APPROX_BITS}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.d1.col0[0].APPROX_BITS}}

set _session_group_96 Group4
gui_sg_create "$_session_group_96"
set Group4 "$_session_group_96"

gui_sg_addsignal -group "$_session_group_96" { {dut.d0.d1.col0[0].i00.approx_en_add} {dut.d0.d1.col0[0].i00.approx_en_sub} {dut.d0.d1.col0[0].i01.approx_en} }

set _session_group_97 Group5
gui_sg_create "$_session_group_97"
set Group5 "$_session_group_97"


set _session_group_98 i00
gui_sg_create "$_session_group_98"
set i00 "$_session_group_98"

gui_sg_addsignal -group "$_session_group_98" { dut.d0.d2.col0.i00.mcand dut.d0.d2.col0.i00.APPROX_BITS dut.d0.d2.col0.i00.cout_45_shifted dut.d0.d2.col0.i00.result dut.d0.d2.col0.i00.approx_en dut.d0.d2.col0.i00.result0 dut.d0.d2.col0.i00.result1 dut.d0.d2.col0.i00.result2 dut.d0.d2.col0.i00.mcand_extend1 dut.d0.d2.col0.i00.result3 dut.d0.d2.col0.i00.mcand_extend2 dut.d0.d2.col0.i00.result4 dut.d0.d2.col0.i00.approx_en_sub dut.d0.d2.col0.i00.result5 dut.d0.d2.col0.i00.result6 dut.d0.d2.col0.i00.cout_45 dut.d0.d2.col0.i00.dct_coeff dut.d0.d2.col0.i00.SIZE dut.d0.d2.col0.i00.sign dut.d0.d2.col0.i00.coeff_in dut.d0.d2.col0.i00.sum_45 dut.d0.d2.col0.i00.sum_45_shifted dut.d0.d2.col0.i00.cout0 dut.d0.d2.col0.i00.cout1 dut.d0.d2.col0.i00.cout2 dut.d0.d2.col0.i00.rca_approx_en dut.d0.d2.col0.i00.cout3 dut.d0.d2.col0.i00.cout4 dut.d0.d2.col0.i00.cout5 dut.d0.d2.col0.i00.cout6 dut.d0.d2.col0.i00.SIZE_MULT dut.d0.d2.col0.i00.approx_en_add }
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col0.i00.APPROX_BITS}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col0.i00.APPROX_BITS}
gui_set_radix -radix enum -signals {Sim:dut.d0.d2.col0.i00.dct_coeff}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col0.i00.SIZE}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col0.i00.SIZE}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col0.i00.SIZE_MULT}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col0.i00.SIZE_MULT}

set _session_group_99 Group6
gui_sg_create "$_session_group_99"
set Group6 "$_session_group_99"

gui_sg_addsignal -group "$_session_group_99" { dut.d0.d2.col0.i00.c0.APPROX_BITS dut.d0.d2.col0.i00.c0.approx_en }
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.d2.col0.i00.c0.APPROX_BITS}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.d2.col0.i00.c0.APPROX_BITS}

set _session_group_100 Group7
gui_sg_create "$_session_group_100"
set Group7 "$_session_group_100"

gui_sg_addsignal -group "$_session_group_100" { {dut.d0.d2.col0.i00.c0.c1.genblk1[7].genblk1.fa.approx_en} {dut.d0.d2.col0.i00.c0.c1.genblk1[8].genblk1.fa.approx_en} {dut.d0.d2.col0.i00.c0.c1.genblk1[9].genblk1.fa.approx_en} {dut.d0.d2.col0.i00.f1.f0[0].approx_en} {dut.d0.d2.col0.i00.f1.f0[1].approx_en} {dut.d0.d2.col0.i00.f1.f0[2].approx_en} }

set _session_group_101 $_session_group_100|
append _session_group_101 {f0[3]}
gui_sg_create "$_session_group_101"
set {Group7|f0[3]} "$_session_group_101"

gui_sg_addsignal -group "$_session_group_101" { {dut.d0.d2.col0.i00.f1.f0[7].approx_en} {dut.d0.d2.col0.i00.f1.f0[4].approx_en} {dut.d0.d2.col0.i00.f1.f0[3].approx_en} }

gui_sg_move "$_session_group_101" -after "$_session_group_100" -pos 6 

set _session_group_102 $_session_group_101|
append _session_group_102 {f0[8]}
gui_sg_create "$_session_group_102"
set {Group7|f0[3]|f0[8]} "$_session_group_102"

gui_sg_addsignal -group "$_session_group_102" { {dut.d0.d2.col0.i00.f1.f0[8].cin} {dut.d0.d2.col0.i00.f1.f0[8].approx_en} {dut.d0.d2.col0.i00.f1.f0[8].cout} {dut.d0.d2.col0.i00.f1.f0[8].sum} {dut.d0.d2.col0.i00.f1.f0[8].a} {dut.d0.d2.col0.i00.f1.f0[8].b} {dut.d0.d2.col0.i00.f1.f0[9].approx_en} {dut.d0.d2.col0.i00.f1.f0[15].approx_en} }

gui_sg_move "$_session_group_102" -after "$_session_group_101" -pos 3 

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 6030



# Save global setting...

# Wave/List view global setting
gui_cov_show_value -switch false

# Close all empty TopLevel windows
foreach __top [gui_ekki_get_window_ids -type TopLevel] {
    if { [llength [gui_ekki_get_window_ids -parent $__top]] == 0} {
        gui_close_window -window $__top
    }
}
gui_set_loading_session_type noSession
# DVE View/pane content session: 


# Hier 'Hier.1'
gui_show_window -window ${Hier.1}
gui_list_set_filter -id ${Hier.1} -list { {Package 1} {All 0} {Process 1} {VirtPowSwitch 0} {UnnamedProcess 1} {UDP 0} {Function 1} {Block 1} {SrsnAndSpaCell 0} {OVA Unit 1} {LeafScCell 1} {LeafVlgCell 1} {Interface 1} {LeafVhdCell 1} {$unit 1} {NamedBlock 1} {Task 1} {VlgPackage 1} {ClassDef 1} {VirtIsoCell 0} }
gui_list_set_filter -id ${Hier.1} -text {*}
gui_hier_list_init -id ${Hier.1}
gui_change_design -id ${Hier.1} -design Sim
catch {gui_list_expand -id ${Hier.1} dut}
catch {gui_list_expand -id ${Hier.1} dut.d0}
catch {gui_list_expand -id ${Hier.1} dut.d0.d2}
catch {gui_list_expand -id ${Hier.1} dut.d0.d2.col0}
catch {gui_list_expand -id ${Hier.1} dut.d0.d2.col0.i00}
catch {gui_list_select -id ${Hier.1} {dut.d0.d2.col0.i00.f3}}
gui_view_scroll -id ${Hier.1} -vertical -set 260
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {dut.d0.d2.col0.i00.f3}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 260
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active dut /afs/umich.edu/class/eecs627/w17/group5/PROJECT/gp5_syn/dut/dct_hierarchical_modular/dct_stage/dct_tb.v
gui_view_scroll -id ${Source.1} -vertical -set 0
gui_src_set_reusable -id ${Source.1}
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
#</Session>

