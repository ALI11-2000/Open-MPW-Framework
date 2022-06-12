%: %.v %.tlv
	iverilog -o $@.vvp $@.v
	vvp $@.vvp
	makerchip --vcd $@.vcd $@.tlv

clean:
	rm -rf *.tlv.bak *.vcd *.vvp