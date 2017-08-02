# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Tue Feb 28 15:04:33 2017
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 20 signals
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#<Session mode="View" path="/afs/umich.edu/class/eecs627/w17/group5/PROJECT/jpeg_verilog/verilog/dct_hierarchical/dct_stage/session.inter.vpd.tcl3.tcl_wave.tcl" type="Debug">

#<Database>

gui_set_time_units 1s
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Tue Feb 28 15:04:33 2017
# 20 signals
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#Add ncecessay scopes

gui_set_time_units 1s

set _wave_session_group_1 Group3
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:dut.d0.clk} {Sim:dut.d0.wr_en} {Sim:dut.d0.start} {Sim:dut.d0.cnt} {Sim:dut.d0.n_cnt} {Sim:dut.d0.done} {Sim:dut.d0.next_done} {Sim:dut.d0.sum} {Sim:dut.d0.sum_scaled[7]} {Sim:dut.d0.sum_scaled[6]} {Sim:dut.d0.sum_scaled[5]} {Sim:dut.d0.sum_scaled[4]} {Sim:dut.d0.sum_scaled[3]} {Sim:dut.d0.sum_scaled[2]} {Sim:dut.d0.sum_scaled[1]} {Sim:dut.d0.sum_scaled[0]} {Sim:dut.d0.next_data_out} {Sim:dut.d0.data_out} {Sim:dut.d0.data_in} {Sim:dut.d0.sum_scaled} }
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.cnt}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.cnt}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.n_cnt}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.n_cnt}
gui_set_radix -radix {unsigned} -signals {Sim:dut.d0.sum}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[7]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[7]}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[6]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[6]}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[5]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[5]}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[4]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[4]}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[3]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[3]}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[2]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[2]}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[1]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[1]}}
gui_set_radix -radix {decimal} -signals {{Sim:dut.d0.sum_scaled[0]}}
gui_set_radix -radix {twosComplement} -signals {{Sim:dut.d0.sum_scaled[0]}}
gui_set_radix -radix {unsigned} -signals {Sim:dut.d0.data_out}
gui_set_radix -radix {unsigned} -signals {Sim:dut.d0.data_in}
gui_set_radix -radix {decimal} -signals {Sim:dut.d0.sum_scaled}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.d0.sum_scaled}
if {![info exists useOldWindow]} { 
	set useOldWindow true
}
if {$useOldWindow && [string first "Wave" [gui_get_current_window -view]]==0} { 
	set Wave.1 [gui_get_current_window -view] 
} else {
	set Wave.1 [lindex [gui_get_window_ids -type Wave] 0]
if {[string first "Wave" ${Wave.1}]!=0} {
gui_open_window Wave
set Wave.1 [ gui_get_current_window -view ]
}
}

set groupExD [gui_get_pref_value -category Wave -key exclusiveSG]
gui_set_pref_value -category Wave -key exclusiveSG -value {false}
set origWaveHeight [gui_get_pref_value -category Wave -key waveRowHeight]
gui_list_set_height -id Wave -height 25
set origGroupCreationState [gui_list_create_group_when_add -wave]
gui_list_create_group_when_add -wave -disable
gui_marker_set_ref -id ${Wave.1}  C1
gui_wv_zoom_timerange -id ${Wave.1} 0 700
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_expand -id ${Wave.1} dut.d0.next_data_out
gui_list_expand -id ${Wave.1} dut.d0.data_out
gui_list_expand -id ${Wave.1} dut.d0.data_in
gui_list_expand -id ${Wave.1} dut.d0.sum_scaled
gui_list_select -id ${Wave.1} {dut.d0.done }
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[7]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[7]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[7]}}
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[6]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[6]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[6]}}
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[5]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[5]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[5]}}
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[4]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[4]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[4]}}
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[3]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[3]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[3]}}
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[2]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[2]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[2]}}
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[1]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[1]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[1]}}
gui_set_radix -radix unsigned -signal {{dut.d0.next_data_out[0]}}
gui_set_radix -radix decimal -signal {{dut.d0.next_data_out[0]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.next_data_out[0]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[7]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[7]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[7]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[6]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[6]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[6]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[5]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[5]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[5]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[4]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[4]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[4]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[3]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[3]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[3]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[2]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[2]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[2]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[1]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[1]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[1]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_out[0]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_out[0]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_out[0]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[7]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[7]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[7]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[6]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[6]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[6]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[5]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[5]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[5]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[4]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[4]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[4]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[3]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[3]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[3]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[2]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[2]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[2]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[1]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[1]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[1]}}
gui_set_radix -radix unsigned -signal {{dut.d0.data_in[0]}}
gui_set_radix -radix decimal -signal {{dut.d0.data_in[0]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.data_in[0]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[7]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[7]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[7]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[6]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[6]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[6]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[5]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[5]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[5]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[4]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[4]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[4]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[3]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[3]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[3]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[2]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[2]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[2]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[1]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[1]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[1]}}
gui_set_radix -radix unsigned -signal {{dut.d0.sum_scaled[0]}}
gui_set_radix -radix decimal -signal {{dut.d0.sum_scaled[0]}}
gui_set_radix -radix twosComplement -signal {{dut.d0.sum_scaled[0]}}
gui_seek_criteria -id ${Wave.1} {Any Edge}


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
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group1}  -item {dut.d0.sum_scaled[0][10:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 146
gui_view_scroll -id ${Wave.1} -vertical -set 0
gui_show_grid -id ${Wave.1} -enable false
#</Session>

