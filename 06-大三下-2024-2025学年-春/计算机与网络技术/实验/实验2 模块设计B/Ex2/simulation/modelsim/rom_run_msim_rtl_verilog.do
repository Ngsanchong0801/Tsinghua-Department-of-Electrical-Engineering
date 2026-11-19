transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex2 {E:/QuartusPrime/Computer and Network Technology/Ex2/alu.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex2 {E:/QuartusPrime/Computer and Network Technology/Ex2/flag.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex2 {E:/QuartusPrime/Computer and Network Technology/Ex2/cpuA.v}

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex2 {E:/QuartusPrime/Computer and Network Technology/Ex2/cpuA_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  cpuA_tb

add wave *
view structure
view signals
run -all
