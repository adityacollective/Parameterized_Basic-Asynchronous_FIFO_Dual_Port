module fifo_status_unit #(parameter stk_ptr_width = 3, stk_height = 8, 
                                    hf_level = stk_height >> 1,
                                    af_level = (stk_height - hf_level) >> 1,
                                    ae_level = hf_level >> 1)(
                                    
                            output [stk_ptr_width-1 : 0]  write_ptr,
                            output [stk_ptr_width-1 : 0]  read_ptr,
                            output                        stk_full, stk_almost_full, stk_half_full,
                                                          stk_almost_empty, stk_empty,
                            input                         write_to_stk, read_fr_stk,
                            input                         clk_write, clk_read, rst
                          );
  wire [stk_ptr_width-1 : 0] wr_cntr;
  wire [stk_ptr_width-1 : 0] wr_cntr_g;
  wire [stk_ptr_width-1 : 0] rd_cntr;
  wire [stk_ptr_width-1 : 0] ptr_gap = wr_cntr - rd_cntr;
  
  assign stk_full = (ptr_gap == stk_height) || rst;
  assign stk_almost_full = ((wr_cntr - rd_cntr) == af_level) || rst;
  assign stk_half_full = ((wr_cntr - rd_cntr) == hf_level) || rst;
  assign stk_almost_empty = ((wr_cntr - rd_cntr) == ae_level) || rst;
  assign stk_empty = (write_ptr == rd_cntr) || rst;
  
  wr_cntr_unit m0(wr_cntr, write_ptr, write_to_stk, clk_write, rst);
  rd_cntr_unit m1(rd_cntr, read_ptr, read_fr_stk, clk_read, rst);
endmodule