module minute_counter(
  input clk,
  input reset,
  output reg [5:0] minutes
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      minutes <= 0;
    end else begin
      if (minutes == 5'b1111 && seconds == 5'b11111) begin
        minutes <= 0;
      end else begin
        minutes <= minutes + 1;
      end
    end
  end

endmodule
