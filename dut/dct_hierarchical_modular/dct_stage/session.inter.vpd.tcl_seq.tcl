# Begin_DVE_Session_Save_Info
# DVE full session
# Saved on Tue Feb 28 16:03:05 2017
# Designs open: 1
#   Sim: dve
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Source.1: dut
#   Wave.1: 74 signals
#   Group count = 4
#   Group Group1 signal count = 20
#   Group Group2 signal count = 14
#   Group col0[6] signal count = 20
#   Group col0[7] signal count = 20
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#<Session mode="Full" path="/afs/umich.edu/class/eecs627/w17/group5/PROJECT/jpeg_verilog/verilog/dct_hierarchical/dct_stage/session.inter.vpd.tcl_seq.tcl" type="Debug">

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
gui_show_window -window ${TopLevel.1} -show_state normal -rect {{3206 242} {5118 1229}}

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
set HSPane.1 [gui_create_window -type HSPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 373]
catch { set Hier.1 [gui_share_window -id ${HSPane.1} -type Hier] }
gui_set_window_pref_key -window ${HSPane.1} -key dock_width -value_type integer -value 373
gui_set_window_pref_key -window ${HSPane.1} -key dock_height -value_type integer -value -1
gui_set_window_pref_key -window ${HSPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${HSPane.1} {{left 0} {top 0} {width 372} {height 465} {dock_state left} {dock_on_new_line true} {child_hier_colhier 293} {child_hier_coltype 113} {child_hier_colpd 0} {child_hier_col1 0} {child_hier_col2 1} {child_hier_col3 -1}}
set DLPane.1 [gui_create_window -type DLPane -parent ${TopLevel.1} -dock_state left -dock_on_new_line true -dock_extent 379]
catch { set Data.1 [gui_share_window -id ${DLPane.1} -type Data] }
gui_set_window_pref_key -window ${DLPane.1} -key dock_width -value_type integer -value 379
gui_set_window_pref_key -window ${DLPane.1} -key dock_height -value_type integer -value 465
gui_set_window_pref_key -window ${DLPane.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${DLPane.1} {{left 0} {top 0} {width 378} {height 465} {dock_state left} {dock_on_new_line true} {child_data_colvariable 176} {child_data_colvalue 83} {child_data_coltype 135} {child_data_col1 0} {child_data_col2 1} {child_data_col3 2}}
set Console.1 [gui_create_window -type Console -parent ${TopLevel.1} -dock_state bottom -dock_on_new_line true -dock_extent 424]
gui_set_window_pref_key -window ${Console.1} -key dock_width -value_type integer -value 1913
gui_set_window_pref_key -window ${Console.1} -key dock_height -value_type integer -value 424
gui_set_window_pref_key -window ${Console.1} -key dock_offset -value_type integer -value 0
gui_update_layout -id ${Console.1} {{left 0} {top 0} {width 1912} {height 423} {dock_state bottom} {dock_on_new_line true}}
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


# Create and position top-level window: TopLevel.2

if {![gui_exist_window -window TopLevel.2]} {
    set TopLevel.2 [ gui_create_window -type TopLevel \
       -icon $::env(DVE)/auxx/gui/images/toolbars/dvewin.xpm] 
} else { 
    set TopLevel.2 TopLevel.2
}
gui_show_window -window ${TopLevel.2} -show_state maximized -rect {{2561 79} {5120 1479}}

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
gui_sync_global -id ${TopLevel.2} -option true

# MDI window settings
set Wave.1 [gui_create_window -type {Wave}  -parent ${TopLevel.2}]
gui_show_window -window ${Wave.1} -show_state maximized
gui_update_layout -id ${Wave.1} {{show_state maximized} {dock_state undocked} {dock_on_new_line false} {child_wave_left 743} {child_wave_right 1811} {child_wave_colname 369} {child_wave_colvalue 370} {child_wave_col1 0} {child_wave_col2 1}}

# End MDI window settings

gui_set_env TOPLEVELS::TARGET_FRAME(Source) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Schematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(PathSchematic) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(Wave) none
gui_set_env TOPLEVELS::TARGET_FRAME(List) none
gui_set_env TOPLEVELS::TARGET_FRAME(Memory) ${TopLevel.1}
gui_set_env TOPLEVELS::TARGET_FRAME(DriverLoad) none
gui_update_statusbar_target_frame ${TopLevel.1}
gui_update_statusbar_target_frame ${TopLevel.2}

#</WindowLayout>

#<Database>

# DVE Open design session: 

if { [llength [lindex [gui_get_db -design Sim] 0]] == 0 } {
gui_set_env SIMSETUP::SIMARGS {{-ucligui +vc +define+ +lint=PCWM +memcbk}}
gui_set_env SIMSETUP::SIMEXE {dve}
gui_set_env SIMSETUP::ALLOW_POLL {0}
if { ![gui_is_db_opened -db {dve}] } {
gui_sim_run Ucli -exe dve -args {-ucligui +vc +define+ +lint=PCWM +memcbk} -dir ../dct_stage -nosource
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
gui_load_child_values {dut.dct0}
gui_load_child_values {dut.dct0.col0[0]}
gui_load_child_values {dut.dct0.col0[7]}
gui_load_child_values {dut.dct0.col0[6]}


set _session_group_27 Group1
gui_sg_create "$_session_group_27"
set Group1 "$_session_group_27"

gui_sg_addsignal -group "$_session_group_27" { {dut.dct0.col0[0].clk} {dut.dct0.col0[0].rst} {dut.dct0.col0[0].start} {dut.dct0.col0[0].wr_en} {dut.dct0.col0[0].data_in} {dut.dct0.col0[0].approx_en} {dut.dct0.col0[0].done} {dut.dct0.col0[0].data_out} {dut.dct0.col0[0].m} {dut.dct0.col0[0].cnt} {dut.dct0.col0[0].n_cnt} {dut.dct0.col0[0].next_done} {dut.dct0.col0[0].sum} {dut.dct0.col0[0].next_data_out} {dut.dct0.col0[0].sum_scaled} {dut.dct0.col0[0].SIZE} {dut.dct0.col0[0].APPROX_BITS} {dut.dct0.col0[0].SIZE_MULT} {dut.dct0.col0[0].SIZE_OUT} {dut.dct0.col0[0].dct_coeff} }
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[0].SIZE}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[0].SIZE}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[0].APPROX_BITS}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[0].APPROX_BITS}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[0].SIZE_MULT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[0].SIZE_MULT}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[0].SIZE_OUT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[0].SIZE_OUT}}
gui_set_radix -radix {unsigned} -signals {{Sim:dut.dct0.col0[0].dct_coeff}}

