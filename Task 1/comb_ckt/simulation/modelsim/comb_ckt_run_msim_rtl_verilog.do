transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/sahas/Desktop/comb_ckt {C:/Users/sahas/Desktop/comb_ckt/comb_ckt_verilog.v}
vlog -vlog01compat -work work +incdir+C:/Users/sahas/Desktop/comb_ckt {C:/Users/sahas/Desktop/comb_ckt/Mux_4_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/sahas/Desktop/comb_ckt {C:/Users/sahas/Desktop/comb_ckt/Mux_2_to_1.v}

vlog -vlog01compat -work work +incdir+C:/Users/sahas/Desktop/comb_ckt/simulation/modelsim {C:/Users/sahas/Desktop/comb_ckt/simulation/modelsim/comb_ckt_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  comb_ckt_tb

add wave *
view structure
view signals
run 2000 ps
