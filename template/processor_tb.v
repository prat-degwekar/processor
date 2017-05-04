`include "processor.v"

module processor_tb;

      reg clock;

   processor p(clock);

   initial
     clock = 1'b1;
     
 

   always begin
     #1 clock = ~clock;
    
     
     end
     
   initial
     #310 $finish;
     
   
endmodule 
