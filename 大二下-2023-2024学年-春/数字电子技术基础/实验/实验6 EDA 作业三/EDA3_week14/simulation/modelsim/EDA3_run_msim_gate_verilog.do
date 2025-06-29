transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {EDA3.vo}

vlog -vlog01compat -work work +incdir+E:/altera/13.0/Digital\ Electronics/EDA3/EDA3_week14 {E:/altera/13.0/Digital Electronics/EDA3/EDA3_week14/EDA3_testbench.v}

vsim -t 1ps -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  EDA3_testbench

add wave *
view structure
view signals
run -all
