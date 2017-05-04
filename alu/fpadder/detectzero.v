module detectzero (out_mant,out_mant1,pos);
input [24:0]out_mant;
output reg [22:0]out_mant1;
output reg [7:0]pos;
integer i,j;

always@(out_mant)
begin	
	j=0;
	for (i = 0; i<=24; i = i + 1)
	begin
		if(out_mant[i]==1 )
		j=i;
	end 
    pos=j;
	j=j-1;
	out_mant1=0;
	for (i = 22; i>=0 && j>=0; i = i - 1)
	begin
		out_mant1[i]=out_mant[j];
		j=j-1;
	end 
end

endmodule
