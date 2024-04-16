module fifo_dual_port #(parameter word_width = 32,
                                  stk_ptr_width = 3)(
                                  
                         output [word_width-1 : 0] data_out,
                         output                    stk_full,
                                                   stk_almost_full,
                                                   stk_half_full,
                                                   stk_almost_empty,
                                                   stk_empty,
                         input  [word_width-1 : 0] data_in,
                         input                     write,
                                                   read,
                                                   clk_write,
                                                   clk_read,
                                                   rst
                          );
  wire [stk_ptr_width-1 : 0] write_ptr, read_ptr;
  
  fifo_control_unit Contoller( .write_to_stk(write_to_stk), 
                               .read_fr_stk(read_fr_stk),
                               .write(write),
                               .read(read),
                               .stk_full(stk_full),
                               .stk_empty(stk_empty)
                             );
                             
  fifo_datapath_unit Datapath( .data_out(data_out),
                               .data_in(data_in),
                               .write_ptr(write_ptr),
                               .read_ptr(read_ptr),
                               .write_to_stk(write_to_stk),
                               .read_fr_stk(read_fr_stk),
                               .clk_write(clk_write),
                               .clk_read(clk_read),
                               .rst(rst)
                             );
                             
 fifo_status_unit Status     ( .write_ptr(write_ptr),
                               .read_ptr(read_ptr),
                               .write_to_stk(write_to_stk),
                               .read_fr_stk(read_fr_stk),
                               .clk_write(clk_write),
                               .clk_read(clk_read),
                               .rst(rst)
                             );   
endmodule