module fifo_datapath_unit #(parameter word_width = 32, stk_height = 8, stk_ptr_width = 3)(
  output reg    [word_width-1 : 0]    data_out,
  input         [word_width-1 : 0]    data_in,
  input         [stk_ptr_width-1 : 0] write_ptr, read_ptr,
  input                               write_to_stk, read_fr_stk,
  input                               clk_write, clk_read, rst
  );
  reg           [word_width-1 : 0] stk [stk_height-1 : 0];
  
  always@(posedge clk_write) if(write_to_stk) stk[write_ptr] <= data_in;
  always@(posedge clk_read)  if(read_fr_stk) data_out <= stk[read_ptr];
endmodule