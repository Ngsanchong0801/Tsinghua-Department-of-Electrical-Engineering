transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/cpurom2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/regfile2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/alu2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/cpuram2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/flag.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/PC2.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/mux12.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/mux22.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/moveImm.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/cpuG.v}
vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/controller22.v}

vlog -vlog01compat -work work +incdir+E:/QuartusPrime/Computer\ and\ Network\ Technology/Ex6 {E:/QuartusPrime/Computer and Network Technology/Ex6/cpuG_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  cpuG_tb

add wave *
view structure
view signals
run -all
