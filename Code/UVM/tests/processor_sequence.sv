class inst_sequence extends uvm_sequence#(processor_transaction);

  `uvm_object_utils(inst_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  bit [15:0] inst;
//processor_transaction req;
  task body;
    
      req = processor_transaction::type_id::create("req");

      start_item(req);

      if (!req.randomize()) begin
        `uvm_error("Instruction Sequence", "Randomize failed.");
      end
     inst = req.instrn;

      finish_item(req);
    
  endtask: body

endclass: inst_sequence



class processor_sequence extends uvm_sequence#(processor_transaction);

  `uvm_object_utils(processor_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  inst_sequence inst_seq;

  task body;
    
	//LOOP relative to use case (say 256)
     for(int i =0;i<10000;i++) 
     begin
        inst_seq = inst_sequence::type_id::create("inst_seq");
        inst_seq.start(m_sequencer);
     end
     
  endtask: body

endclass: processor_sequence


