module clock(
  input clk,
  input reset,
  output [6:0] hour_segments,
  output [6:0] minute_segments,
  output [6:0] second_segments
);

  wire [4:0] hours;
  wire [5:0] minutes;
  wire [5:0] seconds;

  // Divisor de frequência para o sinal de clock
  wire clk_div;
  clock_divider divider(.clk(clk), .reset(reset), .div(clk_div));

  // Contadores para horas, minutos e segundos
  hour_counter hour(.clk(clk_div), .reset(reset), .hours(hours));
  minute_counter minute(.clk(clk_div), .reset(reset), .minutes(minutes));
  second_counter second(.clk(clk_div), .reset(reset), .seconds(seconds));

  // Controle de exibição de hora/minuto/segundo
  reg [3:0] count = 0;
  wire [6:0] hour_value;
  wire [6:0] minute_value;
  wire [6:0] second_value;

  always @(posedge clk_div) begin
    if (reset) begin
      count <= 0;
    end else begin
      count <= count + 1;
    end

    if (count == 4) begin
      count <= 0;
    end
  end

  seven_segment_decoder decoder_h(.value(hours), .segments(hour_value));
  seven_segment_decoder decoder_m(.value(minutes), .segments(minute_value));
  seven_segment_decoder decoder_s(.value(seconds), .segments(second_value));

  always @* begin
    case (count)
      0, 1: begin
        hour_segments <= hour_value;
        minute_segments <= minute_value;
        second_segments <= 7'b1111111;
      end
      2, 3: begin
        hour_segments <= 7'b1111111;
        minute_segments <= second_value;
        second_segments <= 7'b1111111;
      end
    endcase
  end

endmodule