set _session_group_28 Group2
gui_sg_create "$_session_group_28"
set Group2 "$_session_group_28"

gui_sg_addsignal -group "$_session_group_28" { dut.dct0.data_in dut.dct0.dct_en dut.dct0.approx_en dut.dct0.clk dut.dct0.rst dut.dct0.data_out dut.dct0.dct_stage_done dut.dct0.wr_en dut.dct0.start_internal dut.dct0.start_cols dut.dct0.done_cols dut.dct0.data_out_internal dut.dct0.col_cnt dut.dct0.n_col_cnt }

set _session_group_29 {col0[6]}
gui_sg_create "$_session_group_29"
set {col0[6]} "$_session_group_29"

gui_sg_addsignal -group "$_session_group_29" { {dut.dct0.col0[6].APPROX_BITS} {dut.dct0.col0[6].SIZE_OUT} {dut.dct0.col0[6].approx_en} {dut.dct0.col0[6].cnt} {dut.dct0.col0[6].next_done} {dut.dct0.col0[6].next_data_out} {dut.dct0.col0[6].sum} {dut.dct0.col0[6].n_cnt} {dut.dct0.col0[6].data_out} {dut.dct0.col0[6].dct_coeff} {dut.dct0.col0[6].SIZE} {dut.dct0.col0[6].m} {dut.dct0.col0[6].data_in} {dut.dct0.col0[6].wr_en} {dut.dct0.col0[6].clk} {dut.dct0.col0[6].sum_scaled} {dut.dct0.col0[6].done} {dut.dct0.col0[6].start} {dut.dct0.col0[6].SIZE_MULT} {dut.dct0.col0[6].rst} }
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[6].APPROX_BITS}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[6].APPROX_BITS}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[6].SIZE_OUT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[6].SIZE_OUT}}
gui_set_radix -radix enum -signals {{Sim:dut.dct0.col0[6].dct_coeff}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[6].SIZE}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[6].SIZE}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[6].SIZE_MULT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[6].SIZE_MULT}}

set _session_group_30 {col0[7]}
gui_sg_create "$_session_group_30"
set {col0[7]} "$_session_group_30"

gui_sg_addsignal -group "$_session_group_30" { {dut.dct0.col0[7].APPROX_BITS} {dut.dct0.col0[7].SIZE_OUT} {dut.dct0.col0[7].approx_en} {dut.dct0.col0[7].cnt} {dut.dct0.col0[7].next_done} {dut.dct0.col0[7].next_data_out} {dut.dct0.col0[7].sum} {dut.dct0.col0[7].n_cnt} {dut.dct0.col0[7].data_out} {dut.dct0.col0[7].dct_coeff} {dut.dct0.col0[7].SIZE} {dut.dct0.col0[7].m} {dut.dct0.col0[7].data_in} {dut.dct0.col0[7].wr_en} {dut.dct0.col0[7].clk} {dut.dct0.col0[7].sum_scaled} {dut.dct0.col0[7].done} {dut.dct0.col0[7].start} {dut.dct0.col0[7].SIZE_MULT} {dut.dct0.col0[7].rst} }
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[7].APPROX_BITS}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[7].APPROX_BITS}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[7].SIZE_OUT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[7].SIZE_OUT}}
gui_set_radix -radix enum -signals {{Sim:dut.dct0.col0[7].dct_coeff}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[7].SIZE}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[7].SIZE}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.dct0.col0[7].SIZE_MULT}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.dct0.col0[7].SIZE_MULT}}

