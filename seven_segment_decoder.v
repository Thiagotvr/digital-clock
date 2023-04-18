module seven_segment_decoder(
  input [5:0] value,
  output reg [6:0] segments
);

  always @* begin
    case (value)
      6'b000000: segments = 7'b1000000; // 0
      6'b000001: segments = 7'b1111001; // 1
      6'b000010: segments = 7'b0100100; // 2
      6'b000011: segments = 7'b0110000; // 3
      6'b000100: segments = 7'b0011001; // 4
      6'b000101: segments = 7'b0010010; // 5
      6'b000110: segments = 7'b0000010; // 6
      6'b000111: segments = 7'b1111000; // 7
      6'b001000: segments = 7'b0000000; // 8
      6'b001001: segments = 7'b0010000; // 9
		default: segments = 7'b1111111; 	 // default
		endcase
	end
endmodule

