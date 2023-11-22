`timescale 1ns / 1ps

module pes_fmul_tb;

  reg clk;
  reg reset;
  reg signed [7:0] x_fraction;
  reg signed [7:0] y_fraction;
  wire signed [15:0] product_fraction;

  // Instantiate the module
  pes_fmul uut (
    .clk(clk),
    .reset(reset),
    .x_fraction(x_fraction),
    .y_fraction(y_fraction),
    .product_fraction(product_fraction)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initial stimulus
  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, pes_fmul_tb);

    // Test Case 1
    reset = 1;
    x_fraction = 8'b01010101;
    y_fraction = 8'b00110011;
    #10 reset = 0;

    // Test Case 2
    #100 x_fraction = 8'b11111111;
    y_fraction = 8'b00000001;

    // Test Case 3
    #100 reset = 1;
    x_fraction = 8'b10101010;
    y_fraction = 8'b01010101;
    #10 reset = 0;

    // Test Case 4
    #100 reset = 1;
    x_fraction = 8'b00001111;
    y_fraction = 8'b00001111;
    #10 reset = 0;

    // You can add more test cases here...

    #200 $finish;
  end

endmodule
