module pes_fmul(
  input clk,
  input reset,
  input signed [7:0] x_fraction,
  input signed [7:0] y_fraction,
  output reg signed [15:0] product_fraction
);

  reg [15:0] product;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      product <= 16'b0;
    end else begin
      product <= x_fraction * y_fraction;
    end
  end

  always @(posedge clk) begin
    if (reset) begin
      product_fraction <= 16'b0;
    end else begin
      product_fraction <= product;
    end
  end

endmodule
