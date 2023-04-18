module clock_divider(
  input clk,
  input reset,
  output reg div
);

  reg [24:0] count = 0;

  always @(posedge clk) begin
    if (reset) begin
      count <= 0;
      div <= 0;
    end else begin
      count <= count + 1;
      if (count == 50000000) begin
        count <= 0;
        div <= ~div;
      end
    end
  end

endmodule