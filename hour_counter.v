module hour_counter(
  input clk,
  input reset,
  output reg [4:0] hours
);

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      hours <= 0;
    end else begin
      if (hours == 5'b101 && minutes == 5'b1111 && seconds == 5'b11111) begin
        hours <= 0;
      end else begin
        hours <= hours + 1;
      end
    end
  end

endmodule
