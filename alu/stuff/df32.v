module df32(q,d,c);
output [31:0]q;
 input [31:0]d;
 input c;
 reg [31:0]q;
       initial 
	   begin
		   q<=32'd0;
       end

	   always @ (posedge c)
	   begin 
		 q<=d;
	   end
endmodule
