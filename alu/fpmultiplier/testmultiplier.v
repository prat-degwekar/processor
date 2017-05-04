`include "multiplier.v"


module FPM_32_tb;
  reg [31:0] x = 32'd0, y = 32'd0;
  reg clk = 1;
  wire [31:0] m;

  integer clkCycle = 0;


  FPM_32 P(x, y, m, clk);


  always begin
    #1 clk = ~clk;
  end

  always begin
    #2 clkCycle = clkCycle + 1;
  end

  initial begin
    $monitor("\n\nTime: %3d \tClkCycle: %d\nInput:\n\n  x = %b\n  y = %b\n\nOutput:\n\n  m = %b\n\n\n", $time, clkCycle, x, y, m);

    #0 //clk cycle 0 time 0
    clk=0;
    x = 4'h0;
    y = 4'h0;


    #2 //clk cycle 1 time 2

   
    
    #1 //clk cycle 2 time 4

    #1//clk cycle 2-3 time 5
    x = 32'b1011111010010001001100101011010;
    y = 32'b01000011111110100010000000000000;

    #1 //clk cycle 3 time 6
	#1

    //clk cycle 3-4 time 7

	x = 32'b10111111000000100100010100010000;
    y = 32'b10111111000000000000000000000000;
   #2
    

	x = 32'bz;
    y = 32'b10111111000000000000001011100100;
   
 
    #1 //clk cycle 4 time 8

  #100



    $finish; 

  end

initial
 begin
    $dumpfile("test.vcd");
    $dumpvars;
 end
endmodule
