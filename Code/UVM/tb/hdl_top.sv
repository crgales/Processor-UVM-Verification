`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"

import processor_test_pkg::*;

module hdl_top;
  bit clk;
  
  //clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Instantiate the interface
  processor_interface processor_if(clk);

	// Instantiate dut
  Main_Processor dut(
    .inst_in(processor_if.inst_in),
	  .clk(processor_if.clk),
	  .pc_out(processor_if.pc),
	  .inst_out_tb(processor_if.inst_out),
	  .wD_rf(processor_if.reg_data),
	  .w_en(processor_if.reg_en),
	  .aD_rf(processor_if.reg_add),
	  .mem_data_tb(processor_if.mem_data),
	  .mem_en_tb(processor_if.mem_en),
	  .mem_add_tb(processor_if.mem_add) 
	);  

  initial begin
    // Place the interface into the UVM configuration database
    uvm_config_db#(virtual processor_interface)::set(null, "*", "processor_vif", processor_if);
    
    // Start the test
    run_test();
  end

endmodule
