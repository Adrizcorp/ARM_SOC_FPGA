onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /simulacion_test_busqueda/clk
add wave -noupdate /simulacion_test_busqueda/start
add wave -noupdate /simulacion_test_busqueda/finish
add wave -noupdate /simulacion_test_busqueda/idle
add wave -noupdate /simulacion_test_busqueda/vector_wait_fifo_sig
add wave -noupdate /simulacion_test_busqueda/img_wait_fifo_sig
add wave -noupdate /simulacion_test_busqueda/vector_me_sig
add wave -noupdate /simulacion_test_busqueda/img_mb_sig
add wave -noupdate /simulacion_test_busqueda/img_wr_req_sig
add wave -noupdate /simulacion_test_busqueda/vector_wr_req_sig
add wave -noupdate /simulacion_test_busqueda/real_state
add wave -noupdate /simulacion_test_busqueda/_realref
add wave -noupdate /simulacion_test_busqueda/_realact
add wave -noupdate /simulacion_test_busqueda/window_limit
add wave -noupdate /simulacion_test_busqueda/vector_me_sig_reg
add wave -noupdate /simulacion_test_busqueda/data_rd_img_ref_sig
add wave -noupdate /simulacion_test_busqueda/data_rd_img_Act_sig
add wave -noupdate /simulacion_test_busqueda/add_write_img_ref_sig
add wave -noupdate /simulacion_test_busqueda/add_read_img_ref_sig
add wave -noupdate /simulacion_test_busqueda/wr_enable_ref_sig
add wave -noupdate /simulacion_test_busqueda/wr_enable_act_sig
add wave -noupdate /simulacion_test_busqueda/add_read_img_act_sig
add wave -noupdate /simulacion_test_busqueda/add_write_img_act_sig
add wave -noupdate /simulacion_test_busqueda/data_wr_img_ref_sig
add wave -noupdate /simulacion_test_busqueda/data_wr_img_Act_sig
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {52463840000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 283
configure wave -valuecolwidth 100
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
WaveRestoreZoom {40050000100 ps} {61050042100 ps}
