transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/cpurom.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/regfile.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/alu.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/cpuram.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/flag.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/mux2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/mux1.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/PC.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/controller2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/cpuF.v}

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex5 {E:/QuartusPrime/Computer and Network Technology/Ex5/cpuF_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  cpuF_tb

add wave *
view structure
view signals
run -all
