MODE=puresim

UVM_VERBOSITY = UVM_HIGH
DUT_DIR = ../rtl/Processor
TEST_DIR = .
TEST_NAME = processor_test
SEED = 14788478
DUT_SOURCES = \
	$(DUT_DIR)/Main_Processor.v \
	$(DUT_DIR)/Adder.v \
	$(DUT_DIR)/adder_internal.v \
	$(DUT_DIR)/ALU.v \
	$(DUT_DIR)/black_box.v \
	$(DUT_DIR)/comp.v \
	$(DUT_DIR)/Control_Unit.v \
	$(DUT_DIR)/data_mem.v \
	$(DUT_DIR)/full_adder.v \
	$(DUT_DIR)/grey_box.v \
	$(DUT_DIR)/halfadder.v \
	$(DUT_DIR)/inst_mem.v \
	$(DUT_DIR)/mux2_1_1bit.v \
	$(DUT_DIR)/mux4_1_16bit.v \
	$(DUT_DIR)/reg_file.v \
	$(DUT_DIR)/wallace_8bit.v 

DUT_TEST = \
	+incdir+$(DUT_DIR) $(DUT_DIR)/stg_final.v 

TB_SOURCES = ../UVM/tb/hdl_top.sv

PROCESSOR_AGENT_SOURCES = +incdir+../UVM/agents/processor_agent ../UVM/agents/processor_agent/processor_agent_pkg.sv ../UVM/agents/processor_agent/processor_interface.sv
ENV_SOURCES = +incdir+../UVM/envs ../UVM/envs/processor_env_pkg.sv
TEST_SOURCES = +incdir+../UVM/tests ../UVM/tests/processor_test_pkg.sv


all: comp opt sim

comp:
	vlog $(DUT_SOURCES)
	vlog $(PROCESSOR_AGENT_SOURCES)
	vlog $(ENV_SOURCES)
	vlog $(TEST_SOURCES)
	vlog $(TB_SOURCES)

opt:
	vopt -quiet -o top_opt hdl_top +designfile -debug

sim:
	vsim -c -quiet top_opt +UVM_TESTNAME=$(TEST_NAME) -qwavedb=+signal -do "run -all; quit"

clean:
	rm -rf work transcript qwave.db design.bin