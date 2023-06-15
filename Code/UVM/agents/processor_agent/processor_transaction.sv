class processor_transaction extends uvm_sequence_item;

  `uvm_object_utils(processor_transaction)
  
  rand bit [15:0] instrn;
  bit [7:0]pc;
  bit [15:0]inst_out;
  bit [15:0]reg_data;
  bit [1:0]reg_en;
  bit [2:0]reg_add;
  bit [15:0]mem_data;
  bit mem_en;
  bit [2:0]mem_add;

  constraint input_constraint
   {
	//Cosntraint to prevent EOF operation
      instrn inside {[16'h0000:16'hEFFF]};
   }

  function new (string name = "processor_transaction");
    super.new(name);
  endfunction

endclass: processor_transaction
