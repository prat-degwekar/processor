module shifter(select,a[22:0],b[22:0],shift,a_mant,b_mant);
output reg [22:0]a_mant,b_mant;								//shift magnitude
input [1:0]select;
input [8:0]shift;	
input [22:0]a,b;

	always@(a or b or select or shift)
	begin
		if(select==2)
		begin
			b_mant=b>>shift;
			b_mant[22-shift+1]=1;
			a_mant=a;
		end
		else if(select==1)
		begin
			a_mant=a>>shift;
			a_mant[22-shift+1]=1;
			b_mant=b;
		end
		else if(select ==0)
		begin 
			a_mant=a;
			b_mant=b;
		end
	end
endmodule
