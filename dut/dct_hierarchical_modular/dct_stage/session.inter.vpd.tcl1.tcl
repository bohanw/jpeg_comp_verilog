# Begin_DVE_Session_Save_Info
# DVE view(Wave.1 ) session
# Saved on Mon Feb 27 17:03:46 2017
# Toplevel windows open: 2
# 	TopLevel.1
# 	TopLevel.2
#   Wave.1: 9 signals
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#<Session mode="View" path="/afs/umich.edu/class/eecs627/w17/group5/PROJECT/jpeg_verilog/verilog/dct_hierarchical/dct_stage/session.inter.vpd.tcl1.tcl" type="Debug">

#<Database>

gui_set_time_units 1s
#</Database>

# DVE View/pane content session: 

# Begin_DVE_Session_Save_Info (Wave.1)
# DVE wave signals session
# Saved on Mon Feb 27 17:03:46 2017
# 9 signals
# End_DVE_Session_Save_Info

# DVE version: L-2016.06_Full64
# DVE build date: May 24 2016 21:01:02


#Add ncecessay scopes
gui_load_child_values {dut.d0}

gui_set_time_units 1s

set _wave_session_group_1 Group1
if {[gui_sg_is_group -name "$_wave_session_group_1"]} {
    set _wave_session_group_1 [gui_sg_generate_new_name]
}
set Group1 "$_wave_session_group_1"

gui_sg_addsignal -group "$_wave_session_group_1" { {Sim:dut.clk} {Sim:dut.rst} {Sim:dut.data_in} {Sim:dut.data_out} {Sim:dut.sum} {Sim:dut.data_out_ref} {Sim:dut.d0.m} }
gui_set_radix -radix {decimal} -signals {Sim:dut.data_out_ref}
gui_set_radix -radix {twosComplement} -signals {Sim:dut.data_out_ref}

set _wave_session_group_2 Group2
if {[gui_sg_is_group -name "$_wave_session_group_2"]} {
    set _wave_session_group_2 [gui_sg_generate_new_name]
}
set Group2 "$_wave_session_group_2"

gui_sg_addsignal -group "$_wave_session_group_2" { {Sim:dut.d0.sum_scaled} {Sim:dut.data_out_ref_scale} }
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
gui_wv_zoom_timerange -id ${Wave.1} 0 300
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group1}]
gui_list_add_group -id ${Wave.1} -after {New Group} [list ${Group2}]
gui_list_expand -id ${Wave.1} dut.data_in
gui_list_expand -id ${Wave.1} dut.sum
gui_list_expand -id ${Wave.1} dut.data_out_ref
gui_list_expand -id ${Wave.1} dut.d0.m
gui_list_expand -id ${Wave.1} dut.d0.sum_scaled
gui_list_expand -id ${Wave.1} dut.data_out_ref_scale
gui_list_select -id ${Wave.1} {{dut.d0.sum_scaled[3]} }
gui_set_radix -radix unsigned -signal {{dut.data_in[7]}}
gui_set_radix -radix decimal -signal {{dut.data_in[7]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[7]}}
gui_set_radix -radix unsigned -signal {{dut.data_in[6]}}
gui_set_radix -radix decimal -signal {{dut.data_in[6]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[6]}}
gui_set_radix -radix unsigned -signal {{dut.data_in[5]}}
gui_set_radix -radix decimal -signal {{dut.data_in[5]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[5]}}
gui_set_radix -radix unsigned -signal {{dut.data_in[4]}}
gui_set_radix -radix decimal -signal {{dut.data_in[4]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[4]}}
gui_set_radix -radix unsigned -signal {{dut.data_in[3]}}
gui_set_radix -radix decimal -signal {{dut.data_in[3]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[3]}}
gui_set_radix -radix unsigned -signal {{dut.data_in[2]}}
gui_set_radix -radix decimal -signal {{dut.data_in[2]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[2]}}
gui_set_radix -radix unsigned -signal {{dut.data_in[1]}}
gui_set_radix -radix decimal -signal {{dut.data_in[1]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[1]}}
gui_set_radix -radix unsigned -signal {{dut.data_in[0]}}
gui_set_radix -radix decimal -signal {{dut.data_in[0]}}
gui_set_radix -radix twosComplement -signal {{dut.data_in[0]}}
gui_set_radix -radix unsigned -signal {{dut.sum[7]}}
gui_set_radix -radix decimal -signal {{dut.sum[7]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[7]}}
gui_set_radix -radix unsigned -signal {{dut.sum[6]}}
gui_set_radix -radix decimal -signal {{dut.sum[6]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[6]}}
gui_set_radix -radix unsigned -signal {{dut.sum[5]}}
gui_set_radix -radix decimal -signal {{dut.sum[5]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[5]}}
gui_set_radix -radix unsigned -signal {{dut.sum[4]}}
gui_set_radix -radix decimal -signal {{dut.sum[4]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[4]}}
gui_set_radix -radix unsigned -signal {{dut.sum[3]}}
gui_set_radix -radix decimal -signal {{dut.sum[3]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[3]}}
gui_set_radix -radix unsigned -signal {{dut.sum[2]}}
gui_set_radix -radix decimal -signal {{dut.sum[2]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[2]}}
gui_set_radix -radix unsigned -signal {{dut.sum[1]}}
gui_set_radix -radix decimal -signal {{dut.sum[1]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[1]}}
gui_set_radix -radix unsigned -signal {{dut.sum[0]}}
gui_set_radix -radix decimal -signal {{dut.sum[0]}}
gui_set_radix -radix twosComplement -signal {{dut.sum[0]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[7]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[7]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref[7]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[6]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[6]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref[6]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[5]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[5]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref[5]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[4]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[4]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref[4]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[3]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[3]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[3]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[2]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[2]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref[2]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[1]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[1]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref[1]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref[0]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref[0]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref[0]}}
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
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[7]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[7]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[7]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[6]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[6]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[6]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[5]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[5]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[5]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[4]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[4]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[4]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[3]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[3]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[3]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[2]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[2]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[2]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[1]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[1]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[1]}}
gui_set_radix -radix unsigned -signal {{dut.data_out_ref_scale[0]}}
gui_set_radix -radix decimal -signal {{dut.data_out_ref_scale[0]}}
gui_set_radix -radix twosComplement -signal {{dut.data_out_ref_scale[0]}}
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
gui_list_set_insertion_bar  -id ${Wave.1} -group ${Group2}  -item {dut.data_out_ref_scale[0][10:0]} -position below

gui_marker_move -id ${Wave.1} {C1} 140
gui_view_scroll -id ${Wave.1} -vertical -set 284
gui_show_grid -id ${Wave.1} -enable false
#</Session>

