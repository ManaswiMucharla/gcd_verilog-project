
module tb;
reg clk,rst;
reg [7:0]A,B;
reg start;
wire done;
wire [7:0]gcd;

top dut(.*);

always #3 clk = ~clk;

initial begin
  clk =0;
  start = 0;
  rst = 1;
  A = 0;
  B = 0;

  @(negedge clk);
  rst =0;
  A = 18;
  B = 12;
  start = 1;

  @(negedge clk);
  start = 0;
  wait(done == 1);
  $display("a = %d,%d,gcd=%d",A,B,gcd);
  #10;
  $finish;
  end
endmodule
