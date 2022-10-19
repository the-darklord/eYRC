transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/sahas/Desktop/PWM {C:/Users/sahas/Desktop/PWM/PWM_Generator.v}

vlog -sv -work work +incdir+C:/Users/sahas/Desktop/PWM/simulation/modelsim {C:/Users/sahas/Desktop/PWM/simulation/modelsim/PWM_Generator_Verilog_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  PWM_Generator_Verilog_tb

add wave *
view structure
view signals
run 9000 ns
