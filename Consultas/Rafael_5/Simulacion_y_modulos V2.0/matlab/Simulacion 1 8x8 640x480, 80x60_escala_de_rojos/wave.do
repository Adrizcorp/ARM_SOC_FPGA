onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /simulacion_test_busqueda/clk
add wave -noupdate /simulacion_test_busqueda/start
add wave -noupdate -color Red /simulacion_test_busqueda/finish
add wave -noupdate /simulacion_test_busqueda/idle
add wave -noupdate /simulacion_test_busqueda/vector_wait_fifo_sig
add wave -noupdate /simulacion_test_busqueda/img_wait_fifo_sig
add wave -noupdate -radix hexadecimal /simulacion_test_busqueda/vector_me_sig
add wave -noupdate -radix hexadecimal /simulacion_test_busqueda/img_mb_sig
add wave -noupdate /simulacion_test_busqueda/img_wr_req_sig
add wave -noupdate /simulacion_test_busqueda/vector_wr_req_sig
add wave -noupdate -radix hexadecimal /simulacion_test_busqueda/data_rd_img_ref_sig
add wave -noupdate -radix hexadecimal /simulacion_test_busqueda/data_rd_img_Act_sig
add wave -noupdate -radix decimal /simulacion_test_busqueda/add_write_img_ref_sig
add wave -noupdate -radix decimal /simulacion_test_busqueda/add_read_img_ref_sig
add wave -noupdate /simulacion_test_busqueda/wr_enable_ref_sig
add wave -noupdate -radix hexadecimal /simulacion_test_busqueda/data_wr_img_ref_sig
add wave -noupdate /simulacion_test_busqueda/wr_enable_act_sig
add wave -noupdate -radix decimal /simulacion_test_busqueda/add_read_img_act_sig
add wave -noupdate -radix decimal /simulacion_test_busqueda/add_write_img_act_sig
add wave -noupdate -radix hexadecimal /simulacion_test_busqueda/data_wr_img_Act_sig
add wave -noupdate /simulacion_test_busqueda/real_state
add wave -noupdate -radix decimal /simulacion_test_busqueda/_realref
add wave -noupdate -radix unsigned /simulacion_test_busqueda/_realact
add wave -noupdate -radix unsigned /simulacion_test_busqueda/window_limit
add wave -noupdate -radix hexadecimal -childformat {{{/simulacion_test_busqueda/vector_me_sig_reg[27]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[26]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[25]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[24]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[23]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[22]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[21]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[20]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[19]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[18]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[17]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[16]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[15]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[14]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[13]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[12]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[11]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[10]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[9]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[8]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[7]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[6]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[5]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[4]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[3]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[2]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[1]} -radix hexadecimal} {{/simulacion_test_busqueda/vector_me_sig_reg[0]} -radix hexadecimal}} -subitemconfig {{/simulacion_test_busqueda/vector_me_sig_reg[27]} {-radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[26]} {-radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[25]} {-radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[24]} {-radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[23]} {-radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[22]} {-radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[21]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[20]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[19]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[18]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[17]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[16]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[15]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[14]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[13]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[12]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[11]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[10]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[9]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[8]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[7]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[6]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[5]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[4]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[3]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[2]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[1]} {-height 15 -radix hexadecimal} {/simulacion_test_busqueda/vector_me_sig_reg[0]} {-height 15 -radix hexadecimal}} /simulacion_test_busqueda/vector_me_sig_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8543495348 ps} 0} {{Cursor 2} {8119581457 ps} 0} {{Cursor 3} {16723604089 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 314
configure wave -valuecolwidth 38
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {10500021 ns}
