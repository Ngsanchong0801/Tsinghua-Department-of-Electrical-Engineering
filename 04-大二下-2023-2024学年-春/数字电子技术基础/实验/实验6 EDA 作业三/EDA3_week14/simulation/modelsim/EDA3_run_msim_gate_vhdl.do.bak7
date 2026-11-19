transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {EDA3.vho}

vlog -vlog01compat -work work +incdir+W:/altera/13.0/Digital\ Electronics/EDA3/EDA3_week14 {W:/altera/13.0/Digital Electronics/EDA3/EDA3_week14/EDA3_testbench.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=EDA3_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  EDA3_testbench

add wave *
view structure
view signals
run -all