# Global: Highlighting

# Global: Stack
gui_change_stack_mode -mode list

# Post database loading setting...

# Restore C1 time
gui_set_time -C1_only 6035



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
catch {gui_list_expand -id ${Hier.1} dut.dct0}
catch {gui_list_select -id ${Hier.1} {{dut.dct0.col0[6]}}}
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Data 'Data.1'
gui_list_set_filter -id ${Data.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {LowPower 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Data.1} -text {*}
gui_list_show_data -id ${Data.1} {dut.dct0.col0[7]}
gui_view_scroll -id ${Data.1} -vertical -set 0
gui_view_scroll -id ${Data.1} -horizontal -set 0
gui_view_scroll -id ${Hier.1} -vertical -set 0
gui_view_scroll -id ${Hier.1} -horizontal -set 0

# Source 'Source.1'
gui_src_value_annotate -id ${Source.1} -switch false
gui_set_env TOGGLE::VALUEANNOTATE 0
gui_open_source -id ${Source.1}  -replace -active dut dct_stage1_tb.v
gui_view_scroll -id ${Source.1} -vertical -set 0
gui_src_set_reusable -id ${Source.1}

# View 'Wave.1'
gui_wv_sync -id ${Wave.1} -switch false
set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 417
gui_list_add_group -id ${Wave.1} -after {New Group} {Group1}
gui_list_add_group -id ${Wave.1} -after {New Group} {Group2}
gui_list_add_group -id ${Wave.1} -after {New Group} {{col0[6]}}
gui_list_add_group -id ${Wave.1} -after {New Group} {{col0[7]}}
gui_list_expand -id ${Wave.1} {dut.dct0.col0[0].data_out}
gui_list_expand -id ${Wave.1} {dut.dct0.col0[0].sum_scaled}
gui_list_expand -id ${Wave.1} dut.dct0.wr_en
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[7]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[7]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[7]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[6]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[6]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[6]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[5]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[5]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[5]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[4]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[4]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[4]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[3]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[3]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[3]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[2]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[2]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[2]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[1]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[1]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[1]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].data_out[0]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].data_out[0]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].data_out[0]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[7]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[7]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[7]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[6]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[6]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[6]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[5]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[5]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[5]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[4]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[4]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[4]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[3]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[3]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[3]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[2]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[2]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[2]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[1]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[1]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[1]}}
gui_set_radix -radix unsigned -signal {{dut.dct0.col0[0].sum_scaled[0]}}
gui_set_radix -radix decimal -signal {{dut.dct0.col0[0].sum_scaled[0]}}
gui_set_radix -radix twosComplement -signal {{dut.dct0.col0[0].sum_scaled[0]}}
gui_seek_criteria -id ${Wave.1} {Any Edge}



gui_set_env TOGGLE::DEFAULT_WAVE_WINDOW ${Wave.1}
gui_set_pref_value -category Wave -key exclusiveSG -value $groupExD
gui_list_set_height -id Wave -height $origWaveHeight
if {$origGroupCreationState} {
	gui_list_create_group_when_add -wave -enable
}
if { $groupExD } {
 gui_msg_report -code DVWW028
}
gui_list_set_filter -id ${Wave.1} -list { {Buffer 1} {Input 1} {Others 1} {Linkage 1} {Output 1} {Parameter 1} {All 1} {Aggregate 1} {LibBaseMember 1} {Event 1} {Assertion 1} {Constant 1} {Interface 1} {BaseMembers 1} {Signal 1} {$unit 1} {Inout 1} {Variable 1} }
gui_list_set_filter -id ${Wave.1} -text {*}
gui_list_set_insertion_bar  -id ${Wave.1} -group {col0[7]}  -position in

gui_marker_move -id ${Wave.1} {C1} 6035
gui_view_scroll -id ${Wave.1} -vertical -set 1359
gui_show_grid -id ${Wave.1} -enable false
# Restore toplevel window zorder
# The toplevel window could be closed if it has no view/pane
if {[gui_exist_window -window ${TopLevel.1}]} {
	gui_set_active_window -window ${TopLevel.1}
	gui_set_active_window -window ${Source.1}
	gui_set_active_window -window ${HSPane.1}
}
if {[gui_exist_window -window ${TopLevel.2}]} {
	gui_set_active_window -window ${TopLevel.2}
	gui_set_active_window -window ${Wave.1}
}
#</Session>

