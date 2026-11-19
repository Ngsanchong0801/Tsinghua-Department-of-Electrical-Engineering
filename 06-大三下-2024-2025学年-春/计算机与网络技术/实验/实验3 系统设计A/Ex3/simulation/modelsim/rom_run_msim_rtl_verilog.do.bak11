transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/cpurom.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/ROM.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/addrGen.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/regfile.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/alu.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/flag.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/mux2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/mux1.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/controller.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/cpuC.v}

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex3 {E:/QuartusPrime/Computer and Network Technology/Ex3/cpuC_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  cpuC_tb

add wave *
view structure
view signals
run -all
