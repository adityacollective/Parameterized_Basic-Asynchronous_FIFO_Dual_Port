module fifo_control_unit(
    output write_to_stk, read_fr_stk,
    input  write, read, stk_full, stk_empty
);
  assign write_to_stk = write && (!stk_full);
  assign read_fr_stk = read && (!stk_empty);
endmodule
