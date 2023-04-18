module second_counter(
  input clk,
  input reset,
  output reg [5:0] seconds
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      seconds <= 0;
    end else begin
      seconds <= seconds + 1;
    end
  end

endmodule
