debImport "-f" "../script/filelist.f"
debLoadSimResult /home/user/Desktop/pk/3.sync_fifo/work/sync_fifo.fsdb
wvCreateWindow
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -line 10 -pos 1 -win $_nTrace1
srcSelect -signal "rst_n" -line 11 -pos 1 -win $_nTrace1
srcSelect -signal "wren" -line 12 -pos 1 -win $_nTrace1
srcSelect -signal "wdata" -line 13 -pos 1 -win $_nTrace1
srcSelect -signal "rden" -line 14 -pos 1 -win $_nTrace1
srcSelect -signal "rdata" -line 15 -pos 1 -win $_nTrace1
srcSelect -signal "full" -line 16 -pos 1 -win $_nTrace1
srcSelect -signal "empty" -line 17 -pos 1 -win $_nTrace1
wvAddSignal -win $_nWave2 "/tb_sync_fifo/clk" "/tb_sync_fifo/rst_n" \
           "/tb_sync_fifo/wren" "/tb_sync_fifo/wdata\[7:0\]" \
           "/tb_sync_fifo/rden" "/tb_sync_fifo/rdata\[7:0\]" \
           "/tb_sync_fifo/full" "/tb_sync_fifo/empty"
wvSetPosition -win $_nWave2 {("G1" 0)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
verdiSetActWin -win $_nWave2
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 5 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectGroup -win $_nWave2 {G2}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 7)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G2" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSelectGroup -win $_nWave2 {G3}
wvSelectGroup -win $_nWave2 {G3}
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 3 4 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G2" 1)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSetPosition -win $_nWave2 {("G3" 3)}
wvSelectGroup -win $_nWave2 {G4}
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 1 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSelectSignal -win $_nWave2 {( "G2" 2 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSelectSignal -win $_nWave2 {( "G3" 1 )} 
wvSelectSignal -win $_nWave2 {( "G3" 2 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSelectSignal -win $_nWave2 {( "G3" 3 )} 
wvSetRadix -win $_nWave2 -format UDec
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
srcHBSelect "tb_sync_fifo.u_sync_fifo" -win $_nTrace1
srcSetScope "tb_sync_fifo.u_sync_fifo" -delim "." -win $_nTrace1
srcHBSelect "tb_sync_fifo.u_sync_fifo" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcDeselectAll -win $_nTrace1
debExit
