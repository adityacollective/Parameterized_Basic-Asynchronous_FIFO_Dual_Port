module rd_cntr_unit #(parameter stk_ptr_width = 3)(
                       output reg [stk_ptr_width : 0] rd_cntr,
                       output     [stk_ptr_width-1 : 0] read_ptr,
                       input      read_fr_stk, clk_read, rst
);
  assign read_ptr = rd_cntr[stk_ptr_width-1 : 0];
  
  always@(posedge clk_read, posedge rst)
    if(rst) begin
      rd_cntr <= 0;
    end
    else begin rd_cntr <= rd_cntr + 1;
    end
endmodule