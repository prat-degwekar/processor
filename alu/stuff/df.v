module df(q,d,c);
output q;
 input d,c;
 reg q;
 initial 
	   begin
		   q<=1'b0;
      	  end
	always @ (posedge c)
	   begin 
		 q<=d;
	   end
endmodule
