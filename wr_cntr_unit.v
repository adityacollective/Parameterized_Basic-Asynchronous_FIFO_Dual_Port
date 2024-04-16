module wr_cntr_unit #(parameter stk_ptr_width = 3)(
                       output reg [stk_ptr_width : 0] wr_cntr,
                       output     [stk_ptr_width-1 : 0] write_ptr,
                       input      write_to_stk, clk_write, rst
);
  assign write_ptr = wr_cntr[stk_ptr_width-1 : 0];
  
  always@(posedge clk_write, posedge rst)
    if(rst) begin
      wr_cntr <= 0;
    end
    else begin wr_cntr <= wr_cntr + 1;
    end
endmodule