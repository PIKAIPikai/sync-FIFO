sim:
	cd script && ./gen.sh
	cd work && vcs -full64 -f ../script/filelist.f -P \
	/opt/Synopsys/verdi/T-2022.06-SP2/share/PLI/VCS/LINUX64/novas.tab \
	/opt/Synopsys/verdi/T-2022.06-SP2/share/PLI/VCS/LINUX64/pli.a \
	-o ./simv -l novas.log
	cd work && ./simv

clean:
	rm -rf work/*

verdi:
	cd work && verdi -f ../script/filelist.f -ssf *.fsdb
